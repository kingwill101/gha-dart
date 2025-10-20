/// Templates for workflow generation scripts
library;

const ciTemplate = '''
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(
    name: 'CI',
    on: WorkflowTriggers.simple(['push', 'pull_request']),
    jobs: {
      'build': Job(
        name: 'Build and Test',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupDart(
            sdk: 'stable',
          ),
          Step(name: 'Install dependencies', run: 'dart pub get'),
          Step(name: 'Analyze', run: 'dart analyze'),
          Step(name: 'Format check', run: 'dart format --set-exit-if-changed .'),
          Step(name: 'Run tests', run: 'dart test'),
        ],
      ),
    },
  );

  workflow.save();
}
''';

const publishTemplate = '''
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(
    name: 'Publish',
    on: WorkflowTriggers({
      'push': TriggerConfig(
        tags: ['v*.*.*'],
      ),
    }),
    jobs: {
      'publish': Job(
        name: 'Publish to pub.dev',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        permissions: Permissions(
          idToken: PermissionLevel.write,
        ),
        steps: [
          checkout(),
          setupDart(
            sdk: 'stable',
          ),
          Step(name: 'Install dependencies', run: 'dart pub get'),
          Step(name: 'Verify package', run: 'dart pub publish --dry-run'),
          Step(
            name: 'Publish package',
            run: 'dart pub publish --force',
          ),
        ],
      ),
    },
  );

  workflow.save();
}
''';
