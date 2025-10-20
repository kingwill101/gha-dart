import 'package:dart_mappable/dart_mappable.dart';
import 'package:json2yaml/json2yaml.dart';

part 'workflow.mapper.dart';

@MappableClass(ignoreNull: true)
class Workflow with WorkflowMappable {
  const Workflow({
    this.name,
    this.runName,
    required this.on,
    required this.jobs,
    this.env,
    this.defaults,
    this.permissions,
    this.concurrency,
  });

  final String? name;
  @MappableField(key: 'run-name')
  final String? runName;
  @MappableField(key: 'on')
  final WorkflowTriggers on;

  /// Either a map of environment variables or an expression string.
  final Object? env;
  final WorkflowDefaults? defaults;
  final Permissions? permissions;

  /// Either a string expression or a [Concurrency] configuration.
  final Object? concurrency;
  final Map<String, Job> jobs;

  factory Workflow.singleJob({
    String? name,
    String? runName,
    required List<String> events,
    required String jobId,
    required Job job,
  }) {
    return Workflow(
      name: name,
      runName: runName,
      on: WorkflowTriggers.simple(events),
      jobs: {jobId: job},
    );
  }

  Map<String, dynamic> encode() => workflowToMap(this);

  String toYamlString({YamlStyle yamlStyle = YamlStyle.generic}) {
    return json2yaml(encode(), yamlStyle: yamlStyle);
  }
}

@MappableClass(ignoreNull: true)
class WorkflowTriggers with WorkflowTriggersMappable {
  const WorkflowTriggers(this.events);

  factory WorkflowTriggers.simple(List<String> events) {
    return WorkflowTriggers({
      for (final event in events) event: const TriggerConfig(),
    });
  }

  final Map<String, TriggerConfig> events;
}

@MappableClass(ignoreNull: true)
class TriggerConfig with TriggerConfigMappable {
  const TriggerConfig({
    this.types,
    this.branches,
    this.branchesIgnore,
    this.tags,
    this.tagsIgnore,
    this.paths,
    this.pathsIgnore,
    this.inputs,
    this.schedule,
    this.workflowCall,
    this.workflowRun,
  });

  final List<String>? types;
  final List<String>? branches;
  @MappableField(key: 'branches-ignore')
  final List<String>? branchesIgnore;
  final List<String>? tags;
  @MappableField(key: 'tags-ignore')
  final List<String>? tagsIgnore;
  final List<String>? paths;
  @MappableField(key: 'paths-ignore')
  final List<String>? pathsIgnore;
  final Map<String, WorkflowInput>? inputs;
  final List<CronSchedule>? schedule;
  @MappableField(key: 'workflow_call')
  final WorkflowCallConfig? workflowCall;
  @MappableField(key: 'workflow_run')
  final WorkflowRunConfig? workflowRun;
}

@MappableClass(ignoreNull: true)
class WorkflowInput with WorkflowInputMappable {
  const WorkflowInput({
    this.description,
    this.required,
    this.defaultValue,
    this.type,
    this.options,
    this.deprecationMessage,
  });

  final String? description;
  final bool? required;
  @MappableField(key: 'default')
  final Object? defaultValue;
  final String? type;
  final List<Object>? options;
  final String? deprecationMessage;
}

@MappableClass(ignoreNull: true)
class CronSchedule with CronScheduleMappable {
  const CronSchedule(this.cron);

  final String cron;
}

@MappableClass(ignoreNull: true)
class WorkflowCallConfig with WorkflowCallConfigMappable {
  const WorkflowCallConfig({this.inputs, this.outputs, this.secrets});

  final Map<String, WorkflowInput>? inputs;
  final Map<String, WorkflowOutput>? outputs;
  final Map<String, WorkflowSecret>? secrets;
}

@MappableClass(ignoreNull: true)
class WorkflowOutput with WorkflowOutputMappable {
  const WorkflowOutput({this.description, this.value});

  final String? description;
  final String? value;
}

@MappableClass(ignoreNull: true)
class WorkflowSecret with WorkflowSecretMappable {
  const WorkflowSecret({this.description, this.required});

  final String? description;
  final bool? required;
}

@MappableClass(ignoreNull: true)
class WorkflowRunConfig with WorkflowRunConfigMappable {
  const WorkflowRunConfig({required this.workflows, this.types});

  final List<String> workflows;
  final List<String>? types;
}

@MappableClass(ignoreNull: true)
class WorkflowDefaults with WorkflowDefaultsMappable {
  const WorkflowDefaults({this.run});

  final RunDefaults? run;
}

@MappableClass(ignoreNull: true)
class RunDefaults with RunDefaultsMappable {
  const RunDefaults({this.shell, this.workingDirectory});

