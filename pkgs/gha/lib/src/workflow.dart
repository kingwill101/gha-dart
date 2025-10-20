import 'dart:convert';
import 'dart:math' as math;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:json_schema/json_schema.dart';
import 'package:yaml/yaml.dart';

import 'schema/github_workflow_schema.dart';

part 'workflow.mapper.dart';

class WorkflowValidationException implements Exception {
  WorkflowValidationException(this.message, {this.location});

  final String message;
  final String? location;

  @override
  String toString() {
    if (location == null) {
      return 'WorkflowValidationException: $message';
    }
    return 'WorkflowValidationException($location): $message';
  }
}

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

  factory Workflow.fromYamlString(String source) {
    final decoded = loadYaml(source);
    if (decoded is! YamlMap) {
      throw const FormatException(
        'Workflow YAML must resolve to a mapping at the top level.',
      );
    }
    final converted = _convertYamlNode(decoded) as Map<String, dynamic>;
    final normalized = _normalizeWorkflowDocument(converted);
    final workflow = WorkflowMapper.fromMap(normalized);
    _validateWorkflow(workflow);
    return workflow;
  }

  Map<String, dynamic> encode() => workflowToMap(this);

  String toYamlString({YamlStyle yamlStyle = YamlStyle.generic}) {
    final normalized = _prepareForYaml(encode());
    return json2yaml(normalized, yamlStyle: yamlStyle);
  }
}

@MappableClass(ignoreNull: true)
class WorkflowTriggers with WorkflowTriggersMappable {
  const WorkflowTriggers({
    this.push,
    this.pullRequest,
    this.pullRequestTarget,
    this.workflowDispatch,
    this.workflowCall,
    this.workflowRun,
    this.schedule,
    this.repositoryDispatch,
    this.branchProtectionRule,
    this.checkRun,
    this.checkSuite,
    this.create,
    this.delete,
    this.deployment,
    this.deploymentStatus,
    this.discussion,
    this.discussionComment,
    this.fork,
    this.gollum,
    this.issueComment,
    this.issues,
    this.label,
    this.mergeGroup,
    this.milestone,
    this.pageBuild,
    this.project,
    this.projectCard,
    this.projectColumn,
    this.public,
    this.pullRequestReview,
    this.pullRequestReviewComment,
    this.registryPackage,
    this.release,
    this.status,
    this.watch,
  });

  factory WorkflowTriggers.simple(List<String> events) {
    return WorkflowTriggers(
      push: events.contains('push') ? const TriggerConfig() : null,
      pullRequest: events.contains('pull_request')
          ? const TriggerConfig()
          : null,
      pullRequestTarget: events.contains('pull_request_target')
          ? const TriggerConfig()
          : null,
      workflowDispatch: events.contains('workflow_dispatch')
          ? const TriggerConfig()
          : null,
      workflowCall: events.contains('workflow_call')
          ? const WorkflowCallConfig()
          : null,
      workflowRun: events.contains('workflow_run')
          ? const WorkflowRunConfig(workflows: [])
          : null,
      schedule: events.contains('schedule') ? [] : null,
      repositoryDispatch: events.contains('repository_dispatch')
          ? const TriggerConfig()
          : null,
      branchProtectionRule: events.contains('branch_protection_rule')
          ? const TriggerConfig()
          : null,
      checkRun: events.contains('check_run') ? const TriggerConfig() : null,
      checkSuite: events.contains('check_suite') ? const TriggerConfig() : null,
      create: events.contains('create') ? const TriggerConfig() : null,
      delete: events.contains('delete') ? const TriggerConfig() : null,
      deployment: events.contains('deployment') ? const TriggerConfig() : null,
      deploymentStatus: events.contains('deployment_status')
          ? const TriggerConfig()
          : null,
      discussion: events.contains('discussion') ? const TriggerConfig() : null,
      discussionComment: events.contains('discussion_comment')
          ? const TriggerConfig()
          : null,
      fork: events.contains('fork') ? const TriggerConfig() : null,
      gollum: events.contains('gollum') ? const TriggerConfig() : null,
      issueComment: events.contains('issue_comment')
          ? const TriggerConfig()
          : null,
      issues: events.contains('issues') ? const TriggerConfig() : null,
      label: events.contains('label') ? const TriggerConfig() : null,
      mergeGroup: events.contains('merge_group') ? const TriggerConfig() : null,
      milestone: events.contains('milestone') ? const TriggerConfig() : null,
      pageBuild: events.contains('page_build') ? const TriggerConfig() : null,
      project: events.contains('project') ? const TriggerConfig() : null,
      projectCard: events.contains('project_card')
          ? const TriggerConfig()
          : null,
      projectColumn: events.contains('project_column')
          ? const TriggerConfig()
          : null,
      public: events.contains('public') ? const TriggerConfig() : null,
      pullRequestReview: events.contains('pull_request_review')
          ? const TriggerConfig()
          : null,
      pullRequestReviewComment: events.contains('pull_request_review_comment')
          ? const TriggerConfig()
          : null,
      registryPackage: events.contains('registry_package')
          ? const TriggerConfig()
          : null,
      release: events.contains('release') ? const TriggerConfig() : null,
      status: events.contains('status') ? const TriggerConfig() : null,
      watch: events.contains('watch') ? const TriggerConfig() : null,
    );
  }

