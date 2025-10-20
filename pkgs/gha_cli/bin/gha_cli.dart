import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:gha_cli/commands/generate_command.dart';
import 'package:gha_cli/commands/init_command.dart';

void main(List<String> arguments) async {
  final runner =
      CommandRunner<int>(
          'gha',
          'A CLI tool for generating GitHub Actions workflows in Dart',
        )
        ..addCommand(InitCommand())
        ..addCommand(GenerateCommand());

  try {
    final result = await runner.run(arguments);
    exit(result ?? 0);
  } on UsageException catch (e) {
    stderr.writeln(e.message);
    stderr.writeln();
    stderr.writeln(e.usage);
    exit(64);
  } catch (e) {
    stderr.writeln('Error: $e');
    exit(1);
  }
}