  final String? shell;
  @MappableField(key: 'working-directory')
  final String? workingDirectory;
}

@MappableClass(ignoreNull: true)
class Permissions with PermissionsMappable {
  const Permissions({
    this.shorthand,
    this.contents,
    this.packages,
    this.actions,
    this.attestations,
    this.checks,
    this.deployments,
    this.discussions,
    this.idToken,
    this.issues,
    this.models,
    this.pages,
    this.pullRequests,
    this.repositoryProjects,
    this.securityEvents,
    this.statuses,
    this.additional,
  });

  const Permissions.readAll() : this(shorthand: PermissionsShorthand.readAll);

  const Permissions.writeAll() : this(shorthand: PermissionsShorthand.writeAll);

  final PermissionsShorthand? shorthand;
  final PermissionLevel? contents;
  final PermissionLevel? packages;
  final PermissionLevel? actions;
  final PermissionLevel? attestations;
  final PermissionLevel? checks;
  final PermissionLevel? deployments;
  final PermissionLevel? discussions;
  @MappableField(key: 'id-token')
  final PermissionLevel? idToken;
  final PermissionLevel? issues;
  final ModelPermission? models;
  final PermissionLevel? pages;
  @MappableField(key: 'pull-requests')
  final PermissionLevel? pullRequests;
  @MappableField(key: 'repository-projects')
  final PermissionLevel? repositoryProjects;
  @MappableField(key: 'security-events')
  final PermissionLevel? securityEvents;
  final PermissionLevel? statuses;
  final Map<String, PermissionLevel>? additional;

  Permissions merge(Permissions? other) {
    if (other == null) return this;
    return Permissions(
      shorthand: other.shorthand ?? shorthand,
      contents: other.contents ?? contents,
      packages: other.packages ?? packages,
      actions: other.actions ?? actions,
      attestations: other.attestations ?? attestations,
      checks: other.checks ?? checks,
      deployments: other.deployments ?? deployments,
      discussions: other.discussions ?? discussions,
      idToken: other.idToken ?? idToken,
      issues: other.issues ?? issues,
      models: other.models ?? models,
      pages: other.pages ?? pages,
      pullRequests: other.pullRequests ?? pullRequests,
      repositoryProjects: other.repositoryProjects ?? repositoryProjects,
      securityEvents: other.securityEvents ?? securityEvents,
      statuses: other.statuses ?? statuses,
      additional: {
        if (additional != null) ...additional!,
        if (other.additional != null) ...other.additional!,
      },
    );
  }
}

@MappableEnum()
enum PermissionsShorthand {
  @MappableValue('read-all')
  readAll,
  @MappableValue('write-all')
  writeAll,
}

@MappableEnum()
enum PermissionLevel {
  @MappableValue('read')
  read,
  @MappableValue('write')
  write,
  @MappableValue('none')
  none,
}

@MappableEnum()
enum ModelPermission {
  @MappableValue('read')
  read,
  @MappableValue('none')
  none,
}

@MappableClass(ignoreNull: true)
class Concurrency with ConcurrencyMappable {
  const Concurrency({required this.group, this.cancelInProgress});

  final String group;
  @MappableField(key: 'cancel-in-progress')
  final Object? cancelInProgress;
}

class RunnerSpec {
  const RunnerSpec._(this.value);

  final Object value;

  const RunnerSpec.single(String label) : this._(label);

  RunnerSpec.matrix(List<String> labels) : this._(List.unmodifiable(labels));

  RunnerSpec.group(String group, {List<String>? labels})
    : this._({
        'group': group,
        if (labels != null)
          'labels': labels.length == 1
              ? labels.first
              : List.unmodifiable(labels),
      });

  const RunnerSpec.expression(String expression) : this._(expression);

  RunnerSpec.custom(Object custom) : this._(custom);

  Object encode() => value;
}

@MappableClass(ignoreNull: true)
class Job with JobMappable {
  const Job({
    this.name,
    this.runsOn,
    this.needs,
    this.ifCondition,
    this.environment,
    this.env,
    this.defaults,
    this.outputs,
    this.steps,
    this.services,
    this.container,
    this.strategy,
    this.permissions,
    this.concurrency,
    this.timeoutMinutes,
    this.continueOnError,
    this.uses,
    this.withInputs,
    this.secrets,
  });

  final String? name;
  @MappableField(key: 'runs-on')
  final Object? runsOn;
  final Object? needs;
  @MappableField(key: 'if')
  final Object? ifCondition;
  final Object? environment;
  final Object? env;
  final RunDefaults? defaults;
  final Map<String, String>? outputs;
  final List<Step>? steps;
  final Map<String, ServiceContainer>? services;
  final Object? container;
  final JobStrategy? strategy;
  final Permissions? permissions;
  final Object? concurrency;
  @MappableField(key: 'timeout-minutes')
  final Object? timeoutMinutes;
  @MappableField(key: 'continue-on-error')
  final Object? continueOnError;
  final String? uses;
  @MappableField(key: 'with')
  final Map<String, dynamic>? withInputs;
  final Object? secrets;
}