  final TriggerConfig? push;
  @MappableField(key: 'pull_request')
  final TriggerConfig? pullRequest;
  @MappableField(key: 'pull_request_target')
  final TriggerConfig? pullRequestTarget;
  @MappableField(key: 'workflow_dispatch')
  final TriggerConfig? workflowDispatch;
  @MappableField(key: 'workflow_call')
  final WorkflowCallConfig? workflowCall;
  @MappableField(key: 'workflow_run')
  final WorkflowRunConfig? workflowRun;
  final List<CronSchedule>? schedule;
  @MappableField(key: 'repository_dispatch')
  final TriggerConfig? repositoryDispatch;
  @MappableField(key: 'branch_protection_rule')
  final TriggerConfig? branchProtectionRule;
  @MappableField(key: 'check_run')
  final TriggerConfig? checkRun;
  @MappableField(key: 'check_suite')
  final TriggerConfig? checkSuite;
  final TriggerConfig? create;
  final TriggerConfig? delete;
  final TriggerConfig? deployment;
  @MappableField(key: 'deployment_status')
  final TriggerConfig? deploymentStatus;
  final TriggerConfig? discussion;
  @MappableField(key: 'discussion_comment')
  final TriggerConfig? discussionComment;
  final TriggerConfig? fork;
  final TriggerConfig? gollum;
  @MappableField(key: 'issue_comment')
  final TriggerConfig? issueComment;
  final TriggerConfig? issues;
  final TriggerConfig? label;
  @MappableField(key: 'merge_group')
  final TriggerConfig? mergeGroup;
  final TriggerConfig? milestone;
  @MappableField(key: 'page_build')
  final TriggerConfig? pageBuild;
  final TriggerConfig? project;
  @MappableField(key: 'project_card')
  final TriggerConfig? projectCard;
  @MappableField(key: 'project_column')
  final TriggerConfig? projectColumn;
  final TriggerConfig? public;
  @MappableField(key: 'pull_request_review')
  final TriggerConfig? pullRequestReview;
  @MappableField(key: 'pull_request_review_comment')
  final TriggerConfig? pullRequestReviewComment;
  @MappableField(key: 'registry_package')
  final TriggerConfig? registryPackage;
  final TriggerConfig? release;
  final TriggerConfig? status;
  final TriggerConfig? watch;
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
    this.workflows,
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
  final List<String>? workflows;
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
  _validateWorkflow(workflow);

  final map = <String, dynamic>{};
  if (workflow.name != null) {
    map['name'] = workflow.name;
  }
  if (workflow.runName != null) {
    map['run-name'] = workflow.runName;
  }
  map['on'] = workflow.on.toMap();
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
  _validateWorkflowSchema(map);
  return map;
}

