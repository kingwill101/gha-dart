import 'package:gha/gha.dart';

void main() {
  // GitHub Pages deployment workflow
  final workflow = Workflow(
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
        name: 'Build site',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupNode(nodeVersion: '20', cache: 'npm'),
          Step(name: 'Install dependencies', run: 'npm ci'),
          Step(name: 'Build site', run: 'npm run build'),
          uploadPagesArtifact(path: './dist'),
        ],
      ),
      'deploy': Job(
        name: 'Deploy to GitHub Pages',
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

  print(workflow.toYamlString());
}
