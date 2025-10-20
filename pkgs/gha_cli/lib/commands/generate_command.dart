import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:path/path.dart' as p;

class GenerateCommand extends Command<int> {
  GenerateCommand() {
    argParser.addOption(
      'dir',
      abbr: 'd',
      help: 'Directory containing workflow generation scripts',
      defaultsTo: '.github/workflows',
    );
    argParser.addFlag(
      'verbose',
      abbr: 'v',
      help: 'Show verbose output',
      negatable: false,
    );
  }

  @override
  String get name => 'generate';

  @override
  String get description => 'Generate GitHub Actions workflow YAML files';

  @override
  String get invocation => 'gha generate [options]';

  @override
  Future<int> run() async {
    final args = argResults!;
    final workflowDir = args['dir'] as String;
    final verbose = args['verbose'] as bool;

    // Check if workflow directory exists
    final dir = Directory(workflowDir);
    if (!dir.existsSync()) {
      stderr.writeln('Error: Workflow directory not found: $workflowDir');
      stderr.writeln('');
      stderr.writeln(
        'Run "dart run gha_cli init [workflow-name]" to create a workflow script',
      );
      return 1;
    }

    // Find all .dart files in the workflow directory
    final dartFiles = dir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))
        .toList();

    if (dartFiles.isEmpty) {
      stderr.writeln('Error: No workflow scripts found in $workflowDir/');
      stderr.writeln('');
      stderr.writeln(
        'Run "dart run gha_cli init [workflow-name]" to create a workflow script',
      );
      return 1;
    }

    if (verbose) {
      stdout.writeln('Found ${dartFiles.length} workflow script(s)');
      stdout.writeln('');
    }

    var hasErrors = false;
    var successCount = 0;

    // Execute each workflow script
    for (final file in dartFiles) {
      final scriptName = p.basename(file.path);

      if (verbose) {
        stdout.writeln('Executing: $scriptName');
      }

      final result = await Process.run('dart', [
        'run',
        file.path,
      ], runInShell: true);

      if (result.exitCode != 0) {
        stderr.writeln('✗ Error executing $scriptName');
        if (result.stderr.toString().isNotEmpty) {
          stderr.writeln(result.stderr);
        }
        hasErrors = true;
        continue;
      }

      // The script's output (from workflow.save()) is printed to stdout
      final output = result.stdout.toString();
      if (output.isNotEmpty) {
        stdout.write(output);
      }

      successCount++;
    }

    stdout.writeln('');
    if (hasErrors) {
      stdout.writeln(
        '⚠ Generated $successCount/${dartFiles.length} workflow(s) with errors',
      );
      return 1;
    } else {
      stdout.writeln('✓ Successfully generated $successCount workflow(s)');
      return 0;
    }
  }
}
