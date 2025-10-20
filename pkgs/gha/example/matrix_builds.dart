import 'package:gha/gha.dart';

void main() {
  // Matrix build workflow examples
  final workflow = Workflow(
    name: 'Matrix Builds',
    on: WorkflowTriggers(
      push: TriggerConfig(branches: ['main']),
      pullRequest: TriggerConfig(branches: ['main']),
    ),
    jobs: {
      'cross-platform': Job(
        name: 'Build on multiple platforms',
        strategy: JobStrategy(
          matrix: Matrix(
            values: {
              'os': ['ubuntu-latest', 'windows-latest', 'macos-latest'],
              'node': ['18', '20', '22'],
            },
          ),
        ),
        runsOn: RunnerSpec.expression(r'${{ matrix.os }}'),
        steps: [
          checkout(),
          setupNode(nodeVersion: r'${{ matrix.node }}', cache: 'npm'),
          Step(name: 'Install dependencies', run: 'npm ci'),
          Step(name: 'Run tests', run: 'npm test'),
          Step(name: 'Build', run: 'npm run build'),
        ],
      ),
      'python-versions': Job(
        name: 'Test Python versions',
        strategy: JobStrategy(
          matrix: Matrix(
            values: {
              'python-version': ['3.9', '3.10', '3.11', '3.12'],
              'os': ['ubuntu-latest', 'windows-latest'],
            },
          ),
        ),
        runsOn: RunnerSpec.expression(r'${{ matrix.os }}'),
        steps: [
          checkout(),
          setupPython(
            pythonVersion: r'${{ matrix.python-version }}',
            cache: 'pip',
          ),
          Step(run: 'pip install -r requirements.txt'),
          Step(run: 'pytest'),
        ],
      ),
      'include-exclude': Job(
        name: 'Matrix with include/exclude',
        strategy: JobStrategy(
          matrix: Matrix(
            values: {
              'os': ['ubuntu-latest', 'macos-latest', 'windows-latest'],
              'node': ['18', '20'],
            },
            include: [
              {'os': 'ubuntu-latest', 'node': '22', 'experimental': true},
            ],
            exclude: [
              {'os': 'windows-latest', 'node': '18'},
            ],
          ),
        ),
        runsOn: RunnerSpec.expression(r'${{ matrix.os }}'),
        continueOnError: r'${{ matrix.experimental || false }}',
        steps: [
          checkout(),
          setupNode(nodeVersion: r'${{ matrix.node }}', cache: 'npm'),
          Step(run: 'npm ci'),
          Step(run: 'npm test'),
        ],
      ),
      'multi-language': Job(
        name: 'Multi-language matrix',
        strategy: JobStrategy(
          matrix: Matrix(
            values: {
              'language': ['node', 'python', 'go'],
              'os': ['ubuntu-latest'],
            },
          ),
        ),
        runsOn: RunnerSpec.expression(r'${{ matrix.os }}'),
        steps: [
          checkout(),
          Step(
            name: 'Setup Node.js',
            ifCondition: r"matrix.language == 'node'",
            uses: 'actions/setup-node@v4',
            withArguments: {'node-version': '20', 'cache': 'npm'},
          ),
          Step(
            name: 'Setup Python',
            ifCondition: r"matrix.language == 'python'",
            uses: 'actions/setup-python@v5',
            withArguments: {'python-version': '3.11', 'cache': 'pip'},
          ),
          Step(
            name: 'Setup Go',
            ifCondition: r"matrix.language == 'go'",
            uses: 'actions/setup-go@v5',
            withArguments: {'go-version': '1.21', 'cache': true},
          ),
          Step(
            name: 'Test Node.js',
            ifCondition: r"matrix.language == 'node'",
            run: 'npm ci && npm test',
          ),
          Step(
            name: 'Test Python',
            ifCondition: r"matrix.language == 'python'",
            run: 'pip install -r requirements.txt && pytest',
          ),
          Step(
            name: 'Test Go',
            ifCondition: r"matrix.language == 'go'",
            run: 'go test ./...',
          ),
        ],
      ),
      'fail-fast-disabled': Job(
        name: 'Continue on failure',
        strategy: JobStrategy(
          failFast: false,
          matrix: Matrix(
            values: {
              'version': ['1.0', '2.0', '3.0'],
            },
          ),
        ),
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          Step(
            name: 'Test version',
            run: r'echo "Testing version ${{ matrix.version }}"',
          ),
        ],
      ),
    },
  );

  print(workflow.toYamlString());
}
