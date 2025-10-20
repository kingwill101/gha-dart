import 'package:gha/gha.dart';
import 'package:test/test.dart';

void main() {
  test('encodes a simple workflow', () {
    final workflow = Workflow.singleJob(
      name: 'CI',
      runName: 'CI run',
      events: const ['push'],
      jobId: 'build',
      job: Job(
        runsOn: const RunnerSpec.single('ubuntu-latest'),
        steps: const [Step(uses: 'actions/checkout@v4')],
        env: const {'DART_VM_OPTIONS': '--enable-asserts'},
      ),
    );

    final encoded = workflow.encode();

    expect(encoded['name'], 'CI');
    expect(encoded['run-name'], 'CI run');
    expect(encoded['on'], equals({'push': <String, dynamic>{}}));
    expect(
      encoded['jobs'],
      equals({
        'build': {
          'runs-on': 'ubuntu-latest',
          'env': {'DART_VM_OPTIONS': '--enable-asserts'},
          'steps': [
            {'uses': 'actions/checkout@v4'},
          ],
        },
      }),
    );
  });

  test('supports reusable jobs, permissions, and matrix strategies', () {
    final workflow = Workflow(
      on: WorkflowTriggers.simple(const ['workflow_dispatch']),
      permissions: const Permissions.readAll(),
      concurrency: r'deploy-${{ github.ref }}',
      jobs: {
        'call': Job(
          uses: './.github/workflows/reusable.yml',
          withInputs: const {'environment': 'production'},
          secrets: 'inherit',
          permissions: const Permissions.writeAll(),
          concurrency: const Concurrency(
            group: 'deployments',
            cancelInProgress: true,
          ),
        ),
        'build': Job(
          runsOn: RunnerSpec.group('self-hosted', labels: ['linux', 'x64']),
          needs: 'call',
          env: const {'SHOULD_DEPLOY': true},
          container: const ContainerReference(
            image: 'ubuntu:22.04',
            ports: [8080],
          ),
          strategy: JobStrategy(
            matrix: Matrix(
              values: {
                'os': ['ubuntu-latest', 'windows-latest'],
                'dart': ['stable', 'beta'],
              },
              include: [
                {'os': 'ubuntu-latest', 'dart': 'main'},
              ],
            ),
            failFast: false,
          ),
          steps: const [
            Step(
              name: 'Echo context',
              run: r'echo "${{ github.workflow }}"',
              env: {'VERBOSE': true, 'ATTEMPTS': 3},
            ),
          ],
        ),
      },
    );

    final encoded = workflow.encode();

    expect(encoded['permissions'], 'read-all');
    expect(encoded['concurrency'], r'deploy-${{ github.ref }}');

    final callJob = encoded['jobs']['call'] as Map<String, dynamic>;
    expect(callJob['uses'], './.github/workflows/reusable.yml');
    expect(callJob['permissions'], 'write-all');
    expect(
      callJob['concurrency'],
      equals({'group': 'deployments', 'cancel-in-progress': true}),
    );

    final buildJob = encoded['jobs']['build'] as Map<String, dynamic>;
    expect(
      buildJob['runs-on'],
      equals({
        'group': 'self-hosted',
        'labels': ['linux', 'x64'],
      }),
    );
    expect(buildJob['needs'], 'call');
    expect(buildJob['env'], {'SHOULD_DEPLOY': true});
    expect(
      buildJob['strategy']['matrix'],
      equals({
        'os': ['ubuntu-latest', 'windows-latest'],
        'dart': ['stable', 'beta'],
        'include': [
          {'os': 'ubuntu-latest', 'dart': 'main'},
        ],
      }),
    );
    expect(
      buildJob['steps'],
      equals([
        {
          'name': 'Echo context',
          'run': r'echo "${{ github.workflow }}"',
          'env': {'VERBOSE': true, 'ATTEMPTS': 3},
        },
      ]),
    );
  });
}
