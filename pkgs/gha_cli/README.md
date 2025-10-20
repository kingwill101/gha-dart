# gha_cli

[![pub package](https://img.shields.io/pub/v/gha_cli.svg)](https://pub.dev/packages/gha_cli)
[![Dart](https://img.shields.io/badge/dart-%3E%3D3.9.2-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)
[![Build Status](https://github.com/kingwill101/gha-dart/workflows/CI/badge.svg)](https://github.com/kingwill101/gha-dart/actions)
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow.svg)](https://www.buymeacoffee.com/kingwill101)

A command-line tool for generating GitHub Actions workflows using Dart code.

## Installation

From your Dart project root:

```bash
dart pub global activate --source path pkgs/gha_cli
```

Or run directly from the workspace:

```bash
dart run gha_cli <command>
```

## Quick Start

### 1. Initialize workflow scripts

```bash
# Initialize with CI template (default)
dart run gha_cli init

# Initialize with publish workflow template
dart run gha_cli init publish
```

This creates individual Dart files in `.github/workflows/` directory:
- `.github/workflows/ci.dart` - CI workflow script
- `.github/workflows/publish.dart` - Publish workflow script

### 2. Customize your workflows

Edit the generated Dart files in `.github/workflows/`. For example, `.github/workflows/ci.dart`:

```dart
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
          Step(
            name: 'Setup Dart',
            uses: 'dart-lang/setup-dart@v1',
            withArguments: {'sdk': 'stable'},
          ),
          Step(name: 'Install dependencies', run: 'dart pub get'),
          Step(name: 'Analyze', run: 'dart analyze'),
          Step(name: 'Run tests', run: 'dart test'),
        ],
      ),
    },
  );

  // Save workflow to .github/workflows/ci.generated.yaml
  workflow.save();
}
```

### 3. Generate workflow YAML files

```bash
dart run gha_cli generate
```

This executes all `.dart` files in `.github/workflows/` and generates corresponding `.generated.yaml` files.

## Commands

### `init [workflow-name]`

Initialize a new workflow script in `.github/workflows/`.

**Usage:**
```bash
dart run gha_cli init [workflow-name] [options]
```

**Templates:**
- `ci` (default) - Simple CI workflow with build and test
- `publish` - Pub.dev publishing workflow

**Options:**
- `-f, --force` - Overwrite existing file

**Examples:**
```bash
# Create CI workflow (default)
dart run gha_cli init

# Create publish workflow
dart run gha_cli init publish

# Create custom workflow
dart run gha_cli init deploy

# Overwrite existing file
dart run gha_cli init ci --force
```

### `generate`

Generate GitHub Actions workflow YAML files from Dart scripts.

**Usage:**
```bash
dart run gha_cli generate [options]
```

**Options:**
- `-d, --dir <path>` - Directory containing workflow scripts (default: `.github/workflows`)
- `-v, --verbose` - Show verbose output

**Examples:**
```bash
# Generate all workflows
dart run gha_cli generate

# Generate with verbose output
dart run gha_cli generate --verbose

# Generate from custom directory
dart run gha_cli generate --dir custom/workflows
```

## Project Structure

When you use the CLI, your project will have this structure:

```
.github/
  └── workflows/
      ├── ci.dart                # Source: CI workflow definition
      ├── ci.generated.yaml      # Generated: CI workflow YAML
      ├── publish.dart           # Source: Publish workflow definition
      └── publish.generated.yaml # Generated: Publish workflow YAML
```

- **`.dart` files**: Your workflow definitions using the `gha` package
- **`.generated.yaml` files**: Auto-generated YAML files used by GitHub Actions

## Multiple Workflows

Create multiple workflow files by running `init` multiple times:

```bash
dart run gha_cli init ci
dart run gha_cli init publish
dart run gha_cli init deploy
```

Each workflow is its own Dart file that generates its own YAML file:

**.github/workflows/ci.dart**:
```dart
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(name: 'CI', /* ... */);
  workflow.save();
}
```

**.github/workflows/deploy.dart**:
```dart
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(name: 'Deploy', /* ... */);
  workflow.save();
}
```

Run `dart run gha_cli generate` to generate YAML for all workflows.

## Custom Filenames and Directories

You can customize where individual workflows are saved using the `save()` method:

```dart
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(name: 'CI', /* ... */);

  // Default: .github/workflows/ci.generated.yaml
  workflow.save();

  // Custom filename
  workflow.save(filename: 'my-workflow.yaml');

  // Custom directory
  workflow.save(directory: 'custom/workflows');

  // Both
  workflow.save(directory: 'workflows', filename: 'build.yaml');
}
```

## Integration with CI

Add this to your workflow to ensure generated workflows stay in sync:

```yaml
- name: Check workflows are up to date
  run: |
    dart run gha_cli generate
    if ! git diff --exit-code .github/workflows/*.yaml; then
      echo "Workflows are out of sync. Run 'dart run gha_cli generate'"
      exit 1
    fi
```

## Best Practices

1. **Version Control**: Commit both `.dart` and `.generated.yaml` files
2. **One Workflow Per File**: Keep each workflow in its own Dart file for clarity
3. **Code Reuse**: Create helper functions for common job configurations
4. **Type Safety**: Leverage Dart's type system to catch errors at compile time
5. **Naming Convention**: Use descriptive names for workflow files (e.g., `ci.dart`, `publish.dart`, `deploy.dart`)

## Tips

### Sharing Common Steps

Create helper functions in a separate file:

```dart
// .github/workflows/common.dart
import 'package:gha/gha.dart';

List<Step> dartSetup() => [
  checkout(),
  Step(uses: 'dart-lang/setup-dart@v1', withArguments: {'sdk': 'stable'}),
  Step(run: 'dart pub get'),
];
```

Then import and use in your workflows:

```dart
// .github/workflows/ci.dart
import 'package:gha/gha.dart';
import 'common.dart';

void main() {
  final workflow = Workflow(
    name: 'CI',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'test': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [...dartSetup(), Step(run: 'dart test')],
      ),
    },
  );
  workflow.save();
}
```

### Custom Workflows

For workflows not covered by templates, use `init` with any name and then edit:

```bash
dart run gha_cli init deploy
# Edit .github/workflows/deploy.dart
dart run gha_cli generate
```

## Examples

See the [gha package examples](../gha/example/) for more workflow patterns.

## Troubleshooting

### No workflows found

```
Error: No workflow scripts found in .github/workflows/
```

**Solution:** Run `dart run gha_cli init` to create a workflow script.

### Script execution failed

```
✗ Error executing ci.dart
```

**Solution:** Check for syntax errors in your Dart file:
```bash
dart analyze .github/workflows/ci.dart
```

## License

MIT License - see [LICENSE](LICENSE) file for details.