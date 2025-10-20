import 'package:gha/gha.dart';

void main() {
  // Caching workflow examples
  final workflow = Workflow(
    name: 'Cache Examples',
    on: WorkflowTriggers.simple(['push']),
    jobs: {
      'npm-cache': Job(
        name: 'NPM with cache',
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
      'separate-cache-operations': Job(
        name: 'Separate restore and save',
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
      'pip-cache': Job(
        name: 'Python pip cache',
        runsOn: RunnerSpec.single('ubuntu-latest'),
        steps: [
          checkout(),
          setupPython(pythonVersion: '3.11', cache: 'pip'),
          Step(run: 'pip install -r requirements.txt'),
          Step(run: 'pytest'),
        ],
      ),
    },
  );

  print(workflow.toYamlString());
}
