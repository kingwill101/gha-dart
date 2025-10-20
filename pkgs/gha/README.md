# gha

[![pub package](https://img.shields.io/pub/v/gha.svg)](https://pub.dev/packages/gha)
[![Dart](https://img.shields.io/badge/dart-%3E%3D3.9.2-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)
[![Build Status](https://github.com/kingwill101/gha-dart/workflows/CI/badge.svg)](https://github.com/kingwill101/gha-dart/actions)
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow.svg)](https://www.buymeacoffee.com/kingwill101)

`gha` provides strongly typed Dart models for GitHub Actions workflows.
The types mirror the `gha-ts3` TypeScript definitions so you can create and
serialize workflows entirely in Dart. Serialization is handled by
[`dart_mappable`](https://pub.dev/packages/dart_mappable), and YAML output is
produced with [`json2yaml`](https://pub.dev/packages/json2yaml).

## Features

- 🎯 **Type-safe workflow definitions** - Catch errors at compile-time
- 🔧 **Helper functions for common actions** - Simplified API for popular GitHub Actions
- 📦 **Support for all major setup actions** - Node, Python, Java, Go, .NET, and more
- 🚀 **Artifact and cache management** - Easy upload/download and caching
- 📄 **GitHub Pages deployment** - Built-in helpers for Pages workflows
- 🔐 **GitHub App token generation** - Simplified authentication

## Quick Start

```dart
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(
    name: 'CI',
    on: WorkflowTriggers.simple(['push', 'pull_request']),
    jobs: {
      'build': Job(
        name: 'Build',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: const [
          Step(name: 'Checkout', uses: 'actions/checkout@v4'),
          Step(name: 'Test', run: 'dart test'),
        ],
      ),
    },
  );

  // Print YAML to console
  print(workflow.toYamlString());

  // Or save directly to a file
  workflow.save(); // Saves to .github/workflows/ci.generated.yaml
}
```

## Saving Workflows

The `save()` extension method allows you to write workflows directly to files:

```dart
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(name: 'CI', /* ... */);

  // Save with default settings
  workflow.save(); // Saves to .github/workflows/ci.generated.yaml

  // Save with custom filename
  workflow.save(filename: 'my-workflow.yaml');

  // Save to custom directory
  workflow.save(directory: 'custom/workflows');

  // Both custom directory and filename
  workflow.save(directory: 'workflows', filename: 'build.yaml');
}
```

The filename is automatically derived from the workflow's `name` property (lowercase, spaces to hyphens) unless you provide a custom filename.

## Using Action Helpers

The package includes type-safe helpers for common GitHub Actions:

```dart
import 'package:gha/gha.dart';

void main() {
  final workflow = Workflow(
    name: 'CI with Helpers',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'build': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          // Use helper functions instead of raw strings
          checkout(CheckoutOptions(fetchDepth: 1)),
          setupNode(SetupNodeOptions(
            nodeVersion: '20',
            cache: 'npm',
          )),
          Step(run: 'npm ci'),
          Step(run: 'npm test'),
          uploadArtifact(UploadArtifactOptions(
            path: 'coverage/',
            name: 'coverage-report',
            retentionDays: 7,
          )),
        ],
      ),
    },
  );

  print(workflow.toYamlString());
}
```

### Available Action Helpers

**Common Actions:**
- `checkout()` - Check out repository code
- `githubScript()` - Run JavaScript with Octokit
- `createGitHubAppToken()` - Generate GitHub App tokens

**Artifact Management:**
- `uploadArtifact()` - Upload build artifacts
- `downloadArtifact()` - Download artifacts

**Caching:**
- `cache()` - Cache and restore dependencies
- `cacheRestore()` - Restore cache only
- `cacheSave()` - Save cache only

**Language/Runtime Setup:**
- `setupNode()` - Set up Node.js
- `setupPython()` - Set up Python
- `setupJava()` - Set up Java
- `setupGo()` - Set up Go
- `setupDotnet()` - Set up .NET

**GitHub Pages:**
- `configurePages()` - Configure Pages
- `uploadPagesArtifact()` - Upload Pages artifact
- `deployPages()` - Deploy to Pages

For detailed documentation on each action helper, see [lib/src/actions_README.md](lib/src/actions_README.md).

## Examples

We provide focused examples for different use cases:

```bash
# Basic CI workflow
dart run example/01_basic_ci.dart

# Multi-language builds
dart run example/02_multi_language.dart

# Caching strategies
dart run example/03_caching.dart

# Artifact management
dart run example/04_artifacts.dart

# GitHub Pages deployment
dart run example/05_github_pages.dart

# GitHub Script automation
dart run example/06_github_script.dart

# GitHub App tokens
dart run example/07_github_app_token.dart

# Matrix builds
dart run example/08_matrix_builds.dart
```

See [example/README.md](example/README.md) for detailed descriptions of each example.

## Inspiration

This package is inspired by [JLarky/gha-ts](https://github.com/JLarky/gha-ts), bringing similar type-safe workflow definitions to Dart.
