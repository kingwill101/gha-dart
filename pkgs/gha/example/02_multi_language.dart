import 'package:gha/gha.dart';

void main() {
  // Multi-language build workflow
  final workflow = Workflow(
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
      'dotnet-job': Job(
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

  print(workflow.toYamlString());
}
