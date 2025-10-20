# GitHub Actions Examples

This directory contains examples demonstrating how to use the `gha` package to create GitHub Actions workflows in Dart.

## Running Examples

Run any example with:

```bash
dart run example/<filename>.dart
```

For example:

```bash
dart run example/01_basic_ci.dart
```

## Examples Overview

### 01. Basic CI (`01_basic_ci.dart`)
A simple CI workflow demonstrating:
- Checkout action
- Node.js setup with caching
- Running tests
- Uploading artifacts

**Use this when:** You need a straightforward CI pipeline for a Node.js project.

### 02. Multi-Language (`02_multi_language.dart`)
Building and testing multiple languages in parallel:
- Python with pip caching
- Java with Maven
- Go with module caching
- .NET with NuGet

**Use this when:** You have a polyglot repository or want to test multiple language setups.

### 03. Caching (`03_caching.dart`)
Different caching strategies:
- NPM dependencies caching
- Separate cache restore and save operations
- Python pip caching with setup action

**Use this when:** You want to speed up workflows by caching dependencies.

### 04. Artifacts (`04_artifacts.dart`)
Artifact management across jobs:
- Upload build artifacts
- Download artifacts in dependent jobs
- Multiple artifact types (build output, coverage)
- Conditional deployment based on artifacts

**Use this when:** You need to share build outputs between jobs or persist artifacts.

### 05. GitHub Pages (`05_github_pages.dart`)
Deploying a static site to GitHub Pages:
- Build and upload Pages artifact
- Deploy with proper permissions
- Concurrency control
- Environment URLs

**Use this when:** You want to deploy documentation or a static site to GitHub Pages.

### 06. GitHub Script (`06_github_script.dart`)
Automation with JavaScript and Octokit:
- Auto-commenting on new issues
- Auto-labeling pull requests
- PR size checks with warnings

**Use this when:** You need custom automation logic using the GitHub API.

### 07. GitHub App Token (`07_github_app_token.dart`)
Using GitHub App tokens for elevated permissions:
- Generate app tokens
- Cross-repository access
- Creating releases
- Updating branch protection

**Use this when:** You need permissions beyond `GITHUB_TOKEN` or cross-repo access.

### 08. Matrix Builds (`08_matrix_builds.dart`)
Testing across multiple configurations:
- Cross-platform builds (Ubuntu, Windows, macOS)
- Multiple language versions
- Matrix include/exclude
- Multi-language matrices
- Fail-fast control

**Use this when:** You need to test on multiple OS/version combinations.

### Original Example (`gha_example.dart`)
The original basic example showing the core workflow structure.

### All-in-One (`actions_example.dart`)
Comprehensive example showing all action helpers (deprecated - use individual examples instead).

## Common Patterns

### Using Expressions

GitHub Actions expressions use `${{ ... }}` syntax. In Dart strings, use raw strings to avoid escaping:

```dart
// ✅ Good - raw string
Step(run: r'echo "Branch: ${{ github.ref }}"')

// ❌ Bad - requires escaping
Step(run: 'echo "Branch: \${{ github.ref }}"')
```

### Conditional Steps

Use the `ifCondition` parameter:

```dart
Step(
  ifCondition: r"github.ref == 'refs/heads/main'",
  run: 'npm run deploy',
)
```

### Job Dependencies

Use the `needs` parameter to create job dependencies:

```dart
'deploy': Job(
  needs: ['build', 'test'],
  steps: [/* ... */],
)
```

### Matrix Expressions

Reference matrix values with `${{ matrix.variable }}`:

```dart
setupNode(nodeVersion: r'${{ matrix.node }}')
```

## Tips

1. **Start Simple**: Begin with `01_basic_ci.dart` and build up complexity.

2. **Use Helpers**: Leverage action helpers like `checkout()`, `setupNode()`, etc. for type safety.

3. **Test Locally**: Generate YAML and validate it before pushing:
   ```bash
   dart run example/01_basic_ci.dart > .github/workflows/ci.yml
   ```

4. **Check Generated YAML**: Always review the output to ensure it matches your expectations.

5. **IDE Support**: Use an IDE with Dart support for autocomplete and parameter hints.

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Actions Marketplace](https://github.com/marketplace?type=actions)
- [Action Helpers Documentation](../lib/src/actions_README.md)

## Contributing

To add a new example:

1. Create a new file with a descriptive name (e.g., `09_my_example.dart`)
2. Add comprehensive comments explaining the workflow
3. Update this README with a description
4. Test that it generates valid YAML

## Questions?

Check the [main README](../README.md) or the [action helpers documentation](../lib/src/actions_README.md).