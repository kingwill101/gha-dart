import 'package:gha/gha.dart';

void main() {
  // Artifact upload and download workflow
  final workflow = Workflow(
    name: 'Build and Test with Artifacts',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'build': Job(
        name: 'Build Application',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupNode(nodeVersion: '20'),
          Step(run: 'npm ci'),
          Step(run: 'npm run build'),
          uploadArtifact(
            path: 'dist/',
            name: 'build-artifacts',
            retentionDays: 7,
          ),
          uploadArtifact(
            path: 'coverage/',
            name: 'coverage-report',
            retentionDays: 7,
            ifNoFilesFound: 'warn',
          ),
        ],
      ),
      'test': Job(
        name: 'Test with Built Artifacts',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        needs: ['build'],
        steps: [
          downloadArtifact(name: 'build-artifacts', path: 'dist/'),
          setupNode(nodeVersion: '20'),
          Step(run: 'npm ci'),
          Step(run: 'npm test'),
        ],
      ),
      'deploy': Job(
        name: 'Deploy',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        needs: ['build', 'test'],
        ifCondition: r"github.ref == 'refs/heads/main'",
        steps: [
          downloadArtifact(name: 'build-artifacts', path: 'dist/'),
          Step(
            name: 'Deploy to production',
            run: 'echo "Deploying dist/ to production"',
          ),
        ],
      ),
    },
  );

  print(workflow.toYamlString());
}
