import 'package:gha/gha.dart';

void main() {
  dartRun(String name) {
    return Job(
      name: 'Publish($name)',
      runsOn: RunnerSpec.single('ubuntu-latest'),
      steps: [
        checkout(),
        setupDart(sdk: 'stable'),
        Step(
          name: 'Install dependencies',
          run: 'dart pub get',
          workingDirectory: "pkgs/$name",
        ),
        Step(
          name: 'Verify package',
          run: 'dart pub publish --dry-run',
          workingDirectory: "pkgs/$name",
        ),
        Step(
          name: 'Publish package',
          run: 'dart pub publish --force',
          workingDirectory: "pkgs/$name",
        ),
      ],
    );
  }

  final workflow = Workflow(
    name: 'Publish',
    on: WorkflowTriggers(push: TriggerConfig(tags: ['v*.*.*'])),
    jobs: {
      for (final name in ['gha', 'gha_cli']) name: dartRun(name),
    },
  );

  workflow.save();
}