@MappableClass(ignoreNull: true)
class JobEnvironment with JobEnvironmentMappable {
  const JobEnvironment({required this.name, this.url});

  final String name;
  final String? url;
}

@MappableClass(ignoreNull: true)
class ContainerReference with ContainerReferenceMappable {
  const ContainerReference({
    this.image,
    this.credentials,
    this.env,
    this.options,
    this.ports,
    this.volumes,
  });

  final String? image;
  final ContainerCredentials? credentials;
  final Map<String, dynamic>? env;
  final String? options;
  final List<Object>? ports;
  final List<String>? volumes;
}

@MappableClass(ignoreNull: true)
class ContainerCredentials with ContainerCredentialsMappable {
  const ContainerCredentials({this.username, this.password});

  final String? username;
  final String? password;
}

@MappableClass(ignoreNull: true)
class ServiceContainer with ServiceContainerMappable {
  const ServiceContainer({
    this.image,
    this.credentials,
    this.ports,
    this.env,
    this.options,
    this.volumes,
  });

  final String? image;
  final ContainerCredentials? credentials;
  final List<Object>? ports;
  final Map<String, dynamic>? env;
  final String? options;
  final List<String>? volumes;
}

@MappableClass(ignoreNull: true)
class JobStrategy with JobStrategyMappable {
  const JobStrategy({this.matrix, this.failFast, this.maxParallel});

  final Matrix? matrix;
  @MappableField(key: 'fail-fast')
  final Object? failFast;
  @MappableField(key: 'max-parallel')
  final Object? maxParallel;
}

@MappableClass(ignoreNull: true)
class Matrix with MatrixMappable {
  const Matrix({this.values = const {}, this.include, this.exclude});

  final Map<String, Object> values;
  final List<Map<String, dynamic>>? include;
  final List<Map<String, dynamic>>? exclude;
}

@MappableClass(ignoreNull: true)
class Step with StepMappable {
  const Step({
    this.id,
    this.name,
    this.ifCondition,
    this.uses,
    this.run,
    this.shell,
    this.env,
    this.withArguments,
    this.workingDirectory,
    this.timeoutMinutes,
    this.continueOnError,
  });

  final String? id;
  final String? name;
  @MappableField(key: 'if')
  final Object? ifCondition;
  final String? uses;
  final String? run;
  final String? shell;
  final Object? env;
  @MappableField(key: 'with')
  final Map<String, dynamic>? withArguments;
  @MappableField(key: 'working-directory')
  final String? workingDirectory;
  @MappableField(key: 'timeout-minutes')
  final Object? timeoutMinutes;
  @MappableField(key: 'continue-on-error')
  final Object? continueOnError;
}

Map<String, dynamic> workflowToMap(Workflow workflow) {
  final map = <String, dynamic>{};
  if (workflow.name != null) {
    map['name'] = workflow.name;
  }
  if (workflow.runName != null) {
    map['run-name'] = workflow.runName;
  }
  map['on'] = {
    for (final entry in workflow.on.events.entries)
      entry.key: entry.value.toMap(),
  };
  if (workflow.env != null) {
    map['env'] = _encodeEnv(workflow.env);
  }
  if (workflow.defaults != null) {
    map['defaults'] = workflow.defaults!.toMap();
  }
  if (workflow.permissions != null) {
    map['permissions'] = permissionsToMap(workflow.permissions!);
  }
  final workflowConcurrency = workflow.concurrency;
  if (workflowConcurrency != null) {
    map['concurrency'] = _encodeConcurrency(workflowConcurrency);
  }
  map['jobs'] = {
    for (final entry in workflow.jobs.entries) entry.key: jobToMap(entry.value),
  };
  return map;
}