void _validateWorkflow(Workflow workflow) {
  void validateTrigger(String name, TriggerConfig? config) {
    if (config == null) return;
    _assertNotBoth(
      triggerName: name,
      first: 'branches',
      firstValue: config.branches,
      second: 'branches-ignore',
      secondValue: config.branchesIgnore,
    );
    _assertNotBoth(
      triggerName: name,
      first: 'tags',
      firstValue: config.tags,
      second: 'tags-ignore',
      secondValue: config.tagsIgnore,
    );
    _assertNotBoth(
      triggerName: name,
      first: 'paths',
      firstValue: config.paths,
      second: 'paths-ignore',
      secondValue: config.pathsIgnore,
    );
  }

  final triggers = workflow.on;
  validateTrigger('push', triggers.push);
  validateTrigger('pull_request', triggers.pullRequest);
  validateTrigger('pull_request_target', triggers.pullRequestTarget);
  validateTrigger('repository_dispatch', triggers.repositoryDispatch);
  validateTrigger('branch_protection_rule', triggers.branchProtectionRule);
  validateTrigger('check_run', triggers.checkRun);
  validateTrigger('check_suite', triggers.checkSuite);
  validateTrigger('create', triggers.create);
  validateTrigger('delete', triggers.delete);
  validateTrigger('deployment', triggers.deployment);
  validateTrigger('deployment_status', triggers.deploymentStatus);
  validateTrigger('discussion', triggers.discussion);
  validateTrigger('discussion_comment', triggers.discussionComment);
  validateTrigger('fork', triggers.fork);
  validateTrigger('gollum', triggers.gollum);
  validateTrigger('issue_comment', triggers.issueComment);
  validateTrigger('issues', triggers.issues);
  validateTrigger('label', triggers.label);
  validateTrigger('merge_group', triggers.mergeGroup);
  validateTrigger('milestone', triggers.milestone);
  validateTrigger('page_build', triggers.pageBuild);
  validateTrigger('project', triggers.project);
  validateTrigger('project_card', triggers.projectCard);
  validateTrigger('project_column', triggers.projectColumn);
  validateTrigger('public', triggers.public);
  validateTrigger('pull_request_review', triggers.pullRequestReview);
  validateTrigger(
    'pull_request_review_comment',
    triggers.pullRequestReviewComment,
  );
  validateTrigger('registry_package', triggers.registryPackage);
  validateTrigger('release', triggers.release);
  validateTrigger('status', triggers.status);
  validateTrigger('watch', triggers.watch);
}

void _assertNotBoth({
  required String triggerName,
  required String first,
  required Object? firstValue,
  required String second,
  required Object? secondValue,
}) {
  if (firstValue != null && secondValue != null) {
    throw WorkflowValidationException(
      'Trigger "$triggerName" cannot specify both "$first" and "$second".',
      location: 'on.$triggerName',
    );
  }
}

JsonSchema? _workflowSchemaCache;

JsonSchema _workflowJsonSchema() {
  return _workflowSchemaCache ??= JsonSchema.create(
    jsonDecode(githubWorkflowSchemaJson) as Map<String, dynamic>,
    schemaVersion: SchemaVersion.draft7,
  );
}

void _validateWorkflowSchema(Map<String, dynamic> workflowMap) {
  final schema = _workflowJsonSchema();
  final result = schema.validate(workflowMap);
  if (!result.isValid) {
    final error = result.errors.first;
    throw WorkflowValidationException(
      error.message,
      location: error.instancePath.isEmpty ? null : error.instancePath,
    );
  }
}

dynamic _convertYamlNode(dynamic node) {
  if (node is YamlMap) {
    return Map<String, dynamic>.fromEntries(
      node.entries.map(
        (entry) =>
            MapEntry(_stringKey(entry.key), _convertYamlNode(entry.value)),
      ),
    );
  }
  if (node is YamlList) {
    return node.map(_convertYamlNode).toList();
  }
  if (node is YamlScalar) {
    return node.value;
  }
  return node;
}

