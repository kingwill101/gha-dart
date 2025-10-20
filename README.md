# GHA - Type-Safe GitHub Actions Workflows in Dart

[![pub package](https://img.shields.io/pub/v/gha.svg)](https://pub.dev/packages/gha)
[![Dart](https://img.shields.io/badge/dart-%3E%3D3.9.2-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)
[![Build Status](https://github.com/kingwill101/gha-dart/workflows/CI/badge.svg)](https://github.com/kingwill101/gha-dart/actions)
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow.svg)](https://www.buymeacoffee.com/kingwill101)

A monorepo containing packages for creating GitHub Actions workflows using type-safe Dart code.

## Packages

### 📦 [gha](pkgs/gha)
Core library providing strongly typed Dart models for GitHub Actions workflows. Create workflows programmatically with full type safety and IDE support.

```dart
import 'package:gha/gha.dart';

final workflow = Workflow(
  name: 'CI',
  on: WorkflowTriggers.simple(['push', 'pull_request']),
  jobs: {
    'build': Job(
      runsOn: RunnerSpec.single('ubuntu-latest'),
      steps: [
        checkout(),
        setupNode(nodeVersion: '20'),
        Step(run: 'npm ci'),
        Step(run: 'npm test'),
      ],
    ),
  },
);

print(workflow.toYamlString());
```

### 🔧 [gha_cli](pkgs/gha_cli)
Command-line tool for generating GitHub Actions workflow YAML files from Dart scripts.

```bash
# Initialize a workflow generation script
dart run gha_cli init

# Generate workflow YAML
dart run gha_cli generate
```

## Quick Start

### 1. Add to your project

Add to your `pubspec.yaml`:

```yaml
dev_dependencies:
  gha:
    path: path/to/gha/pkgs/gha
  gha_cli:
    path: path/to/gha/pkgs/gha_cli
```

Or use from a workspace:

```yaml
workspace:
  - .
  - path/to/gha/pkgs/gha
  - path/to/gha/pkgs/gha_cli
```

### 2. Initialize workflow script

```bash
dart run gha_cli init publish
```

This creates `tool/gha.dart` with a template workflow.

### 3. Customize your workflow

Edit `tool/gha.dart`:

```dart
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(
    name: 'CI',
    on: WorkflowTriggers.simple(['push', 'pull_request']),
    jobs: {
      'test': Job(
        name: 'Test',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
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
```

### 4. Generate YAML

```bash
dart run gha_cli generate
```

This creates `.github/workflows/ci.generated.yaml` with your workflow definition.

## Features

### Type-Safe Workflows
- ✅ Catch errors at compile time
- ✅ Full IDE autocomplete and documentation
- ✅ Refactor with confidence

### Action Helpers
Pre-built helpers for popular GitHub Actions:

```dart
// Checkout code
checkout(ref: 'main', fetchDepth: 1)

// Setup languages
setupNode(nodeVersion: '20', cache: 'npm')
setupPython(pythonVersion: '3.11', cache: 'pip')
setupJava(distribution: 'temurin', javaVersion: '17')
setupGo(goVersion: '1.21')
setupDotnet(dotnetVersion: '8.0')

// Artifacts
uploadArtifact(path: 'dist/', name: 'build-output')
downloadArtifact(name: 'build-output')

// Caching
cache(path: 'node_modules', key: 'npm-\${{ hashFiles("**/package-lock.json") }}')

// GitHub Pages
configurePages()
uploadPagesArtifact(path: 'build/')
deployPages()

// GitHub Script
githubScript(script: 'console.log("Hello from Actions!")')

// GitHub App tokens
createGitHubAppToken(appId: '\${{ secrets.APP_ID }}')
```

### Multiple Workflows

Generate multiple workflow files from a single script:

```dart
void main() {
  final ci = Workflow(name: 'CI', /* ... */);
  final deploy = Workflow(name: 'Deploy', /* ... */);

  print('--- ci ---');
  print(ci.toYamlString());
  print('--- deploy ---');
  print(deploy.toYamlString());
}
```

Generates:
- `.github/workflows/ci.generated.yaml`
- `.github/workflows/deploy.generated.yaml`

### CLI Commands

```bash
# Initialize with basic CI template
dart run gha_cli init

# Initialize with publish template
dart run gha_cli init publish

# Force overwrite existing file
dart run gha_cli init --force

# Generate workflows
dart run gha_cli generate

# Custom script location
dart run gha_cli generate --script my_workflow.dart

# Verbose output
dart run gha_cli generate --verbose
```

## Examples

See [pkgs/gha/example](pkgs/gha/example) for comprehensive examples:

- Basic CI workflows
- Multi-language builds
- Caching strategies
- Artifact management
- GitHub Pages deployment
- GitHub Script automation
- GitHub App tokens
- Matrix builds

## Why Use This?

### Before (YAML)
```yaml
name: CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm  # Easy to miss or misconfigure
      - run: npm ci
      - run: npm test
```

### After (Dart)
```dart
Workflow(
  name: 'CI',
  on: WorkflowTriggers.simple(['push', 'pull_request']),
  jobs: {
    'build': Job(
      runsOn: RunnerSpec.single('ubuntu-latest'),
      steps: [
        checkout(),
        setupNode(nodeVersion: '20', cache: 'npm'),  // Type-safe!
        Step(run: 'npm ci'),
        Step(run: 'npm test'),
      ],
    ),
  },
)
```

**Benefits:**
- 🎯 Type safety catches errors before commit
- 🔄 Reusable functions and components
- 📚 IDE documentation and autocomplete
- 🧪 Unit test your workflow logic
- 🔧 Refactoring tools work
- 📦 Share workflow patterns as packages

## Development

This is a Dart workspace. Install dependencies:

```bash
dart pub get
```

Run tests:

```bash
# Test core library
cd pkgs/gha && dart test

# Test CLI
cd pkgs/gha_cli && dart test
```

## Contributing

Contributions welcome! Please open an issue or PR.

## License

MIT

## Inspiration

Inspired by [JLarky/gha-ts](https://github.com/JLarky/gha-ts) - bringing type-safe workflow definitions to Dart.