Map<String, dynamic> jobToMap(Job job) {
  final map = <String, dynamic>{};
  if (job.name != null) {
    map['name'] = job.name;
  }
  if (job.runsOn != null) {
    map['runs-on'] = _encodeRunsOn(job.runsOn);
  }
  if (job.needs != null) {
    map['needs'] = job.needs;
  }
  if (job.ifCondition != null) {
    map['if'] = job.ifCondition;
  }
  final environment = job.environment;
  if (environment != null) {
    map['environment'] = _encodeEnvironment(environment);
  }
  if (job.env != null) {
    map['env'] = _encodeEnv(job.env);
  }
  if (job.defaults != null) {
    map['defaults'] = job.defaults!.toMap();
  }
  if (job.outputs != null) {
    map['outputs'] = job.outputs;
  }
  if (job.steps != null) {
    map['steps'] = job.steps!.map(stepToMap).toList();
  }
  if (job.services != null) {
    map['services'] = job.services!.map(
      (key, value) => MapEntry(key, value.toMap()),
    );
  }
  final container = job.container;
  if (container != null) {
    map['container'] = _encodeContainer(container);
  }
  if (job.strategy != null) {
    map['strategy'] = _encodeStrategy(job.strategy!);
  }
  if (job.permissions != null) {
    map['permissions'] = permissionsToMap(job.permissions!);
  }
  final concurrency = job.concurrency;
  if (concurrency != null) {
    map['concurrency'] = _encodeConcurrency(concurrency);
  }
  if (job.timeoutMinutes != null) {
    map['timeout-minutes'] = job.timeoutMinutes;
  }
  if (job.continueOnError != null) {
    map['continue-on-error'] = job.continueOnError;
  }
  if (job.uses != null) {
    map['uses'] = job.uses;
  }
  if (job.withInputs != null) {
    map['with'] = job.withInputs;
  }
  final secrets = job.secrets;
  if (secrets != null) {
    map['secrets'] = _encodeSecrets(secrets);
  }
  return map;
}

Map<String, dynamic> stepToMap(Step step) {
  final map = step.toMap();
  if (step.env != null) {
    map['env'] = _encodeEnv(step.env);
  }
  return map;
}

Object permissionsToMap(Permissions permissions) {
  final shorthand = permissions.shorthand;
  if (shorthand != null) {
    return _permissionsShorthandToString(shorthand);
  }

  final map = <String, dynamic>{};
  void writeLevel(String key, PermissionLevel? level) {
    if (level != null) {
      map[key] = _permissionLevelToString(level);
    }
  }

  writeLevel('contents', permissions.contents);
  writeLevel('packages', permissions.packages);
  writeLevel('actions', permissions.actions);
  writeLevel('attestations', permissions.attestations);
  writeLevel('checks', permissions.checks);
  writeLevel('deployments', permissions.deployments);
  writeLevel('discussions', permissions.discussions);
  writeLevel('id-token', permissions.idToken);
  writeLevel('issues', permissions.issues);
  final models = permissions.models;
  if (models != null) {
    map['models'] = _modelPermissionToString(models);
  }
  writeLevel('pages', permissions.pages);
  writeLevel('pull-requests', permissions.pullRequests);
  writeLevel('repository-projects', permissions.repositoryProjects);
  writeLevel('security-events', permissions.securityEvents);
  writeLevel('statuses', permissions.statuses);
  if (permissions.additional != null) {
    map.addAll({
      for (final entry in permissions.additional!.entries)
        entry.key: _permissionLevelToString(entry.value),
    });
  }
  return map;
}

String _permissionsShorthandToString(PermissionsShorthand shorthand) {
  switch (shorthand) {
    case PermissionsShorthand.readAll:
      return 'read-all';
    case PermissionsShorthand.writeAll:
      return 'write-all';
  }
}

String _permissionLevelToString(PermissionLevel level) {
  switch (level) {
    case PermissionLevel.read:
      return 'read';
    case PermissionLevel.write:
      return 'write';
    case PermissionLevel.none:
      return 'none';
  }
}

String _modelPermissionToString(ModelPermission permission) {
  switch (permission) {
    case ModelPermission.read:
      return 'read';
    case ModelPermission.none:
      return 'none';
  }
}

Object _encodeConcurrency(Object value) {
  if (value is Concurrency) {
    return value.toMap();
  }
  return value;
}

Object _encodeRunsOn(Object? value) {
  if (value is RunnerSpec) {
    return value.encode();
  }
  return value!;
}

Object _encodeEnvironment(Object value) {
  if (value is JobEnvironment) {
    return value.toMap();
  }
  return value;
}

Object _encodeContainer(Object value) {
  if (value is ContainerReference) {
    return value.toMap();
  }
  return value;
}

Object _encodeEnv(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  if (value is Map<String, Object?>) {
    return Map<String, Object?>.from(value);
  }
  return value!;
}

Object _encodeStrategy(JobStrategy strategy) {
  final map = strategy.toMap();
  if (strategy.matrix != null) {
    map['matrix'] = {
      ...strategy.matrix!.values,
      if (strategy.matrix!.include != null) 'include': strategy.matrix!.include,
      if (strategy.matrix!.exclude != null) 'exclude': strategy.matrix!.exclude,
    };
  }
  return map;
}

Object _encodeSecrets(Object value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return value;
}

extension WorkflowEncoding on Workflow {
  Map<String, dynamic> toJson() => encode();
}