String _stringKey(dynamic key) {
  if (key is YamlScalar) {
    final value = key.value;
    return value == null ? 'null' : value.toString();
  }
  return key.toString();
}

Map<String, dynamic> _normalizeWorkflowDocument(Map<String, dynamic> document) {
  final normalized = <String, dynamic>{};
  document.forEach((key, value) {
    switch (key) {
      case 'on':
        normalized[key] = _normalizeTriggers(value);
        break;
      case 'jobs':
        normalized[key] = _normalizeJobs(value);
        break;
      case 'permissions':
        normalized[key] = _normalizePermissions(value);
        break;
      default:
        normalized[key] = value;
    }
  });
  return normalized;
}

Map<String, dynamic> _normalizeTriggers(dynamic value) {
  if (value is String) {
    return {value: <String, dynamic>{}};
  }
  if (value is Iterable) {
    return {for (final event in value) event.toString(): <String, dynamic>{}};
  }
  final map = _ensureMap(value, 'on');
  return map.map(
    (event, dynamic details) =>
        MapEntry(event, _normalizeTriggerValue(event, details)),
  );
}

dynamic _normalizeTriggerValue(String event, dynamic value) {
  switch (event) {
    case 'schedule':
      final items = _ensureIterable(value);
      return items
          .map(
            (item) => item is Map
                ? _ensureMap(item, 'schedule entry')
                : <String, dynamic>{'cron': item.toString()},
          )
          .toList();
    case 'workflow_run':
      final map = _ensureMap(value, 'workflow_run');
      map['workflows'] = _ensureListOfStrings(map['workflows']);
      if (map.containsKey('types')) {
        map['types'] = _ensureListOfStrings(map['types']);
      }
      return map;
    case 'workflow_call':
      final map = _ensureMap(value, 'workflow_call');
      if (map.containsKey('inputs')) {
        final inputs = _ensureMap(map['inputs'], 'workflow_call.inputs');
        map['inputs'] = inputs.map(
          (name, dynamic input) =>
              MapEntry(name, _ensureMap(input, 'workflow_call.inputs.$name')),
        );
      }
      if (map.containsKey('outputs')) {
        final outputs = _ensureMap(map['outputs'], 'workflow_call.outputs');
        map['outputs'] = outputs.map(
          (name, dynamic output) =>
              MapEntry(name, _ensureMap(output, 'workflow_call.outputs.$name')),
        );
      }
      if (map.containsKey('secrets')) {
        final secrets = _ensureMap(map['secrets'], 'workflow_call.secrets');
        map['secrets'] = secrets.map(
          (name, dynamic secret) =>
              MapEntry(name, _ensureMap(secret, 'workflow_call.secrets.$name')),
        );
      }
      return map;
    default:
      if (value == null) {
        return <String, dynamic>{};
      }
      final map = _ensureMap(value, '$event trigger');
      for (final field in const [
        'types',
        'branches',
        'branches-ignore',
        'tags',
        'tags-ignore',
        'paths',
        'paths-ignore',
        'workflows',
      ]) {
        if (map.containsKey(field)) {
          map[field] = _ensureListOfStrings(map[field]);
        }
      }
      if (map.containsKey('inputs')) {
        final inputs = _ensureMap(map['inputs'], '$event.inputs');
        map['inputs'] = inputs.map(
          (name, dynamic input) =>
              MapEntry(name, _ensureMap(input, '$event.inputs.$name')),
        );
      }
      return map;
  }
}

