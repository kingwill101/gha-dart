import 'package:gha/gha.dart';

void main() {
  // GitHub App token workflow
  final workflow = Workflow(
    name: 'Use GitHub App Token',
    on: WorkflowTriggers.simple(['push', 'workflow_dispatch']),
    jobs: {
      'automation': Job(
        name: 'Automated tasks with App token',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          Step(
            name: 'Generate GitHub App token',
            id: 'app-token',
            uses: 'actions/create-github-app-token@v2',
            withArguments: {
              'app-id': r'${{ secrets.APP_ID }}',
              'private-key': r'${{ secrets.APP_PRIVATE_KEY }}',
            },
          ),
          checkout(token: r'${{ steps.app-token.outputs.token }}'),
          Step(
            name: 'Use app token for API calls',
            env: {'GH_TOKEN': r'${{ steps.app-token.outputs.token }}'},
            run: r'''
              gh api repos/${{ github.repository }}/issues \
                --method POST \
                --field title="Automated issue" \
                --field body="Created by GitHub App"
            ''',
          ),
        ],
      ),
      'cross-repo-access': Job(
        name: 'Access other repositories',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          createGitHubAppToken(
            appId: r'${{ secrets.APP_ID }}',
            privateKey: r'${{ secrets.APP_PRIVATE_KEY }}',
            owner: 'my-org',
            repositories: 'repo1,repo2,repo3',
          ),
          githubScript(
            githubToken: r'${{ steps.app-token.outputs.token }}',
            script: '''
              // List repositories the app has access to
              const repos = await github.rest.apps.listReposAccessibleToInstallation();
              console.log('Accessible repositories:', repos.data.repositories.map(r => r.name));

              // Create an issue in another repo
              await github.rest.issues.create({
                owner: 'my-org',
                repo: 'repo1',
                title: 'Cross-repo automation',
                body: 'This issue was created from another repository using a GitHub App token.',
              });
            ''',
          ),
        ],
      ),
      'elevated-permissions': Job(
        name: 'Tasks requiring elevated permissions',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          Step(
            name: 'Generate token with specific permissions',
            id: 'app-token',
            uses: 'actions/create-github-app-token@v2',
            withArguments: {
              'app-id': r'${{ secrets.APP_ID }}',
              'private-key': r'${{ secrets.APP_PRIVATE_KEY }}',
              'owner': r'${{ github.repository_owner }}',
            },
          ),
          Step(
            name: 'Create release',
            env: {'GH_TOKEN': r'${{ steps.app-token.outputs.token }}'},
            run: r'''
              gh release create v1.0.0 \
                --title "Release v1.0.0" \
                --notes "Automated release created by GitHub App"
            ''',
          ),
          Step(
            name: 'Update branch protection',
            env: {'GH_TOKEN': r'${{ steps.app-token.outputs.token }}'},
            run: r'''
              gh api repos/${{ github.repository }}/branches/main/protection \
                --method PUT \
                --field required_status_checks[strict]=true \
                --field required_status_checks[contexts][]=ci \
                --field enforce_admins=true \
                --field required_pull_request_reviews[required_approving_review_count]=2
            ''',
          ),
        ],
      ),
    },
  );

  print(workflow.toYamlString());
}
