import 'package:gha/gha.dart';

void main() {
  // Test the proper type-based approach with named properties
  final workflow = Workflow(
    name: 'Type-Safe Triggers Test',
    on: WorkflowTriggers(
      // Regular trigger with TriggerConfig
      push: TriggerConfig(branches: ['main']),

      // Schedule trigger - direct list
      schedule: [CronSchedule('0 0 * * 0'), CronSchedule('0 6 * * 1-5')],

      // Workflow call - direct config
      workflowCall: WorkflowCallConfig(
        inputs: {
          'environment': WorkflowInput(
            description: 'Target environment',
            required: true,
            type: 'choice',
            options: ['dev', 'prod'],
          ),
        },
      ),

      // Workflow run - direct config
      workflowRun: WorkflowRunConfig(
        workflows: ['Build'],
        types: ['completed'],
      ),
    ),
    jobs: {
      'test': Job(
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [checkout()],
      ),
    },
  );

  print(workflow.toYamlString());
}