Map<String, dynamic> _normalizeJobs(dynamic value) {
  final jobs = _ensureMap(value, 'jobs');
  return jobs.map((jobId, dynamic jobValue) {
    final jobMap = _ensureMap(jobValue, 'jobs.$jobId');
    if (jobMap.containsKey('permissions')) {
      jobMap['permissions'] = _normalizePermissions(jobMap['permissions']);
    }
    if (jobMap.containsKey('steps')) {
      jobMap['steps'] = _normalizeSteps(jobMap['steps']);
    }
    if (jobMap.containsKey('services')) {
      jobMap['services'] = _normalizeServices(jobMap['services']);
    }
    if (jobMap.containsKey('container')) {
      jobMap['container'] = _normalizeContainer(jobMap['container']);
    }
    if (jobMap.containsKey('strategy')) {
      jobMap['strategy'] = _normalizeStrategy(jobMap['strategy']);
    }
    if (jobMap.containsKey('defaults')) {
      jobMap['defaults'] = _normalizeDefaults(jobMap['defaults']);
    }
    if (jobMap.containsKey('concurrency')) {
      jobMap['concurrency'] = _normalizeConcurrency(jobMap['concurrency']);
    }
    if (jobMap.containsKey('secrets')) {
      jobMap['secrets'] = _normalizeSecrets(jobMap['secrets']);
    }
    return MapEntry(jobId, jobMap);
  });
}

List<Map<String, dynamic>> _normalizeSteps(dynamic value) {
  return _ensureIterable(
    value,
  ).map((step) => _ensureMap(step, 'steps entry')).map((step) {
    if (step.containsKey('env')) {
      step['env'] = _ensureMap(step['env'], 'steps.env');
    }
    if (step.containsKey('with')) {
      final withArguments = _ensureMap(step['with'], 'steps.with');
      step['with'] = _normalizeWithArguments(withArguments);
    }
    return step;
  }).toList();
}

Map<String, dynamic> _normalizeServices(dynamic value) {
  final services = _ensureMap(value, 'services');
  return services.map((name, dynamic service) {
    final serviceMap = _ensureMap(service, 'services.$name');
    if (serviceMap.containsKey('credentials')) {
      serviceMap['credentials'] = _ensureMap(
        serviceMap['credentials'],
        'services.$name.credentials',
      );
    }
    if (serviceMap.containsKey('env')) {
      serviceMap['env'] = _ensureMap(serviceMap['env'], 'services.$name.env');
    }
    return MapEntry(name, serviceMap);
  });
}

dynamic _normalizeContainer(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is Map) {
    final map = _ensureMap(value, 'container');
    if (map.containsKey('credentials')) {
      map['credentials'] = _ensureMap(
        map['credentials'],
        'container.credentials',
      );
    }
    if (map.containsKey('env')) {
      map['env'] = _ensureMap(map['env'], 'container.env');
    }
    return map;
  }
  return value;
}

Map<String, dynamic> _normalizeStrategy(dynamic value) {
  final strategy = _ensureMap(value, 'strategy');
  if (strategy.containsKey('matrix')) {
    strategy['matrix'] = _normalizeMatrix(strategy['matrix']);
  }
  return strategy;
}

Map<String, dynamic> _normalizeMatrix(dynamic value) {
  final matrix = _ensureMap(value, 'matrix');
  final values = <String, Object>{};
  List<Map<String, dynamic>>? include;
  List<Map<String, dynamic>>? exclude;

  matrix.forEach((key, dynamic entryValue) {
    switch (key) {
      case 'include':
        include = _ensureIterable(
          entryValue,
        ).map((item) => _ensureMap(item, 'matrix.include entry')).toList();
        break;
      case 'exclude':
        exclude = _ensureIterable(
          entryValue,
        ).map((item) => _ensureMap(item, 'matrix.exclude entry')).toList();
        break;
      default:
        values[key] = entryValue;
    }
  });

  final normalized = <String, dynamic>{'values': values};
  if (include != null && include!.isNotEmpty) {
    normalized['include'] = include;
  }
  if (exclude != null && exclude!.isNotEmpty) {
    normalized['exclude'] = exclude;
  }
  return normalized;
}

Map<String, dynamic> _normalizeDefaults(dynamic value) {
  final defaults = _ensureMap(value, 'defaults');
  if (defaults.containsKey('run')) {
    defaults['run'] = _ensureMap(defaults['run'], 'defaults.run');
  }
  return defaults;
}

