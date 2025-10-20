import 'package:gha/gha.dart';

void main() {
  // GitHub Script workflow examples
  final workflow = Workflow(
    name: 'GitHub Script Examples',
    on: WorkflowTriggers({
      'issues': TriggerConfig(types: ['opened']),
      'pull_request': TriggerConfig(types: ['opened', 'reopened']),
    }),
    jobs: {
      'welcome-comment': Job(
        name: 'Welcome new contributors',
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
      'auto-label': Job(
        name: 'Auto-label pull requests',
        ifCondition: r"github.event_name == 'pull_request'",
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          githubScript(
            script: '''
              const pr = context.payload.pull_request;
              const labels = [];

              // Add labels based on changed files
              const files = await github.rest.pulls.listFiles({
                owner: context.repo.owner,
                repo: context.repo.repo,
                pull_number: pr.number,
              });

              const hasDocChanges = files.data.some(f => f.filename.endsWith('.md'));
              const hasCodeChanges = files.data.some(f => f.filename.endsWith('.dart'));

              if (hasDocChanges) labels.push('documentation');
              if (hasCodeChanges) labels.push('code');

              if (labels.length > 0) {
                await github.rest.issues.addLabels({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: pr.number,
                  labels: labels,
                });
              }
            ''',
          ),
        ],
      ),
      'check-pr-size': Job(
        name: 'Check PR size',
        ifCondition: r"github.event_name == 'pull_request'",
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          githubScript(
            script: r'''
              const pr = context.payload.pull_request;

              // Get PR files
              const files = await github.rest.pulls.listFiles({
                owner: context.repo.owner,
                repo: context.repo.repo,
                pull_number: pr.number,
              });

              const totalChanges = files.data.reduce((acc, file) => {
                return acc + file.additions + file.deletions;
              }, 0);

              // Comment if PR is large
              if (totalChanges > 500) {
                await github.rest.issues.createComment({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: pr.number,
                  body: `⚠️ This PR has ${totalChanges} changes. Consider breaking it into smaller PRs for easier review.`,
                });
              }
            ''',
          ),
        ],
      ),
    },
  );

  print(workflow.toYamlString());
}
