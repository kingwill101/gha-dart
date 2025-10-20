import 'package:gha/gha.dart';
import 'package:test/test.dart';

void main() {
  group('Workflow YAML codec', () {
    test('toYamlString cleans multi-line runs and escapes expressions', () {
      final workflow = Workflow(
        name: 'Codec demo',
        on: WorkflowTriggers.simple(['push']),
        jobs: {
          'build': Job(
            runsOn: 'ubuntu-latest',
            steps: [
              Step(
                name: 'Complex condition',
                ifCondition:
                    "github.event_name == 'push' && contains(github.ref, 'release') && !cancelled()",
                run: '''
                  echo "Line 1"
                  echo "Line 2"
                ''',
              ),
            ],
          ),
        },
      );

      final yaml = workflow.toYamlString();

      expect(
        yaml,
        contains(
          'if: "github.event_name == \'push\' && contains(github.ref, \'release\') && !cancelled()"',
        ),
      );
      expect(yaml.contains('                        echo "Line 1"'), isFalse);
    });

    test('fromYamlString parses simple workflow definitions', () {
      const yaml = '''
name: Example
on: [push, pull_request]
permissions: read-all
jobs:
  build:
    runs-on: ubuntu-latest
    permissions: write-all
    steps:
      - run: echo Hello
''';

      final workflow = Workflow.fromYamlString(yaml);

      expect(workflow.name, 'Example');
      expect(workflow.on.push, isNotNull);
      expect(workflow.on.pullRequest, isNotNull);
      expect(workflow.permissions?.shorthand, PermissionsShorthand.readAll);

      final build = workflow.jobs['build'];
      expect(build, isNotNull);
      expect(build!.runsOn, 'ubuntu-latest');
      expect(build.permissions?.shorthand, PermissionsShorthand.writeAll);
      expect(build.steps, hasLength(1));
      expect(build.steps!.first.run, 'echo Hello');
    });

    test('round-trips between model and YAML', () {
      final original = Workflow(
        name: 'Roundtrip',
        on: WorkflowTriggers.simple(['workflow_dispatch']),
        jobs: {
          'ci': Job(
            runsOn: 'ubuntu-latest',
            steps: [Step(name: 'Smoke', run: 'echo 1\necho 2')],
          ),
        },
      );

      final yaml = original.toYamlString();
      final reparsed = Workflow.fromYamlString(yaml);

      expect(reparsed.encode(), equals(original.encode()));
    });

    test('rejects mutually exclusive trigger filters', () {
      final workflow = Workflow(
        name: 'Invalid filters',
        on: WorkflowTriggers(
          push: const TriggerConfig(
            branches: ['main'],
            branchesIgnore: ['develop'],
          ),
        ),
        jobs: {'build': const Job(runsOn: 'ubuntu-latest')},
      );

      expect(
        () => workflow.toYamlString(),
        throwsA(isA<WorkflowValidationException>()),
      );
    });

    test('fromYamlString rejects invalid trigger filters', () {
      const yaml = '''
name: Invalid filters
on:
  push:
    branches: [main]
    branches-ignore: [develop]
jobs:
  build:
    runs-on: ubuntu-latest
''';

      expect(
        () => Workflow.fromYamlString(yaml),
        throwsA(isA<WorkflowValidationException>()),
      );
    });
  });
}
