import 'package:gha/gha.dart';

void main() {
  // Basic CI workflow with Node.js
  final workflow = Workflow(
    name: 'CI',
    on: WorkflowTriggers(
      push: TriggerConfig(branches: ['main']),
      pullRequest: TriggerConfig(branches: ['main']),
    ),
    jobs: {
      'build': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(fetchDepth: 1),
          setupNode(nodeVersion: '20', cache: 'npm'),
          Step(name: 'Install dependencies', run: 'npm ci'),
          Step(name: 'Run tests', run: 'npm test'),
          uploadArtifact(
            path: 'coverage/',
            name: 'coverage-report',
            retentionDays: 7,
          ),
        ],
      ),
    },
  );

  print(workflow.toYamlString());
}