dynamic _normalizeConcurrency(dynamic value) {
  if (value is Map) {
    return _ensureMap(value, 'concurrency');
  }
  return value;
}

dynamic _normalizeSecrets(dynamic value) {
  if (value is Map) {
    return _ensureMap(value, 'secrets');
  }
  return value;
}

dynamic _normalizePermissions(dynamic value) {
  if (value is String) {
    return <String, dynamic>{'shorthand': value};
  }
  if (value is Map) {
    return _ensureMap(value, 'permissions');
  }
  return value;
}

Map<String, dynamic> _ensureMap(dynamic value, String context) {
  if (value == null) {
    return <String, dynamic>{};
  }
  if (value is Map<String, dynamic>) {
    return Map<String, dynamic>.from(value);
  }
  if (value is Map) {
    return value.map(
      (key, dynamic v) => MapEntry(key.toString(), _convertYamlNode(v)),
    );
  }
  throw FormatException('$context must be a mapping.');
}

List<dynamic> _ensureIterable(dynamic value) {
  if (value == null) {
    return const [];
  }
  if (value is Iterable) {
    return value.map(_convertYamlNode).toList();
  }
  return [_convertYamlNode(value)];
}

List<String> _ensureListOfStrings(dynamic value) {
  return _ensureIterable(value).map((item) => item.toString()).toList();
}

Map<String, dynamic> _normalizeWithArguments(Map<String, dynamic> withArgs) {
  final normalized = <String, dynamic>{};
  withArgs.forEach((key, value) {
    normalized[key] = _normalizeWithValue(value);
  });
  return normalized;
}

dynamic _normalizeWithValue(dynamic value) {
  if (value is Iterable) {
    final buffer = StringBuffer();
    var first = true;
    for (final item in value) {
      if (!first) buffer.writeln();
      first = false;
      buffer.write(
        item is Map || item is Iterable ? jsonEncode(item) : item.toString(),
      );
    }
    return buffer.toString();
  }
  if (value is Map) {
    return jsonEncode(value);
  }
  return value;
}

Map<String, dynamic> _prepareForYaml(Map<String, dynamic> source) {
  return source.map((key, value) => MapEntry(key, _normalizeYamlValue(value)));
}

dynamic _normalizeYamlValue(dynamic value) {
  if (value is String) {
    return value.contains('\n')
        ? _normalizeMultilineString(value)
        : _escapeYamlString(value);
  }
  if (value is Map) {
    return value.map(
      (key, dynamic v) => MapEntry(key.toString(), _normalizeYamlValue(v)),
    );
  }
  if (value is Iterable) {
    return value.map(_normalizeYamlValue).toList();
  }
  return value;
}

String _normalizeMultilineString(String value) {
  if (!value.contains('\n')) {
    return value;
  }

  final lines = value.split('\n').toList();

  while (lines.isNotEmpty && lines.first.trim().isEmpty) {
    lines.removeAt(0);
  }
  while (lines.isNotEmpty && lines.last.trim().isEmpty) {
    lines.removeLast();
  }

  if (lines.isEmpty) {
    return '';
  }

  final indents = lines
      .where((line) => line.trim().isNotEmpty)
      .map((line) => line.length - line.trimLeft().length)
      .toList();

  final indent = indents.isEmpty ? 0 : indents.reduce(math.min);

  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];
    if (line.trim().isEmpty) {
      lines[i] = '';
      continue;
    }
    if (indent <= 0) {
      lines[i] = line.trimRight();
      continue;
    }
    if (line.length >= indent) {
      lines[i] = line.substring(indent).trimRight();
    } else {
      lines[i] = line.trimLeft();
    }
  }

  return lines.join('\n');
}

String _escapeYamlString(String value) {
  if (value.contains('"')) {
    return value.replaceAll('"', r'\"');
  }
  return value;
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
  if (step.withArguments != null) {
    map['with'] = _normalizeWithArguments(
      Map<String, dynamic>.from(step.withArguments!),
    );
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
