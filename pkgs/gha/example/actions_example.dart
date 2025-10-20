import 'package:gha/gha.dart';

void main() {
  // Example: Simple CI workflow with checkout and setup actions
  final ciWorkflow = Workflow(
    name: 'CI',
    on: WorkflowTriggers({
      'push': TriggerConfig(branches: ['main']),
      'pull_request': TriggerConfig(branches: ['main']),
    }),
    jobs: {
      'build': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(fetchDepth: 1),
          setupNode(nodeVersion: '20', cache: 'npm'),
          Step(name: 'Install dependencies', run: 'npm ci'),
          Step(name: 'Run tests', run: 'npm test'),
          uploadArtifact(
            path: 'coverage/',
            name: 'coverage-report',
            retentionDays: 7,
          ),
        ],
      ),
    },
  );

  print(ciWorkflow.toYamlString());
  print('\n---\n');

  // Example: Multi-language setup
  final multiLangWorkflow = Workflow(
    name: 'Multi-Language Build',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'python-job': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupPython(pythonVersion: '3.11', cache: 'pip'),
          Step(run: 'pip install -r requirements.txt'),
          Step(run: 'pytest'),
        ],
      ),
      'java-job': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupJava(distribution: 'temurin', javaVersion: '17', cache: 'maven'),
          Step(run: 'mvn test'),
        ],
      ),
      'go-job': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupGo(goVersion: '1.21', cache: true),
          Step(run: 'go test ./...'),
        ],
      ),
    },
  );

  print(multiLangWorkflow.toYamlString());
  print('\n---\n');

  // Example: Caching workflow
  final cacheWorkflow = Workflow(
    name: 'Cache Example',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'build-with-cache': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          cache(
            path: '~/.npm',
            key:
                r'${{ runner.os }}-npm-${{ hashFiles('
                '**/package-lock.json'
                ') }}',
            restoreKeys: r'${{ runner.os }}-npm-',
          ),
          setupNode(nodeVersion: '20'),
          Step(run: 'npm install'),
          Step(run: 'npm run build'),
        ],
      ),
    },
  );

  print(cacheWorkflow.toYamlString());
  print('\n---\n');

  // Example: GitHub Pages deployment
  final pagesWorkflow = Workflow(
    name: 'Deploy to GitHub Pages',
    on: WorkflowTriggers({
      'push': TriggerConfig(branches: ['main']),
    }),
    permissions: Permissions(
      contents: PermissionLevel.read,
      pages: PermissionLevel.write,
      idToken: PermissionLevel.write,
    ),
    concurrency: Concurrency(group: 'pages', cancelInProgress: false),
    jobs: {
      'build': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupNode(nodeVersion: '20', cache: 'npm'),
          Step(run: 'npm ci'),
          Step(run: 'npm run build'),
          uploadPagesArtifact(path: './dist'),
        ],
      ),
      'deploy': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        needs: ['build'],
        environment: JobEnvironment(
          name: 'github-pages',
          url: r'${{ steps.deployment.outputs.page_url }}',
        ),
        steps: [Step(id: 'deployment', uses: 'actions/deploy-pages@v4')],
      ),
    },
  );

  print(pagesWorkflow.toYamlString());
  print('\n---\n');

  // Example: Using GitHub Script for complex logic
  final scriptWorkflow = Workflow(
    name: 'GitHub Script Example',
    on: WorkflowTriggers({
      'issues': TriggerConfig(types: ['opened']),
    }),
    jobs: {
      'comment': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          githubScript(
            script: '''
              github.rest.issues.createComment({
                issue_number: context.issue.number,
                owner: context.repo.owner,
                repo: context.repo.repo,
                body: '👋 Thanks for opening this issue!'
              })
            ''',
          ),
        ],
      ),
    },
  );

  print(scriptWorkflow.toYamlString());
  print('\n---\n');

  // Example: Artifact download in dependent job
  final artifactWorkflow = Workflow(
    name: 'Build and Test',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'build': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupNode(nodeVersion: '20'),
          Step(run: 'npm ci'),
          Step(run: 'npm run build'),
          uploadArtifact(path: 'dist/', name: 'build-artifacts'),
        ],
      ),
      'test': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        needs: ['build'],
        steps: [
          downloadArtifact(name: 'build-artifacts', path: 'dist/'),
          setupNode(nodeVersion: '20'),
          Step(run: 'npm ci'),
          Step(run: 'npm test'),
        ],
      ),
    },
  );

  print(artifactWorkflow.toYamlString());
  print('\n---\n');

  // Example: Using GitHub App Token
  final appTokenWorkflow = Workflow(
    name: 'Use GitHub App',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'automation': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          createGitHubAppToken(
            appId: r'${{ secrets.APP_ID }}',
            privateKey: r'${{ secrets.APP_PRIVATE_KEY }}',
          ),
          checkout(token: r'${{ steps.app-token.outputs.token }}'),
          Step(
            name: 'Do something with app token',
            run: 'echo "Using app token for authentication"',
          ),
        ],
      ),
    },
  );

  print(appTokenWorkflow.toYamlString());
  print('\n---\n');

  // Example: .NET workflow
  final dotnetWorkflow = Workflow(
    name: 'Build .NET App',
    on: WorkflowTriggers.simple(['push', 'pull_request']),
    jobs: {
      'build': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupDotnet(dotnetVersion: '8.0.x'),
          Step(name: 'Restore dependencies', run: 'dotnet restore'),
          Step(name: 'Build', run: 'dotnet build --no-restore'),
          Step(name: 'Test', run: 'dotnet test --no-build --verbosity normal'),
        ],
      ),
    },
  );

  print(dotnetWorkflow.toYamlString());
  print('\n---\n');

  // Example: Cache restore and save separately
  final separateCacheWorkflow = Workflow(
    name: 'Separate Cache Operations',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'build': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          cacheRestore(
            path: ['~/.cargo', 'target/'],
            key:
                r'${{ runner.os }}-cargo-${{ hashFiles('
                '**/Cargo.lock'
                ') }}',
          ),
          Step(run: 'cargo build --release'),
          cacheSave(
            path: ['~/.cargo', 'target/'],
            key:
                r'${{ runner.os }}-cargo-${{ hashFiles('
                '**/Cargo.lock'
                ') }}',
          ),
        ],
      ),
    },
  );

  print(separateCacheWorkflow.toYamlString());
}
