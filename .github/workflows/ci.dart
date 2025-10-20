import 'package:gha/gha.dart';

void main() {
  dartRun(String name) {
    return Job(
      name: 'Build and Test ($name)',
      runsOn: RunnerSpec.single('ubuntu-latest'),

      steps: [
        checkout(),
        setupDart(sdk: 'stable'),
        Step(name: 'Install dependencies', run: 'dart pub get'),
        Step(
          name: 'Analyze',
          run: 'dart analyze',
          workingDirectory: "pkgs/$name",
        ),
        Step(
          name: 'Format check',
          run: 'dart format --set-exit-if-changed .',
          workingDirectory: "pkgs/$name",
        ),
        Step(
          name: 'Run tests',
          run: 'dart test',
          workingDirectory: "pkgs/$name",
        ),
      ],
    );
  }

  final workflow = Workflow(
    name: 'CI',
    on: WorkflowTriggers.simple(['push', 'pull_request']),
    jobs: {
      for (final name in ['gha', 'gha_cli']) name: dartRun(name),
    },
  );

  workflow.save();
}
