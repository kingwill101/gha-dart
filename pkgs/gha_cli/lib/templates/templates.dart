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
    on: WorkflowTriggers(
      push: TriggerConfig(
        tags: ['v*.*.*'],
      ),
    ),
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

String basicTemplate(String workflowName) {
  final displayName = _toTitleCase(workflowName);
  final jobId = _sanitizeJobId(workflowName);

  return '''
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(
    name: '$displayName',
    on: WorkflowTriggers.simple(['workflow_dispatch']),
    jobs: {
      '$jobId': Job(
        name: '$displayName',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          Step(name: 'Run script', run: 'echo "Customize $displayName"'),
        ],
      ),
    },
  );

  workflow.save();
}
''';
}

String _toTitleCase(String input) {
  final words = input
      .replaceAll(RegExp(r'[_\-\s]+'), ' ')
      .trim()
      .split(' ')
      .where((word) => word.isNotEmpty)
      .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
      .toList();
  return words.isEmpty ? 'Workflow' : words.join(' ');
}

String _sanitizeJobId(String input) {
  final cleaned = input
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
      .replaceAll(RegExp(r'^_+|_+$'), '');
  if (cleaned.isEmpty) {
    return 'workflow_job';
  }
  final startsWithLetter = RegExp(r'^[a-z]').hasMatch(cleaned);
  return startsWithLetter ? cleaned : 'workflow_$cleaned';
}
