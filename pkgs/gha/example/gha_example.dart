import 'package:gha/gha.dart';

void main(List<String> arguments) {
  final workflow = Workflow(
    name: 'CI',
    on: WorkflowTriggers.simple(['push', 'pull_request']),
    jobs: {
      'build': Job(
        name: 'Build and Test',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: const [
          Step(name: 'Checkout', uses: 'actions/checkout@v4'),
          Step(
            name: 'Setup Dart',
            uses: 'dart-lang/setup-dart@v1',
            withArguments: {'sdk': 'stable'},
          ),
          Step(name: 'Install dependencies', run: 'dart pub get'),
          Step(name: 'Run tests', run: 'dart test'),
        ],
      ),
    },
  );

  print(workflow.toYamlString());
}
