import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:gha_cli/templates/templates.dart';
import 'package:path/path.dart' as p;

class InitCommand extends Command<int> {
  InitCommand() {
    argParser.addFlag(
      'force',
      abbr: 'f',
      help: 'Overwrite existing files',
      negatable: false,
    );
  }

  @override
  String get name => 'init';

  @override
  String get description =>
      'Initialize a GitHub Actions workflow generation script';

  @override
  String get invocation => 'gha init [workflow-name]';

  @override
  Future<int> run() async {
    final args = argResults!;
    final rest = args.rest;
    final force = args['force'] as bool;

    // Default to 'ci' if no workflow name provided
    final workflowName = rest.isEmpty ? 'ci' : rest.first;

    // Get the appropriate template
    final templateContent = _getTemplate(workflowName);
    if (templateContent == null) {
      stderr.writeln('Unknown workflow template: $workflowName');
      stderr.writeln('Available templates: ci, publish');
      return 1;
    }

    // Ensure .github/workflows directory exists
    final workflowsDir = Directory(p.join('.github', 'workflows'));
    if (!workflowsDir.existsSync()) {
      workflowsDir.createSync(recursive: true);
      stdout.writeln('Created .github/workflows/ directory');
    }

    // Create the workflow dart file in .github/workflows
    final workflowFile = File(
      p.join('.github', 'workflows', '$workflowName.dart'),
    );
    if (workflowFile.existsSync() && !force) {
      stderr.writeln(
        'Error: .github/workflows/$workflowName.dart already exists',
      );
      stderr.writeln('Use --force to overwrite');
      return 1;
    }

    workflowFile.writeAsStringSync(templateContent);
    stdout.writeln('Created .github/workflows/$workflowName.dart');

    stdout.writeln('');
    stdout.writeln('✓ Initialization complete!');
    stdout.writeln('');
    stdout.writeln('Next steps:');
    stdout.writeln(
      '  1. Edit .github/workflows/$workflowName.dart to customize your workflow',
    );
    stdout.writeln('  2. Run: dart run gha_cli generate');
    stdout.writeln('');

    return 0;
  }

  String? _getTemplate(String name) {
    switch (name) {
      case 'ci':
        return ciTemplate;
      case 'publish':
        return publishTemplate;
      default:
        return null;
    }
  }
}
