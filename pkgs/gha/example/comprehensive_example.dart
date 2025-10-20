import 'package:gha/gha.dart';

void main() {
  // This is a comprehensive example showcasing ALL available features in GitHub Actions
  final workflow = Workflow(
    name: 'Comprehensive GitHub Actions Example',
    runName: r'Run #${{ github.run_number }} - ${{ github.event_name }}',

    // All trigger types
    on: WorkflowTriggers(
      // Push trigger with all options
      push: TriggerConfig(
        branches: ['main', 'develop', 'release/**'],
        tags: ['v*.*.*'],
        paths: ['src/**', 'lib/**', '**.dart'],
      ),

      // Pull request trigger with types
      pullRequest: TriggerConfig(
        types: ['opened', 'synchronize', 'reopened', 'ready_for_review'],
        branches: ['main', 'develop'],
        paths: ['src/**', 'lib/**'],
      ),

      // Workflow dispatch with all input types
      workflowDispatch: TriggerConfig(
        inputs: {
          'environment': WorkflowInput(
            description: 'Target environment',
            required: true,
            type: 'choice',
            options: ['development', 'staging', 'production'],
            defaultValue: 'development',
          ),
          'version': WorkflowInput(
            description: 'Version to deploy',
            required: true,
            type: 'string',
            defaultValue: 'latest',
          ),
          'debug_enabled': WorkflowInput(
            description: 'Enable debug mode',
            required: false,
            type: 'boolean',
            defaultValue: false,
          ),
          'log_level': WorkflowInput(
            description: 'Logging level',
            type: 'choice',
            options: ['debug', 'info', 'warning', 'error'],
            defaultValue: 'info',
          ),
        },
      ),

      // Schedule trigger with multiple cron expressions - direct list
      schedule: [
        CronSchedule('0 0 * * 0'), // Weekly on Sunday at midnight
        CronSchedule('0 6 * * 1-5'), // Weekdays at 6 AM
      ],

      // Workflow call trigger (for reusable workflows) - direct config
      workflowCall: WorkflowCallConfig(
        inputs: {
          'config-path': WorkflowInput(
            description: 'Path to configuration file',
            required: true,
            type: 'string',
          ),
          'dry-run': WorkflowInput(
            description: 'Run in dry-run mode',
            type: 'boolean',
            defaultValue: false,
          ),
        },
        outputs: {
          'artifact-id': WorkflowOutput(
            description: 'ID of the generated artifact',
            value: r'${{ jobs.build.outputs.artifact-id }}',
          ),
          'build-status': WorkflowOutput(
            description: 'Status of the build',
            value: r'${{ jobs.build.outputs.status }}',
          ),
        },
        secrets: {
          'deploy-token': WorkflowSecret(
            description: 'Token for deployment',
            required: true,
          ),
          'api-key': WorkflowSecret(
            description: 'API key for external service',
            required: false,
          ),
        },
      ),

      // Workflow run trigger - direct config
      workflowRun: WorkflowRunConfig(
        workflows: ['Build', 'Test'],
        types: ['completed', 'requested'],
      ),
    ),

    // Workflow-level environment variables
    env: {
      'GLOBAL_VAR': 'global-value',
      'BUILD_NUMBER': r'${{ github.run_number }}',
      'BRANCH_NAME': r'${{ github.ref_name }}',
      'COMMIT_SHA': r'${{ github.sha }}',
    },

    // Default settings for all jobs
    defaults: WorkflowDefaults(
      run: RunDefaults(shell: 'bash', workingDirectory: './app'),
    ),

    // Workflow-level permissions
    permissions: Permissions(
      actions: PermissionLevel.read,
      contents: PermissionLevel.write,
      deployments: PermissionLevel.write,
      packages: PermissionLevel.write,
      pullRequests: PermissionLevel.write,
      issues: PermissionLevel.write,
      statuses: PermissionLevel.read,
      checks: PermissionLevel.write,
      discussions: PermissionLevel.read,
      idToken: PermissionLevel.write,
      pages: PermissionLevel.write,
      securityEvents: PermissionLevel.read,
    ),

    // Workflow-level concurrency
    concurrency: Concurrency(
      group: r'${{ github.workflow }}-${{ github.ref }}',
      cancelInProgress: true,
    ),

    jobs: {
      // Job 1: Setup and validation
      'setup': Job(
        name: 'Setup and Validation',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        timeoutMinutes: 10,
        outputs: {
          'cache-key': r'${{ steps.cache-info.outputs.key }}',
          'version': r'${{ steps.version.outputs.version }}',
        },
        steps: [
          checkout(
            ref: r'${{ github.head_ref }}',
            fetchDepth: 0,
            persistCredentials: true,
            clean: true,
          ),

          Step(
            id: 'version',
            name: 'Determine version',
            run: '''
              VERSION=\$(git describe --tags --always)
              echo "version=\$VERSION" >> \$GITHUB_OUTPUT
              echo "Detected version: \$VERSION"
            ''',
          ),

          Step(
            id: 'cache-info',
            name: 'Generate cache key',
            run: '''
              KEY="deps-\${{ runner.os }}-\$(date +%Y%m%d)"
              echo "key=\$KEY" >> \$GITHUB_OUTPUT
            ''',
          ),
        ],
      ),

      // Job 2: Multi-language matrix build
      'matrix-build': Job(
        name: 'Matrix Build - \${{ matrix.os }} - \${{ matrix.language }}',
        needs: 'setup',
        strategy: JobStrategy(
          matrix: Matrix(
            values: {
              'os': ['ubuntu-latest', 'windows-latest', 'macos-latest'],
              'language': ['dart', 'node', 'python', 'go'],
              'version': ['stable', 'latest'],
            },
            include: [
              {
                'os': 'ubuntu-latest',
                'language': 'dart',
                'version': 'beta',
                'experimental': true,
              },
              {
                'os': 'macos-latest',
                'language': 'node',
                'version': '22',
                'experimental': false,
              },
            ],
            exclude: [
              {'os': 'windows-latest', 'language': 'go', 'version': 'stable'},
              {'os': 'macos-latest', 'language': 'python', 'version': 'stable'},
            ],
          ),
          failFast: false,
          maxParallel: 8,
        ),
        runsOn: RunnerSpec.expression(r'${{ matrix.os }}'),
        continueOnError: r'${{ matrix.experimental || false }}',
        timeoutMinutes: 30,
        env: {
          'MATRIX_OS': r'${{ matrix.os }}',
          'MATRIX_LANG': r'${{ matrix.language }}',
        },
        steps: [
          checkout(),

          // Conditional step for Dart
          Step(
            name: 'Setup Dart',
            ifCondition: r"matrix.language == 'dart'",
            uses: 'dart-lang/setup-dart@v1',
            withArguments: {'sdk': r'${{ matrix.version }}'},
          ),

          // Conditional step for Node.js
          setupNode(nodeVersion: r'${{ matrix.version }}', cache: 'npm'),
          Step(
            name: 'Node build',
            ifCondition: r"matrix.language == 'node'",
            run: 'npm ci && npm run build',
          ),

          // Conditional step for Python
          setupPython(pythonVersion: r'${{ matrix.version }}', cache: 'pip'),
          Step(
            name: 'Python build',
            ifCondition: r"matrix.language == 'python'",
            run: 'pip install -r requirements.txt && python -m build',
          ),

          // Conditional step for Go
          setupGo(goVersion: r'${{ matrix.version }}', cache: true),
          Step(
            name: 'Go build',
            ifCondition: r"matrix.language == 'go'",
            run: 'go build -v ./...',
          ),

          // Upload build artifacts
          uploadArtifact(
            name:
                r'build-${{ matrix.os }}-${{ matrix.language }}-${{ matrix.version }}',
            path: ['dist/', 'build/', 'bin/'],
            retentionDays: 30,
            ifNoFilesFound: 'warn',
            includeHiddenFiles: false,
          ),
        ],
      ),

      // Job 3: Container-based job with services
      'integration-tests': Job(
        name: 'Integration Tests',
        needs: ['setup', 'matrix-build'],
        runsOn: RunnerSpec.single('ubuntu-latest'),
        container: ContainerReference(
          image: 'node:20-alpine',
          env: {'NODE_ENV': 'test', 'CI': 'true'},
          ports: [3000, 8080],
          volumes: ['/var/run/docker.sock:/var/run/docker.sock'],
          options: '--cpus 2 --memory 4g',
        ),
        services: {
          'postgres': ServiceContainer(
            image: 'postgres:15',
            env: {'POSTGRES_PASSWORD': 'postgres', 'POSTGRES_DB': 'testdb'},
            ports: [5432],
            options: '--health-cmd pg_isready --health-interval 10s',
          ),
          'redis': ServiceContainer(
            image: 'redis:7-alpine',
            ports: [6379],
            options: '--health-cmd "redis-cli ping" --health-interval 10s',
          ),
          'elasticsearch': ServiceContainer(
            image: 'elasticsearch:8.11.0',
            env: {
              'discovery.type': 'single-node',
              'xpack.security.enabled': 'false',
            },
            ports: [9200],
          ),
        },
        timeoutMinutes: 45,
        steps: [
          checkout(),

          Step(
            name: 'Wait for services',
            run: '''
              echo "Waiting for PostgreSQL..."
              until pg_isready -h postgres -p 5432; do sleep 1; done
              echo "Waiting for Redis..."
              until redis-cli -h redis ping; do sleep 1; done
              echo "All services are ready!"
            ''',
          ),

          Step(
            name: 'Run integration tests',
            env: {
              'DATABASE_URL':
                  'postgresql://postgres:postgres@postgres:5432/testdb',
              'REDIS_URL': 'redis://redis:6379',
              'ELASTICSEARCH_URL': 'http://elasticsearch:9200',
            },
            run: 'npm run test:integration',
          ),
        ],
      ),

      // Job 4: Self-hosted runner with labels
      'deploy-staging': Job(
        name: 'Deploy to Staging',
        needs: 'integration-tests',
        ifCondition:
            r"github.event_name == 'push' && github.ref == 'refs/heads/develop'",
        runsOn: RunnerSpec.group(
          'production-runners',
          labels: ['linux', 'x64', 'gpu'],
        ),
        environment: JobEnvironment(
          name: 'staging',
          url: r'https://staging.example.com',
        ),
        concurrency: Concurrency(
          group: 'staging-deployment',
          cancelInProgress: false,
        ),
        permissions: Permissions.writeAll(),
        steps: [
          checkout(),

          Step(
            name: 'Download all artifacts',
            uses: 'actions/download-artifact@v4',
            withArguments: {
              'pattern': 'build-*',
              'path': 'artifacts/',
              'merge-multiple': true,
            },
          ),

          Step(
            name: 'Deploy to staging',
            env: {
              'DEPLOY_TOKEN': r'${{ secrets.STAGING_DEPLOY_TOKEN }}',
              'API_KEY': r'${{ secrets.STAGING_API_KEY }}',
              'ENVIRONMENT': 'staging',
            },
            run: './scripts/deploy.sh',
          ),

          Step(
            name: 'Run smoke tests',
            continueOnError: true,
            timeoutMinutes: 5,
            run: './scripts/smoke-tests.sh',
          ),

          Step(
            name: 'Notify deployment',
            ifCondition: 'always()',
            uses: 'actions/github-script@v7',
            withArguments: {
              'script': '''
                github.rest.issues.createComment({
                  issue_number: context.issue.number,
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  body: '🚀 Deployed to staging: https://staging.example.com'
                })
              ''',
            },
          ),
        ],
      ),

      // Job 5: Caching example
      'cache-example': Job(
        name: 'Advanced Caching',
        needs: 'setup',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),

          setupNode(nodeVersion: '20'),

          // Restore cache
          cacheRestore(
            path: ['node_modules', '.npm', '~/.cache'],
            key:
                r'node-deps-${{ runner.os }}-${{ hashFiles("**/package-lock.json") }}',
            restoreKeys: [r'node-deps-${{ runner.os }}-', 'node-deps-'],
          ),

          Step(name: 'Install dependencies', run: 'npm ci'),

          // Save cache
          cacheSave(
            path: ['node_modules', '.npm', '~/.cache'],
            key:
                r'node-deps-${{ runner.os }}-${{ hashFiles("**/package-lock.json") }}',
          ),

          Step(name: 'Build with cache', run: 'npm run build'),
        ],
      ),

      // Job 6: GitHub Script and App Token
      'github-automation': Job(
        name: 'GitHub Automation',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        permissions: Permissions(
          contents: PermissionLevel.write,
          pullRequests: PermissionLevel.write,
          issues: PermissionLevel.write,
        ),

        steps: [
          checkout(),

          // Generate GitHub App token
          createGitHubAppToken(
            appId: r'${{ secrets.APP_ID }}',
            privateKey: r'${{ secrets.APP_PRIVATE_KEY }}',
            owner: r'${{ github.repository_owner }}',
            repositories: r'${{ github.event.repository.name }}',
          ),

          // Use GitHub Script
          githubScript(
            script: '''
              const issue = await github.rest.issues.create({
                owner: context.repo.owner,
                repo: context.repo.repo,
                title: 'Automated Issue',
                body: 'This issue was created by GitHub Actions',
                labels: ['automated', 'bot']
              });

              console.log('Created issue:', issue.data.html_url);

              // Update PR
              if (context.payload.pull_request) {
                await github.rest.pulls.update({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  pull_number: context.payload.pull_request.number,
                  body: context.payload.pull_request.body + '\\n\\n✅ Automated checks passed'
                });
              }
            ''',
            githubToken: r'${{ secrets.GITHUB_TOKEN }}',
            debug: true,
            retries: 3,
          ),
        ],
      ),

      // Job 7: GitHub Pages deployment
      'deploy-pages': Job(
        name: 'Deploy to GitHub Pages',
        needs: 'matrix-build',
        ifCondition: r"github.ref == 'refs/heads/main'",
        runsOn: RunnerSpec.single('ubuntu-latest'),
        environment: JobEnvironment(
          name: 'github-pages',
          url: r'${{ steps.deployment.outputs.page_url }}',
        ),
        permissions: Permissions(
          contents: PermissionLevel.read,
          pages: PermissionLevel.write,
          idToken: PermissionLevel.write,
        ),
        steps: [
          checkout(),

          configurePages(staticSiteGenerator: 'next', enablement: 'true'),

          Step(
            name: 'Build documentation',
            run: '''
              npm ci
              npm run build:docs
            ''',
          ),

          uploadPagesArtifact(path: './docs/build'),

          deployPages(timeout: 600000, errorCount: 10, reportingInterval: 5000),
        ],
      ),

      // Job 8: Multiple language setups
      'multi-language-setup': Job(
        name: 'Multi-Language Environment',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),

          // Setup all languages
          setupDart(sdk: 'stable'),
          setupNode(nodeVersion: '20', cache: 'npm'),
          setupPython(pythonVersion: '3.12', cache: 'pip'),
          setupGo(goVersion: '1.21', cache: true),
          setupJava(
            distribution: 'temurin',
            javaVersion: '21',
            cache: 'gradle',
          ),
          setupDotnet(dotnetVersion: '8.0', cache: true),

          Step(
            name: 'Verify installations',
            run: '''
              echo "Dart: \$(dart --version)"
              echo "Node: \$(node --version)"
              echo "Python: \$(python --version)"
              echo "Go: \$(go version)"
              echo "Java: \$(java -version 2>&1 | head -n 1)"
              echo "Dotnet: \$(dotnet --version)"
            ''',
          ),
        ],
      ),

      // Job 9: Conditional steps and expressions
      'conditional-logic': Job(
        name: 'Conditional Logic Examples',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),

          Step(
            name: 'Run on push only',
            ifCondition: r"github.event_name == 'push'",
            run: 'echo "This runs on push events"',
          ),

          Step(
            name: 'Run on main branch',
            ifCondition: r"github.ref == 'refs/heads/main'",
            run: 'echo "This runs on main branch"',
          ),

          Step(
            name: 'Run on success',
            ifCondition: 'success()',
            run: 'echo "Previous steps succeeded"',
          ),

          Step(
            name: 'Run on failure',
            ifCondition: 'failure()',
            run: 'echo "Previous steps failed"',
          ),

          Step(
            name: 'Always run',
            ifCondition: 'always()',
            run: 'echo "This always runs"',
          ),

          Step(
            name: 'Complex condition',
            ifCondition:
                r"github.event_name == 'push' && contains(github.ref, 'release') && !cancelled()",
            run: 'echo "Complex condition met"',
          ),
        ],
      ),

      // Job 10: Call reusable workflow
      'call-reusable-workflow': Job(
        name: 'Call Reusable Workflow',
        uses: './.github/workflows/reusable-workflow.yml',
        withInputs: {
          'environment': 'production',
          'version': r'${{ needs.setup.outputs.version }}',
          'dry-run': false,
        },
        secrets: {
          'deploy-token': r'${{ secrets.DEPLOY_TOKEN }}',
          'api-key': r'${{ secrets.API_KEY }}',
        },
        needs: 'setup',
      ),

      // Job 11: Final notification job
      'notify': Job(
        name: 'Send Notifications',
        needs: [
          'matrix-build',
          'integration-tests',
          'deploy-staging',
          'deploy-pages',
        ],
        ifCondition: 'always()',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          Step(
            name: 'Check job statuses',
            run: '''
              echo "Matrix Build: \${{ needs.matrix-build.result }}"
              echo "Integration Tests: \${{ needs.integration-tests.result }}"
              echo "Deploy Staging: \${{ needs.deploy-staging.result }}"
              echo "Deploy Pages: \${{ needs.deploy-pages.result }}"
            ''',
          ),

          Step(
            name: 'Send success notification',
            ifCondition:
                r"needs.matrix-build.result == 'success' && needs.integration-tests.result == 'success'",
            env: {'SLACK_WEBHOOK': r'${{ secrets.SLACK_WEBHOOK }}'},
            run: '''
              curl -X POST -H 'Content-type: application/json' \
                --data '{"text":"✅ Build succeeded!"}' \
                \$SLACK_WEBHOOK
            ''',
          ),

          Step(
            name: 'Send failure notification',
            ifCondition: 'failure()',
            env: {'SLACK_WEBHOOK': r'${{ secrets.SLACK_WEBHOOK }}'},
            run: '''
              curl -X POST -H 'Content-type: application/json' \
                --data '{"text":"❌ Build failed!"}' \
                \$SLACK_WEBHOOK
            ''',
          ),
        ],
      ),
    },
  );
  workflow.save(filename: "trest.yaml");
}
