// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'workflow.dart';

class PermissionsShorthandMapper extends EnumMapper<PermissionsShorthand> {
  PermissionsShorthandMapper._();

  static PermissionsShorthandMapper? _instance;
  static PermissionsShorthandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PermissionsShorthandMapper._());
    }
    return _instance!;
  }

  static PermissionsShorthand fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PermissionsShorthand decode(dynamic value) {
    switch (value) {
      case 'read-all':
        return PermissionsShorthand.readAll;
      case 'write-all':
        return PermissionsShorthand.writeAll;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PermissionsShorthand self) {
    switch (self) {
      case PermissionsShorthand.readAll:
        return 'read-all';
      case PermissionsShorthand.writeAll:
        return 'write-all';
    }
  }
}

extension PermissionsShorthandMapperExtension on PermissionsShorthand {
  dynamic toValue() {
    PermissionsShorthandMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PermissionsShorthand>(this);
  }
}

class PermissionLevelMapper extends EnumMapper<PermissionLevel> {
  PermissionLevelMapper._();

  static PermissionLevelMapper? _instance;
  static PermissionLevelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PermissionLevelMapper._());
    }
    return _instance!;
  }

  static PermissionLevel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PermissionLevel decode(dynamic value) {
    switch (value) {
      case 'read':
        return PermissionLevel.read;
      case 'write':
        return PermissionLevel.write;
      case 'none':
        return PermissionLevel.none;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PermissionLevel self) {
    switch (self) {
      case PermissionLevel.read:
        return 'read';
      case PermissionLevel.write:
        return 'write';
      case PermissionLevel.none:
        return 'none';
    }
  }
}

extension PermissionLevelMapperExtension on PermissionLevel {
  dynamic toValue() {
    PermissionLevelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PermissionLevel>(this);
  }
}

class ModelPermissionMapper extends EnumMapper<ModelPermission> {
  ModelPermissionMapper._();

  static ModelPermissionMapper? _instance;
  static ModelPermissionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModelPermissionMapper._());
    }
    return _instance!;
  }

  static ModelPermission fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ModelPermission decode(dynamic value) {
    switch (value) {
      case 'read':
        return ModelPermission.read;
      case 'none':
        return ModelPermission.none;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ModelPermission self) {
    switch (self) {
      case ModelPermission.read:
        return 'read';
      case ModelPermission.none:
        return 'none';
    }
  }
}

extension ModelPermissionMapperExtension on ModelPermission {
  dynamic toValue() {
    ModelPermissionMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ModelPermission>(this);
  }
}

class WorkflowMapper extends ClassMapperBase<Workflow> {
  WorkflowMapper._();

  static WorkflowMapper? _instance;
  static WorkflowMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkflowMapper._());
      WorkflowTriggersMapper.ensureInitialized();
      JobMapper.ensureInitialized();
      WorkflowDefaultsMapper.ensureInitialized();
      PermissionsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Workflow';

  static String? _$name(Workflow v) => v.name;
  static const Field<Workflow, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$runName(Workflow v) => v.runName;
  static const Field<Workflow, String> _f$runName = Field(
    'runName',
    _$runName,
    key: r'run-name',
    opt: true,
  );
  static WorkflowTriggers _$on(Workflow v) => v.on;
  static const Field<Workflow, WorkflowTriggers> _f$on = Field('on', _$on);
  static Map<String, Job> _$jobs(Workflow v) => v.jobs;
  static const Field<Workflow, Map<String, Job>> _f$jobs = Field(
    'jobs',
    _$jobs,
  );
  static Object? _$env(Workflow v) => v.env;
  static const Field<Workflow, Object> _f$env = Field('env', _$env, opt: true);
  static WorkflowDefaults? _$defaults(Workflow v) => v.defaults;
  static const Field<Workflow, WorkflowDefaults> _f$defaults = Field(
    'defaults',
    _$defaults,
    opt: true,
  );
  static Permissions? _$permissions(Workflow v) => v.permissions;
  static const Field<Workflow, Permissions> _f$permissions = Field(
    'permissions',
    _$permissions,
    opt: true,
  );
  static Object? _$concurrency(Workflow v) => v.concurrency;
  static const Field<Workflow, Object> _f$concurrency = Field(
    'concurrency',
    _$concurrency,
    opt: true,
  );

  @override
  final MappableFields<Workflow> fields = const {
    #name: _f$name,
    #runName: _f$runName,
    #on: _f$on,
    #jobs: _f$jobs,
    #env: _f$env,
    #defaults: _f$defaults,
    #permissions: _f$permissions,
    #concurrency: _f$concurrency,
  };
  @override
  final bool ignoreNull = true;

  static Workflow _instantiate(DecodingData data) {
    return Workflow(
      name: data.dec(_f$name),
      runName: data.dec(_f$runName),
      on: data.dec(_f$on),
      jobs: data.dec(_f$jobs),
      env: data.dec(_f$env),
      defaults: data.dec(_f$defaults),
      permissions: data.dec(_f$permissions),
      concurrency: data.dec(_f$concurrency),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Workflow fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Workflow>(map);
  }

  static Workflow fromJson(String json) {
    return ensureInitialized().decodeJson<Workflow>(json);
  }
}

mixin WorkflowMappable {
  String toJson() {
    return WorkflowMapper.ensureInitialized().encodeJson<Workflow>(
      this as Workflow,
    );
  }

  Map<String, dynamic> toMap() {
    return WorkflowMapper.ensureInitialized().encodeMap<Workflow>(
      this as Workflow,
    );
  }

  WorkflowCopyWith<Workflow, Workflow, Workflow> get copyWith =>
      _WorkflowCopyWithImpl<Workflow, Workflow>(
        this as Workflow,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WorkflowMapper.ensureInitialized().stringifyValue(this as Workflow);
  }

  @override
  bool operator ==(Object other) {
    return WorkflowMapper.ensureInitialized().equalsValue(
      this as Workflow,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkflowMapper.ensureInitialized().hashValue(this as Workflow);
  }
}

extension WorkflowValueCopy<$R, $Out> on ObjectCopyWith<$R, Workflow, $Out> {
  WorkflowCopyWith<$R, Workflow, $Out> get $asWorkflow =>
      $base.as((v, t, t2) => _WorkflowCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WorkflowCopyWith<$R, $In extends Workflow, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  WorkflowTriggersCopyWith<$R, WorkflowTriggers, WorkflowTriggers> get on;
  MapCopyWith<$R, String, Job, JobCopyWith<$R, Job, Job>> get jobs;
  WorkflowDefaultsCopyWith<$R, WorkflowDefaults, WorkflowDefaults>?
  get defaults;
  PermissionsCopyWith<$R, Permissions, Permissions>? get permissions;
  $R call({
    String? name,
    String? runName,
    WorkflowTriggers? on,
    Map<String, Job>? jobs,
    Object? env,
    WorkflowDefaults? defaults,
    Permissions? permissions,
    Object? concurrency,
  });
  WorkflowCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WorkflowCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Workflow, $Out>
    implements WorkflowCopyWith<$R, Workflow, $Out> {
  _WorkflowCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Workflow> $mapper =
      WorkflowMapper.ensureInitialized();
  @override
  WorkflowTriggersCopyWith<$R, WorkflowTriggers, WorkflowTriggers> get on =>
      $value.on.copyWith.$chain((v) => call(on: v));
  @override
  MapCopyWith<$R, String, Job, JobCopyWith<$R, Job, Job>> get jobs =>
      MapCopyWith(
        $value.jobs,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(jobs: v),
      );
  @override
  WorkflowDefaultsCopyWith<$R, WorkflowDefaults, WorkflowDefaults>?
  get defaults => $value.defaults?.copyWith.$chain((v) => call(defaults: v));
  @override
  PermissionsCopyWith<$R, Permissions, Permissions>? get permissions =>
      $value.permissions?.copyWith.$chain((v) => call(permissions: v));
  @override
  $R call({
    Object? name = $none,
    Object? runName = $none,
    WorkflowTriggers? on,
    Map<String, Job>? jobs,
    Object? env = $none,
    Object? defaults = $none,
    Object? permissions = $none,
    Object? concurrency = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (runName != $none) #runName: runName,
      if (on != null) #on: on,
      if (jobs != null) #jobs: jobs,
      if (env != $none) #env: env,
      if (defaults != $none) #defaults: defaults,
      if (permissions != $none) #permissions: permissions,
      if (concurrency != $none) #concurrency: concurrency,
    }),
  );
  @override
  Workflow $make(CopyWithData data) => Workflow(
    name: data.get(#name, or: $value.name),
    runName: data.get(#runName, or: $value.runName),
    on: data.get(#on, or: $value.on),
    jobs: data.get(#jobs, or: $value.jobs),
    env: data.get(#env, or: $value.env),
    defaults: data.get(#defaults, or: $value.defaults),
    permissions: data.get(#permissions, or: $value.permissions),
    concurrency: data.get(#concurrency, or: $value.concurrency),
  );

  @override
  WorkflowCopyWith<$R2, Workflow, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkflowCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WorkflowTriggersMapper extends ClassMapperBase<WorkflowTriggers> {
  WorkflowTriggersMapper._();

  static WorkflowTriggersMapper? _instance;
  static WorkflowTriggersMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkflowTriggersMapper._());
      TriggerConfigMapper.ensureInitialized();
      WorkflowCallConfigMapper.ensureInitialized();
      WorkflowRunConfigMapper.ensureInitialized();
      CronScheduleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WorkflowTriggers';

  static TriggerConfig? _$push(WorkflowTriggers v) => v.push;
  static const Field<WorkflowTriggers, TriggerConfig> _f$push = Field(
    'push',
    _$push,
    opt: true,
  );
  static TriggerConfig? _$pullRequest(WorkflowTriggers v) => v.pullRequest;
  static const Field<WorkflowTriggers, TriggerConfig> _f$pullRequest = Field(
    'pullRequest',
    _$pullRequest,
    key: r'pull_request',
    opt: true,
  );
  static TriggerConfig? _$pullRequestTarget(WorkflowTriggers v) =>
      v.pullRequestTarget;
  static const Field<WorkflowTriggers, TriggerConfig> _f$pullRequestTarget =
      Field(
        'pullRequestTarget',
        _$pullRequestTarget,
        key: r'pull_request_target',
        opt: true,
      );
  static TriggerConfig? _$workflowDispatch(WorkflowTriggers v) =>
      v.workflowDispatch;
  static const Field<WorkflowTriggers, TriggerConfig> _f$workflowDispatch =
      Field(
        'workflowDispatch',
        _$workflowDispatch,
        key: r'workflow_dispatch',
        opt: true,
      );
  static WorkflowCallConfig? _$workflowCall(WorkflowTriggers v) =>
      v.workflowCall;
  static const Field<WorkflowTriggers, WorkflowCallConfig> _f$workflowCall =
      Field('workflowCall', _$workflowCall, key: r'workflow_call', opt: true);
  static WorkflowRunConfig? _$workflowRun(WorkflowTriggers v) => v.workflowRun;
  static const Field<WorkflowTriggers, WorkflowRunConfig> _f$workflowRun =
      Field('workflowRun', _$workflowRun, key: r'workflow_run', opt: true);
  static List<CronSchedule>? _$schedule(WorkflowTriggers v) => v.schedule;
  static const Field<WorkflowTriggers, List<CronSchedule>> _f$schedule = Field(
    'schedule',
    _$schedule,
    opt: true,
  );
  static TriggerConfig? _$repositoryDispatch(WorkflowTriggers v) =>
      v.repositoryDispatch;
  static const Field<WorkflowTriggers, TriggerConfig> _f$repositoryDispatch =
      Field(
        'repositoryDispatch',
        _$repositoryDispatch,
        key: r'repository_dispatch',
        opt: true,
      );
  static TriggerConfig? _$branchProtectionRule(WorkflowTriggers v) =>
      v.branchProtectionRule;
  static const Field<WorkflowTriggers, TriggerConfig> _f$branchProtectionRule =
      Field(
        'branchProtectionRule',
        _$branchProtectionRule,
        key: r'branch_protection_rule',
        opt: true,
      );
  static TriggerConfig? _$checkRun(WorkflowTriggers v) => v.checkRun;
  static const Field<WorkflowTriggers, TriggerConfig> _f$checkRun = Field(
    'checkRun',
    _$checkRun,
    key: r'check_run',
    opt: true,
  );
  static TriggerConfig? _$checkSuite(WorkflowTriggers v) => v.checkSuite;
  static const Field<WorkflowTriggers, TriggerConfig> _f$checkSuite = Field(
    'checkSuite',
    _$checkSuite,
    key: r'check_suite',
    opt: true,
  );
  static TriggerConfig? _$create(WorkflowTriggers v) => v.create;
  static const Field<WorkflowTriggers, TriggerConfig> _f$create = Field(
    'create',
    _$create,
    opt: true,
  );
  static TriggerConfig? _$delete(WorkflowTriggers v) => v.delete;
  static const Field<WorkflowTriggers, TriggerConfig> _f$delete = Field(
    'delete',
    _$delete,
    opt: true,
  );
  static TriggerConfig? _$deployment(WorkflowTriggers v) => v.deployment;
  static const Field<WorkflowTriggers, TriggerConfig> _f$deployment = Field(
    'deployment',
    _$deployment,
    opt: true,
  );
  static TriggerConfig? _$deploymentStatus(WorkflowTriggers v) =>
      v.deploymentStatus;
  static const Field<WorkflowTriggers, TriggerConfig> _f$deploymentStatus =
      Field(
        'deploymentStatus',
        _$deploymentStatus,
        key: r'deployment_status',
        opt: true,
      );
  static TriggerConfig? _$discussion(WorkflowTriggers v) => v.discussion;
  static const Field<WorkflowTriggers, TriggerConfig> _f$discussion = Field(
    'discussion',
    _$discussion,
    opt: true,
  );
  static TriggerConfig? _$discussionComment(WorkflowTriggers v) =>
      v.discussionComment;
  static const Field<WorkflowTriggers, TriggerConfig> _f$discussionComment =
      Field(
        'discussionComment',
        _$discussionComment,
        key: r'discussion_comment',
        opt: true,
      );
  static TriggerConfig? _$fork(WorkflowTriggers v) => v.fork;
  static const Field<WorkflowTriggers, TriggerConfig> _f$fork = Field(
    'fork',
    _$fork,
    opt: true,
  );
  static TriggerConfig? _$gollum(WorkflowTriggers v) => v.gollum;
  static const Field<WorkflowTriggers, TriggerConfig> _f$gollum = Field(
    'gollum',
    _$gollum,
    opt: true,
  );
  static TriggerConfig? _$issueComment(WorkflowTriggers v) => v.issueComment;
  static const Field<WorkflowTriggers, TriggerConfig> _f$issueComment = Field(
    'issueComment',
    _$issueComment,
    key: r'issue_comment',
    opt: true,
  );
  static TriggerConfig? _$issues(WorkflowTriggers v) => v.issues;
  static const Field<WorkflowTriggers, TriggerConfig> _f$issues = Field(
    'issues',
    _$issues,
    opt: true,
  );
  static TriggerConfig? _$label(WorkflowTriggers v) => v.label;
  static const Field<WorkflowTriggers, TriggerConfig> _f$label = Field(
    'label',
    _$label,
    opt: true,
  );
  static TriggerConfig? _$mergeGroup(WorkflowTriggers v) => v.mergeGroup;
  static const Field<WorkflowTriggers, TriggerConfig> _f$mergeGroup = Field(
    'mergeGroup',
    _$mergeGroup,
    key: r'merge_group',
    opt: true,
  );
  static TriggerConfig? _$milestone(WorkflowTriggers v) => v.milestone;
  static const Field<WorkflowTriggers, TriggerConfig> _f$milestone = Field(
    'milestone',
    _$milestone,
    opt: true,
  );
  static TriggerConfig? _$pageBuild(WorkflowTriggers v) => v.pageBuild;
  static const Field<WorkflowTriggers, TriggerConfig> _f$pageBuild = Field(
    'pageBuild',
    _$pageBuild,
    key: r'page_build',
    opt: true,
  );
  static TriggerConfig? _$project(WorkflowTriggers v) => v.project;
  static const Field<WorkflowTriggers, TriggerConfig> _f$project = Field(
    'project',
    _$project,
    opt: true,
  );
  static TriggerConfig? _$projectCard(WorkflowTriggers v) => v.projectCard;
  static const Field<WorkflowTriggers, TriggerConfig> _f$projectCard = Field(
    'projectCard',
    _$projectCard,
    key: r'project_card',
    opt: true,
  );
  static TriggerConfig? _$projectColumn(WorkflowTriggers v) => v.projectColumn;
  static const Field<WorkflowTriggers, TriggerConfig> _f$projectColumn = Field(
    'projectColumn',
    _$projectColumn,
    key: r'project_column',
    opt: true,
  );
  static TriggerConfig? _$public(WorkflowTriggers v) => v.public;
  static const Field<WorkflowTriggers, TriggerConfig> _f$public = Field(
    'public',
    _$public,
    opt: true,
  );
  static TriggerConfig? _$pullRequestReview(WorkflowTriggers v) =>
      v.pullRequestReview;
  static const Field<WorkflowTriggers, TriggerConfig> _f$pullRequestReview =
      Field(
        'pullRequestReview',
        _$pullRequestReview,
        key: r'pull_request_review',
        opt: true,
      );
  static TriggerConfig? _$pullRequestReviewComment(WorkflowTriggers v) =>
      v.pullRequestReviewComment;
  static const Field<WorkflowTriggers, TriggerConfig>
  _f$pullRequestReviewComment = Field(
    'pullRequestReviewComment',
    _$pullRequestReviewComment,
    key: r'pull_request_review_comment',
    opt: true,
  );
  static TriggerConfig? _$registryPackage(WorkflowTriggers v) =>
      v.registryPackage;
  static const Field<WorkflowTriggers, TriggerConfig> _f$registryPackage =
      Field(
        'registryPackage',
        _$registryPackage,
        key: r'registry_package',
        opt: true,
      );
  static TriggerConfig? _$release(WorkflowTriggers v) => v.release;
  static const Field<WorkflowTriggers, TriggerConfig> _f$release = Field(
    'release',
    _$release,
    opt: true,
  );
  static TriggerConfig? _$status(WorkflowTriggers v) => v.status;
  static const Field<WorkflowTriggers, TriggerConfig> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static TriggerConfig? _$watch(WorkflowTriggers v) => v.watch;
  static const Field<WorkflowTriggers, TriggerConfig> _f$watch = Field(
    'watch',
    _$watch,
    opt: true,
  );

  @override
  final MappableFields<WorkflowTriggers> fields = const {
    #push: _f$push,
    #pullRequest: _f$pullRequest,
    #pullRequestTarget: _f$pullRequestTarget,
    #workflowDispatch: _f$workflowDispatch,
    #workflowCall: _f$workflowCall,
    #workflowRun: _f$workflowRun,
    #schedule: _f$schedule,
    #repositoryDispatch: _f$repositoryDispatch,
    #branchProtectionRule: _f$branchProtectionRule,
    #checkRun: _f$checkRun,
    #checkSuite: _f$checkSuite,
    #create: _f$create,
    #delete: _f$delete,
    #deployment: _f$deployment,
    #deploymentStatus: _f$deploymentStatus,
    #discussion: _f$discussion,
    #discussionComment: _f$discussionComment,
    #fork: _f$fork,
    #gollum: _f$gollum,
    #issueComment: _f$issueComment,
    #issues: _f$issues,
    #label: _f$label,
    #mergeGroup: _f$mergeGroup,
    #milestone: _f$milestone,
    #pageBuild: _f$pageBuild,
    #project: _f$project,
    #projectCard: _f$projectCard,
    #projectColumn: _f$projectColumn,
    #public: _f$public,
    #pullRequestReview: _f$pullRequestReview,
    #pullRequestReviewComment: _f$pullRequestReviewComment,
    #registryPackage: _f$registryPackage,
    #release: _f$release,
    #status: _f$status,
    #watch: _f$watch,
  };
  @override
  final bool ignoreNull = true;

  static WorkflowTriggers _instantiate(DecodingData data) {
    return WorkflowTriggers(
      push: data.dec(_f$push),
      pullRequest: data.dec(_f$pullRequest),
      pullRequestTarget: data.dec(_f$pullRequestTarget),
      workflowDispatch: data.dec(_f$workflowDispatch),
      workflowCall: data.dec(_f$workflowCall),
      workflowRun: data.dec(_f$workflowRun),
      schedule: data.dec(_f$schedule),
      repositoryDispatch: data.dec(_f$repositoryDispatch),
      branchProtectionRule: data.dec(_f$branchProtectionRule),
      checkRun: data.dec(_f$checkRun),
      checkSuite: data.dec(_f$checkSuite),
      create: data.dec(_f$create),
      delete: data.dec(_f$delete),
      deployment: data.dec(_f$deployment),
      deploymentStatus: data.dec(_f$deploymentStatus),
      discussion: data.dec(_f$discussion),
      discussionComment: data.dec(_f$discussionComment),
      fork: data.dec(_f$fork),
      gollum: data.dec(_f$gollum),
      issueComment: data.dec(_f$issueComment),
      issues: data.dec(_f$issues),
      label: data.dec(_f$label),
      mergeGroup: data.dec(_f$mergeGroup),
      milestone: data.dec(_f$milestone),
      pageBuild: data.dec(_f$pageBuild),
      project: data.dec(_f$project),
      projectCard: data.dec(_f$projectCard),
      projectColumn: data.dec(_f$projectColumn),
      public: data.dec(_f$public),
      pullRequestReview: data.dec(_f$pullRequestReview),
      pullRequestReviewComment: data.dec(_f$pullRequestReviewComment),
      registryPackage: data.dec(_f$registryPackage),
      release: data.dec(_f$release),
      status: data.dec(_f$status),
      watch: data.dec(_f$watch),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WorkflowTriggers fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WorkflowTriggers>(map);
  }

  static WorkflowTriggers fromJson(String json) {
    return ensureInitialized().decodeJson<WorkflowTriggers>(json);
  }
}

mixin WorkflowTriggersMappable {
  String toJson() {
    return WorkflowTriggersMapper.ensureInitialized()
        .encodeJson<WorkflowTriggers>(this as WorkflowTriggers);
  }

  Map<String, dynamic> toMap() {
    return WorkflowTriggersMapper.ensureInitialized()
        .encodeMap<WorkflowTriggers>(this as WorkflowTriggers);
  }

  WorkflowTriggersCopyWith<WorkflowTriggers, WorkflowTriggers, WorkflowTriggers>
  get copyWith =>
      _WorkflowTriggersCopyWithImpl<WorkflowTriggers, WorkflowTriggers>(
        this as WorkflowTriggers,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WorkflowTriggersMapper.ensureInitialized().stringifyValue(
      this as WorkflowTriggers,
    );
  }

  @override
  bool operator ==(Object other) {
    return WorkflowTriggersMapper.ensureInitialized().equalsValue(
      this as WorkflowTriggers,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkflowTriggersMapper.ensureInitialized().hashValue(
      this as WorkflowTriggers,
    );
  }
}

extension WorkflowTriggersValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WorkflowTriggers, $Out> {
  WorkflowTriggersCopyWith<$R, WorkflowTriggers, $Out>
  get $asWorkflowTriggers =>
      $base.as((v, t, t2) => _WorkflowTriggersCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WorkflowTriggersCopyWith<$R, $In extends WorkflowTriggers, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get push;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get pullRequest;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get pullRequestTarget;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get workflowDispatch;
  WorkflowCallConfigCopyWith<$R, WorkflowCallConfig, WorkflowCallConfig>?
  get workflowCall;
  WorkflowRunConfigCopyWith<$R, WorkflowRunConfig, WorkflowRunConfig>?
  get workflowRun;
  ListCopyWith<
    $R,
    CronSchedule,
    CronScheduleCopyWith<$R, CronSchedule, CronSchedule>
  >?
  get schedule;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get repositoryDispatch;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get branchProtectionRule;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get checkRun;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get checkSuite;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get create;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get delete;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get deployment;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get deploymentStatus;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get discussion;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get discussionComment;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get fork;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get gollum;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get issueComment;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get issues;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get label;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get mergeGroup;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get milestone;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get pageBuild;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get project;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get projectCard;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get projectColumn;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get public;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get pullRequestReview;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get pullRequestReviewComment;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get registryPackage;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get release;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get status;
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get watch;
  $R call({
    TriggerConfig? push,
    TriggerConfig? pullRequest,
    TriggerConfig? pullRequestTarget,
    TriggerConfig? workflowDispatch,
    WorkflowCallConfig? workflowCall,
    WorkflowRunConfig? workflowRun,
    List<CronSchedule>? schedule,
    TriggerConfig? repositoryDispatch,
    TriggerConfig? branchProtectionRule,
    TriggerConfig? checkRun,
    TriggerConfig? checkSuite,
    TriggerConfig? create,
    TriggerConfig? delete,
    TriggerConfig? deployment,
    TriggerConfig? deploymentStatus,
    TriggerConfig? discussion,
    TriggerConfig? discussionComment,
    TriggerConfig? fork,
    TriggerConfig? gollum,
    TriggerConfig? issueComment,
    TriggerConfig? issues,
    TriggerConfig? label,
    TriggerConfig? mergeGroup,
    TriggerConfig? milestone,
    TriggerConfig? pageBuild,
    TriggerConfig? project,
    TriggerConfig? projectCard,
    TriggerConfig? projectColumn,
    TriggerConfig? public,
    TriggerConfig? pullRequestReview,
    TriggerConfig? pullRequestReviewComment,
    TriggerConfig? registryPackage,
    TriggerConfig? release,
    TriggerConfig? status,
    TriggerConfig? watch,
  });
  WorkflowTriggersCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WorkflowTriggersCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WorkflowTriggers, $Out>
    implements WorkflowTriggersCopyWith<$R, WorkflowTriggers, $Out> {
  _WorkflowTriggersCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WorkflowTriggers> $mapper =
      WorkflowTriggersMapper.ensureInitialized();
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get push =>
      $value.push?.copyWith.$chain((v) => call(push: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get pullRequest =>
      $value.pullRequest?.copyWith.$chain((v) => call(pullRequest: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get pullRequestTarget => $value.pullRequestTarget?.copyWith.$chain(
    (v) => call(pullRequestTarget: v),
  );
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get workflowDispatch => $value.workflowDispatch?.copyWith.$chain(
    (v) => call(workflowDispatch: v),
  );
  @override
  WorkflowCallConfigCopyWith<$R, WorkflowCallConfig, WorkflowCallConfig>?
  get workflowCall =>
      $value.workflowCall?.copyWith.$chain((v) => call(workflowCall: v));
  @override
  WorkflowRunConfigCopyWith<$R, WorkflowRunConfig, WorkflowRunConfig>?
  get workflowRun =>
      $value.workflowRun?.copyWith.$chain((v) => call(workflowRun: v));
  @override
  ListCopyWith<
    $R,
    CronSchedule,
    CronScheduleCopyWith<$R, CronSchedule, CronSchedule>
  >?
  get schedule => $value.schedule != null
      ? ListCopyWith(
          $value.schedule!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(schedule: v),
        )
      : null;
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get repositoryDispatch => $value.repositoryDispatch?.copyWith.$chain(
    (v) => call(repositoryDispatch: v),
  );
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get branchProtectionRule => $value.branchProtectionRule?.copyWith.$chain(
    (v) => call(branchProtectionRule: v),
  );
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get checkRun =>
      $value.checkRun?.copyWith.$chain((v) => call(checkRun: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get checkSuite =>
      $value.checkSuite?.copyWith.$chain((v) => call(checkSuite: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get create =>
      $value.create?.copyWith.$chain((v) => call(create: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get delete =>
      $value.delete?.copyWith.$chain((v) => call(delete: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get deployment =>
      $value.deployment?.copyWith.$chain((v) => call(deployment: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get deploymentStatus => $value.deploymentStatus?.copyWith.$chain(
    (v) => call(deploymentStatus: v),
  );
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get discussion =>
      $value.discussion?.copyWith.$chain((v) => call(discussion: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get discussionComment => $value.discussionComment?.copyWith.$chain(
    (v) => call(discussionComment: v),
  );
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get fork =>
      $value.fork?.copyWith.$chain((v) => call(fork: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get gollum =>
      $value.gollum?.copyWith.$chain((v) => call(gollum: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get issueComment =>
      $value.issueComment?.copyWith.$chain((v) => call(issueComment: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get issues =>
      $value.issues?.copyWith.$chain((v) => call(issues: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get label =>
      $value.label?.copyWith.$chain((v) => call(label: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get mergeGroup =>
      $value.mergeGroup?.copyWith.$chain((v) => call(mergeGroup: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get milestone =>
      $value.milestone?.copyWith.$chain((v) => call(milestone: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get pageBuild =>
      $value.pageBuild?.copyWith.$chain((v) => call(pageBuild: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get project =>
      $value.project?.copyWith.$chain((v) => call(project: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get projectCard =>
      $value.projectCard?.copyWith.$chain((v) => call(projectCard: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get projectColumn =>
      $value.projectColumn?.copyWith.$chain((v) => call(projectColumn: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get public =>
      $value.public?.copyWith.$chain((v) => call(public: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get pullRequestReview => $value.pullRequestReview?.copyWith.$chain(
    (v) => call(pullRequestReview: v),
  );
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get pullRequestReviewComment => $value.pullRequestReviewComment?.copyWith
      .$chain((v) => call(pullRequestReviewComment: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>?
  get registryPackage =>
      $value.registryPackage?.copyWith.$chain((v) => call(registryPackage: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get release =>
      $value.release?.copyWith.$chain((v) => call(release: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get status =>
      $value.status?.copyWith.$chain((v) => call(status: v));
  @override
  TriggerConfigCopyWith<$R, TriggerConfig, TriggerConfig>? get watch =>
      $value.watch?.copyWith.$chain((v) => call(watch: v));
  @override
  $R call({
    Object? push = $none,
    Object? pullRequest = $none,
    Object? pullRequestTarget = $none,
    Object? workflowDispatch = $none,
    Object? workflowCall = $none,
    Object? workflowRun = $none,
    Object? schedule = $none,
    Object? repositoryDispatch = $none,
    Object? branchProtectionRule = $none,
    Object? checkRun = $none,
    Object? checkSuite = $none,
    Object? create = $none,
    Object? delete = $none,
    Object? deployment = $none,
    Object? deploymentStatus = $none,
    Object? discussion = $none,
    Object? discussionComment = $none,
    Object? fork = $none,
    Object? gollum = $none,
    Object? issueComment = $none,
    Object? issues = $none,
    Object? label = $none,
    Object? mergeGroup = $none,
    Object? milestone = $none,
    Object? pageBuild = $none,
    Object? project = $none,
    Object? projectCard = $none,
    Object? projectColumn = $none,
    Object? public = $none,
    Object? pullRequestReview = $none,
    Object? pullRequestReviewComment = $none,
    Object? registryPackage = $none,
    Object? release = $none,
    Object? status = $none,
    Object? watch = $none,
  }) => $apply(
    FieldCopyWithData({
      if (push != $none) #push: push,
      if (pullRequest != $none) #pullRequest: pullRequest,
      if (pullRequestTarget != $none) #pullRequestTarget: pullRequestTarget,
      if (workflowDispatch != $none) #workflowDispatch: workflowDispatch,
      if (workflowCall != $none) #workflowCall: workflowCall,
      if (workflowRun != $none) #workflowRun: workflowRun,
      if (schedule != $none) #schedule: schedule,
      if (repositoryDispatch != $none) #repositoryDispatch: repositoryDispatch,
      if (branchProtectionRule != $none)
        #branchProtectionRule: branchProtectionRule,
      if (checkRun != $none) #checkRun: checkRun,
      if (checkSuite != $none) #checkSuite: checkSuite,
      if (create != $none) #create: create,
      if (delete != $none) #delete: delete,
      if (deployment != $none) #deployment: deployment,
      if (deploymentStatus != $none) #deploymentStatus: deploymentStatus,
      if (discussion != $none) #discussion: discussion,
      if (discussionComment != $none) #discussionComment: discussionComment,
      if (fork != $none) #fork: fork,
      if (gollum != $none) #gollum: gollum,
      if (issueComment != $none) #issueComment: issueComment,
      if (issues != $none) #issues: issues,
      if (label != $none) #label: label,
      if (mergeGroup != $none) #mergeGroup: mergeGroup,
      if (milestone != $none) #milestone: milestone,
      if (pageBuild != $none) #pageBuild: pageBuild,
      if (project != $none) #project: project,
      if (projectCard != $none) #projectCard: projectCard,
      if (projectColumn != $none) #projectColumn: projectColumn,
      if (public != $none) #public: public,
      if (pullRequestReview != $none) #pullRequestReview: pullRequestReview,
      if (pullRequestReviewComment != $none)
        #pullRequestReviewComment: pullRequestReviewComment,
      if (registryPackage != $none) #registryPackage: registryPackage,
      if (release != $none) #release: release,
      if (status != $none) #status: status,
      if (watch != $none) #watch: watch,
    }),
  );
  @override
  WorkflowTriggers $make(CopyWithData data) => WorkflowTriggers(
    push: data.get(#push, or: $value.push),
    pullRequest: data.get(#pullRequest, or: $value.pullRequest),
    pullRequestTarget: data.get(
      #pullRequestTarget,
      or: $value.pullRequestTarget,
    ),
    workflowDispatch: data.get(#workflowDispatch, or: $value.workflowDispatch),
    workflowCall: data.get(#workflowCall, or: $value.workflowCall),
    workflowRun: data.get(#workflowRun, or: $value.workflowRun),
    schedule: data.get(#schedule, or: $value.schedule),
    repositoryDispatch: data.get(
      #repositoryDispatch,
      or: $value.repositoryDispatch,
    ),
    branchProtectionRule: data.get(
      #branchProtectionRule,
      or: $value.branchProtectionRule,
    ),
    checkRun: data.get(#checkRun, or: $value.checkRun),
    checkSuite: data.get(#checkSuite, or: $value.checkSuite),
    create: data.get(#create, or: $value.create),
    delete: data.get(#delete, or: $value.delete),
    deployment: data.get(#deployment, or: $value.deployment),
    deploymentStatus: data.get(#deploymentStatus, or: $value.deploymentStatus),
    discussion: data.get(#discussion, or: $value.discussion),
    discussionComment: data.get(
      #discussionComment,
      or: $value.discussionComment,
    ),
    fork: data.get(#fork, or: $value.fork),
    gollum: data.get(#gollum, or: $value.gollum),
    issueComment: data.get(#issueComment, or: $value.issueComment),
    issues: data.get(#issues, or: $value.issues),
    label: data.get(#label, or: $value.label),
    mergeGroup: data.get(#mergeGroup, or: $value.mergeGroup),
    milestone: data.get(#milestone, or: $value.milestone),
    pageBuild: data.get(#pageBuild, or: $value.pageBuild),
    project: data.get(#project, or: $value.project),
    projectCard: data.get(#projectCard, or: $value.projectCard),
    projectColumn: data.get(#projectColumn, or: $value.projectColumn),
    public: data.get(#public, or: $value.public),
    pullRequestReview: data.get(
      #pullRequestReview,
      or: $value.pullRequestReview,
    ),
    pullRequestReviewComment: data.get(
      #pullRequestReviewComment,
      or: $value.pullRequestReviewComment,
    ),
    registryPackage: data.get(#registryPackage, or: $value.registryPackage),
    release: data.get(#release, or: $value.release),
    status: data.get(#status, or: $value.status),
    watch: data.get(#watch, or: $value.watch),
  );

  @override
  WorkflowTriggersCopyWith<$R2, WorkflowTriggers, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkflowTriggersCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TriggerConfigMapper extends ClassMapperBase<TriggerConfig> {
  TriggerConfigMapper._();

  static TriggerConfigMapper? _instance;
  static TriggerConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TriggerConfigMapper._());
      WorkflowInputMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TriggerConfig';

  static List<String>? _$types(TriggerConfig v) => v.types;
  static const Field<TriggerConfig, List<String>> _f$types = Field(
    'types',
    _$types,
    opt: true,
  );
  static List<String>? _$branches(TriggerConfig v) => v.branches;
  static const Field<TriggerConfig, List<String>> _f$branches = Field(
    'branches',
    _$branches,
    opt: true,
  );
  static List<String>? _$branchesIgnore(TriggerConfig v) => v.branchesIgnore;
  static const Field<TriggerConfig, List<String>> _f$branchesIgnore = Field(
    'branchesIgnore',
    _$branchesIgnore,
    key: r'branches-ignore',
    opt: true,
  );
  static List<String>? _$tags(TriggerConfig v) => v.tags;
  static const Field<TriggerConfig, List<String>> _f$tags = Field(
    'tags',
    _$tags,
    opt: true,
  );
  static List<String>? _$tagsIgnore(TriggerConfig v) => v.tagsIgnore;
  static const Field<TriggerConfig, List<String>> _f$tagsIgnore = Field(
    'tagsIgnore',
    _$tagsIgnore,
    key: r'tags-ignore',
    opt: true,
  );
  static List<String>? _$paths(TriggerConfig v) => v.paths;
  static const Field<TriggerConfig, List<String>> _f$paths = Field(
    'paths',
    _$paths,
    opt: true,
  );
  static List<String>? _$pathsIgnore(TriggerConfig v) => v.pathsIgnore;
  static const Field<TriggerConfig, List<String>> _f$pathsIgnore = Field(
    'pathsIgnore',
    _$pathsIgnore,
    key: r'paths-ignore',
    opt: true,
  );
  static Map<String, WorkflowInput>? _$inputs(TriggerConfig v) => v.inputs;
  static const Field<TriggerConfig, Map<String, WorkflowInput>> _f$inputs =
      Field('inputs', _$inputs, opt: true);
  static List<String>? _$workflows(TriggerConfig v) => v.workflows;
  static const Field<TriggerConfig, List<String>> _f$workflows = Field(
    'workflows',
    _$workflows,
    opt: true,
  );

  @override
  final MappableFields<TriggerConfig> fields = const {
    #types: _f$types,
    #branches: _f$branches,
    #branchesIgnore: _f$branchesIgnore,
    #tags: _f$tags,
    #tagsIgnore: _f$tagsIgnore,
    #paths: _f$paths,
    #pathsIgnore: _f$pathsIgnore,
    #inputs: _f$inputs,
    #workflows: _f$workflows,
  };
  @override
  final bool ignoreNull = true;

  static TriggerConfig _instantiate(DecodingData data) {
    return TriggerConfig(
      types: data.dec(_f$types),
      branches: data.dec(_f$branches),
      branchesIgnore: data.dec(_f$branchesIgnore),
      tags: data.dec(_f$tags),
      tagsIgnore: data.dec(_f$tagsIgnore),
      paths: data.dec(_f$paths),
      pathsIgnore: data.dec(_f$pathsIgnore),
      inputs: data.dec(_f$inputs),
      workflows: data.dec(_f$workflows),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TriggerConfig fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TriggerConfig>(map);
  }

  static TriggerConfig fromJson(String json) {
    return ensureInitialized().decodeJson<TriggerConfig>(json);
  }
}

mixin TriggerConfigMappable {
  String toJson() {
    return TriggerConfigMapper.ensureInitialized().encodeJson<TriggerConfig>(
      this as TriggerConfig,
    );
  }

  Map<String, dynamic> toMap() {
    return TriggerConfigMapper.ensureInitialized().encodeMap<TriggerConfig>(
      this as TriggerConfig,
    );
  }

  TriggerConfigCopyWith<TriggerConfig, TriggerConfig, TriggerConfig>
  get copyWith => _TriggerConfigCopyWithImpl<TriggerConfig, TriggerConfig>(
    this as TriggerConfig,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return TriggerConfigMapper.ensureInitialized().stringifyValue(
      this as TriggerConfig,
    );
  }

  @override
  bool operator ==(Object other) {
    return TriggerConfigMapper.ensureInitialized().equalsValue(
      this as TriggerConfig,
      other,
    );
  }

  @override
  int get hashCode {
    return TriggerConfigMapper.ensureInitialized().hashValue(
      this as TriggerConfig,
    );
  }
}

extension TriggerConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TriggerConfig, $Out> {
  TriggerConfigCopyWith<$R, TriggerConfig, $Out> get $asTriggerConfig =>
      $base.as((v, t, t2) => _TriggerConfigCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TriggerConfigCopyWith<$R, $In extends TriggerConfig, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get types;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get branches;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get branchesIgnore;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tags;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tagsIgnore;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get paths;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get pathsIgnore;
  MapCopyWith<
    $R,
    String,
    WorkflowInput,
    WorkflowInputCopyWith<$R, WorkflowInput, WorkflowInput>
  >?
  get inputs;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get workflows;
  $R call({
    List<String>? types,
    List<String>? branches,
    List<String>? branchesIgnore,
    List<String>? tags,
    List<String>? tagsIgnore,
    List<String>? paths,
    List<String>? pathsIgnore,
    Map<String, WorkflowInput>? inputs,
    List<String>? workflows,
  });
  TriggerConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TriggerConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TriggerConfig, $Out>
    implements TriggerConfigCopyWith<$R, TriggerConfig, $Out> {
  _TriggerConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TriggerConfig> $mapper =
      TriggerConfigMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get types =>
      $value.types != null
      ? ListCopyWith(
          $value.types!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(types: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get branches =>
      $value.branches != null
      ? ListCopyWith(
          $value.branches!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(branches: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get branchesIgnore => $value.branchesIgnore != null
      ? ListCopyWith(
          $value.branchesIgnore!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(branchesIgnore: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tags =>
      $value.tags != null
      ? ListCopyWith(
          $value.tags!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get tagsIgnore => $value.tagsIgnore != null
      ? ListCopyWith(
          $value.tagsIgnore!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tagsIgnore: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get paths =>
      $value.paths != null
      ? ListCopyWith(
          $value.paths!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(paths: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get pathsIgnore => $value.pathsIgnore != null
      ? ListCopyWith(
          $value.pathsIgnore!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(pathsIgnore: v),
        )
      : null;
  @override
  MapCopyWith<
    $R,
    String,
    WorkflowInput,
    WorkflowInputCopyWith<$R, WorkflowInput, WorkflowInput>
  >?
  get inputs => $value.inputs != null
      ? MapCopyWith(
          $value.inputs!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(inputs: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get workflows =>
      $value.workflows != null
      ? ListCopyWith(
          $value.workflows!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(workflows: v),
        )
      : null;
  @override
  $R call({
    Object? types = $none,
    Object? branches = $none,
    Object? branchesIgnore = $none,
    Object? tags = $none,
    Object? tagsIgnore = $none,
    Object? paths = $none,
    Object? pathsIgnore = $none,
    Object? inputs = $none,
    Object? workflows = $none,
  }) => $apply(
    FieldCopyWithData({
      if (types != $none) #types: types,
      if (branches != $none) #branches: branches,
      if (branchesIgnore != $none) #branchesIgnore: branchesIgnore,
      if (tags != $none) #tags: tags,
      if (tagsIgnore != $none) #tagsIgnore: tagsIgnore,
      if (paths != $none) #paths: paths,
      if (pathsIgnore != $none) #pathsIgnore: pathsIgnore,
      if (inputs != $none) #inputs: inputs,
      if (workflows != $none) #workflows: workflows,
    }),
  );
  @override
  TriggerConfig $make(CopyWithData data) => TriggerConfig(
    types: data.get(#types, or: $value.types),
    branches: data.get(#branches, or: $value.branches),
    branchesIgnore: data.get(#branchesIgnore, or: $value.branchesIgnore),
    tags: data.get(#tags, or: $value.tags),
    tagsIgnore: data.get(#tagsIgnore, or: $value.tagsIgnore),
    paths: data.get(#paths, or: $value.paths),
    pathsIgnore: data.get(#pathsIgnore, or: $value.pathsIgnore),
    inputs: data.get(#inputs, or: $value.inputs),
    workflows: data.get(#workflows, or: $value.workflows),
  );

  @override
  TriggerConfigCopyWith<$R2, TriggerConfig, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TriggerConfigCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WorkflowInputMapper extends ClassMapperBase<WorkflowInput> {
  WorkflowInputMapper._();

  static WorkflowInputMapper? _instance;
  static WorkflowInputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkflowInputMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WorkflowInput';

  static String? _$description(WorkflowInput v) => v.description;
  static const Field<WorkflowInput, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static bool? _$required(WorkflowInput v) => v.required;
  static const Field<WorkflowInput, bool> _f$required = Field(
    'required',
    _$required,
    opt: true,
  );
  static Object? _$defaultValue(WorkflowInput v) => v.defaultValue;
  static const Field<WorkflowInput, Object> _f$defaultValue = Field(
    'defaultValue',
    _$defaultValue,
    key: r'default',
    opt: true,
  );
  static String? _$type(WorkflowInput v) => v.type;
  static const Field<WorkflowInput, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static List<Object>? _$options(WorkflowInput v) => v.options;
  static const Field<WorkflowInput, List<Object>> _f$options = Field(
    'options',
    _$options,
    opt: true,
  );
  static String? _$deprecationMessage(WorkflowInput v) => v.deprecationMessage;
  static const Field<WorkflowInput, String> _f$deprecationMessage = Field(
    'deprecationMessage',
    _$deprecationMessage,
    opt: true,
  );

  @override
  final MappableFields<WorkflowInput> fields = const {
    #description: _f$description,
    #required: _f$required,
    #defaultValue: _f$defaultValue,
    #type: _f$type,
    #options: _f$options,
    #deprecationMessage: _f$deprecationMessage,
  };
  @override
  final bool ignoreNull = true;

  static WorkflowInput _instantiate(DecodingData data) {
    return WorkflowInput(
      description: data.dec(_f$description),
      required: data.dec(_f$required),
      defaultValue: data.dec(_f$defaultValue),
      type: data.dec(_f$type),
      options: data.dec(_f$options),
      deprecationMessage: data.dec(_f$deprecationMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WorkflowInput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WorkflowInput>(map);
  }

  static WorkflowInput fromJson(String json) {
    return ensureInitialized().decodeJson<WorkflowInput>(json);
  }
}

mixin WorkflowInputMappable {
  String toJson() {
    return WorkflowInputMapper.ensureInitialized().encodeJson<WorkflowInput>(
      this as WorkflowInput,
    );
  }

  Map<String, dynamic> toMap() {
    return WorkflowInputMapper.ensureInitialized().encodeMap<WorkflowInput>(
      this as WorkflowInput,
    );
  }

  WorkflowInputCopyWith<WorkflowInput, WorkflowInput, WorkflowInput>
  get copyWith => _WorkflowInputCopyWithImpl<WorkflowInput, WorkflowInput>(
    this as WorkflowInput,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return WorkflowInputMapper.ensureInitialized().stringifyValue(
      this as WorkflowInput,
    );
  }

  @override
  bool operator ==(Object other) {
    return WorkflowInputMapper.ensureInitialized().equalsValue(
      this as WorkflowInput,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkflowInputMapper.ensureInitialized().hashValue(
      this as WorkflowInput,
    );
  }
}

extension WorkflowInputValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WorkflowInput, $Out> {
  WorkflowInputCopyWith<$R, WorkflowInput, $Out> get $asWorkflowInput =>
      $base.as((v, t, t2) => _WorkflowInputCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WorkflowInputCopyWith<$R, $In extends WorkflowInput, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Object, ObjectCopyWith<$R, Object, Object>>? get options;
  $R call({
    String? description,
    bool? required,
    Object? defaultValue,
    String? type,
    List<Object>? options,
    String? deprecationMessage,
  });
  WorkflowInputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WorkflowInputCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WorkflowInput, $Out>
    implements WorkflowInputCopyWith<$R, WorkflowInput, $Out> {
  _WorkflowInputCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WorkflowInput> $mapper =
      WorkflowInputMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Object, ObjectCopyWith<$R, Object, Object>>? get options =>
      $value.options != null
      ? ListCopyWith(
          $value.options!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(options: v),
        )
      : null;
  @override
  $R call({
    Object? description = $none,
    Object? required = $none,
    Object? defaultValue = $none,
    Object? type = $none,
    Object? options = $none,
    Object? deprecationMessage = $none,
  }) => $apply(
    FieldCopyWithData({
      if (description != $none) #description: description,
      if (required != $none) #required: required,
      if (defaultValue != $none) #defaultValue: defaultValue,
      if (type != $none) #type: type,
      if (options != $none) #options: options,
      if (deprecationMessage != $none) #deprecationMessage: deprecationMessage,
    }),
  );
  @override
  WorkflowInput $make(CopyWithData data) => WorkflowInput(
    description: data.get(#description, or: $value.description),
    required: data.get(#required, or: $value.required),
    defaultValue: data.get(#defaultValue, or: $value.defaultValue),
    type: data.get(#type, or: $value.type),
    options: data.get(#options, or: $value.options),
    deprecationMessage: data.get(
      #deprecationMessage,
      or: $value.deprecationMessage,
    ),
  );

  @override
  WorkflowInputCopyWith<$R2, WorkflowInput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkflowInputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WorkflowCallConfigMapper extends ClassMapperBase<WorkflowCallConfig> {
  WorkflowCallConfigMapper._();

  static WorkflowCallConfigMapper? _instance;
  static WorkflowCallConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkflowCallConfigMapper._());
      WorkflowInputMapper.ensureInitialized();
      WorkflowOutputMapper.ensureInitialized();
      WorkflowSecretMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WorkflowCallConfig';

  static Map<String, WorkflowInput>? _$inputs(WorkflowCallConfig v) => v.inputs;
  static const Field<WorkflowCallConfig, Map<String, WorkflowInput>> _f$inputs =
      Field('inputs', _$inputs, opt: true);
  static Map<String, WorkflowOutput>? _$outputs(WorkflowCallConfig v) =>
      v.outputs;
  static const Field<WorkflowCallConfig, Map<String, WorkflowOutput>>
  _f$outputs = Field('outputs', _$outputs, opt: true);
  static Map<String, WorkflowSecret>? _$secrets(WorkflowCallConfig v) =>
      v.secrets;
  static const Field<WorkflowCallConfig, Map<String, WorkflowSecret>>
  _f$secrets = Field('secrets', _$secrets, opt: true);

  @override
  final MappableFields<WorkflowCallConfig> fields = const {
    #inputs: _f$inputs,
    #outputs: _f$outputs,
    #secrets: _f$secrets,
  };
  @override
  final bool ignoreNull = true;

  static WorkflowCallConfig _instantiate(DecodingData data) {
    return WorkflowCallConfig(
      inputs: data.dec(_f$inputs),
      outputs: data.dec(_f$outputs),
      secrets: data.dec(_f$secrets),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WorkflowCallConfig fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WorkflowCallConfig>(map);
  }

  static WorkflowCallConfig fromJson(String json) {
    return ensureInitialized().decodeJson<WorkflowCallConfig>(json);
  }
}

mixin WorkflowCallConfigMappable {
  String toJson() {
    return WorkflowCallConfigMapper.ensureInitialized()
        .encodeJson<WorkflowCallConfig>(this as WorkflowCallConfig);
  }

  Map<String, dynamic> toMap() {
    return WorkflowCallConfigMapper.ensureInitialized()
        .encodeMap<WorkflowCallConfig>(this as WorkflowCallConfig);
  }

  WorkflowCallConfigCopyWith<
    WorkflowCallConfig,
    WorkflowCallConfig,
    WorkflowCallConfig
  >
  get copyWith =>
      _WorkflowCallConfigCopyWithImpl<WorkflowCallConfig, WorkflowCallConfig>(
        this as WorkflowCallConfig,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WorkflowCallConfigMapper.ensureInitialized().stringifyValue(
      this as WorkflowCallConfig,
    );
  }

  @override
  bool operator ==(Object other) {
    return WorkflowCallConfigMapper.ensureInitialized().equalsValue(
      this as WorkflowCallConfig,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkflowCallConfigMapper.ensureInitialized().hashValue(
      this as WorkflowCallConfig,
    );
  }
}

extension WorkflowCallConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WorkflowCallConfig, $Out> {
  WorkflowCallConfigCopyWith<$R, WorkflowCallConfig, $Out>
  get $asWorkflowCallConfig => $base.as(
    (v, t, t2) => _WorkflowCallConfigCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class WorkflowCallConfigCopyWith<
  $R,
  $In extends WorkflowCallConfig,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    String,
    WorkflowInput,
    WorkflowInputCopyWith<$R, WorkflowInput, WorkflowInput>
  >?
  get inputs;
  MapCopyWith<
    $R,
    String,
    WorkflowOutput,
    WorkflowOutputCopyWith<$R, WorkflowOutput, WorkflowOutput>
  >?
  get outputs;
  MapCopyWith<
    $R,
    String,
    WorkflowSecret,
    WorkflowSecretCopyWith<$R, WorkflowSecret, WorkflowSecret>
  >?
  get secrets;
  $R call({
    Map<String, WorkflowInput>? inputs,
    Map<String, WorkflowOutput>? outputs,
    Map<String, WorkflowSecret>? secrets,
  });
  WorkflowCallConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WorkflowCallConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WorkflowCallConfig, $Out>
    implements WorkflowCallConfigCopyWith<$R, WorkflowCallConfig, $Out> {
  _WorkflowCallConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WorkflowCallConfig> $mapper =
      WorkflowCallConfigMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    String,
    WorkflowInput,
    WorkflowInputCopyWith<$R, WorkflowInput, WorkflowInput>
  >?
  get inputs => $value.inputs != null
      ? MapCopyWith(
          $value.inputs!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(inputs: v),
        )
      : null;
  @override
  MapCopyWith<
    $R,
    String,
    WorkflowOutput,
    WorkflowOutputCopyWith<$R, WorkflowOutput, WorkflowOutput>
  >?
  get outputs => $value.outputs != null
      ? MapCopyWith(
          $value.outputs!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(outputs: v),
        )
      : null;
  @override
  MapCopyWith<
    $R,
    String,
    WorkflowSecret,
    WorkflowSecretCopyWith<$R, WorkflowSecret, WorkflowSecret>
  >?
  get secrets => $value.secrets != null
      ? MapCopyWith(
          $value.secrets!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(secrets: v),
        )
      : null;
  @override
  $R call({
    Object? inputs = $none,
    Object? outputs = $none,
    Object? secrets = $none,
  }) => $apply(
    FieldCopyWithData({
      if (inputs != $none) #inputs: inputs,
      if (outputs != $none) #outputs: outputs,
      if (secrets != $none) #secrets: secrets,
    }),
  );
  @override
  WorkflowCallConfig $make(CopyWithData data) => WorkflowCallConfig(
    inputs: data.get(#inputs, or: $value.inputs),
    outputs: data.get(#outputs, or: $value.outputs),
    secrets: data.get(#secrets, or: $value.secrets),
  );

  @override
  WorkflowCallConfigCopyWith<$R2, WorkflowCallConfig, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkflowCallConfigCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WorkflowOutputMapper extends ClassMapperBase<WorkflowOutput> {
  WorkflowOutputMapper._();

  static WorkflowOutputMapper? _instance;
  static WorkflowOutputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkflowOutputMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WorkflowOutput';

  static String? _$description(WorkflowOutput v) => v.description;
  static const Field<WorkflowOutput, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String? _$value(WorkflowOutput v) => v.value;
  static const Field<WorkflowOutput, String> _f$value = Field(
    'value',
    _$value,
    opt: true,
  );

  @override
  final MappableFields<WorkflowOutput> fields = const {
    #description: _f$description,
    #value: _f$value,
  };
  @override
  final bool ignoreNull = true;

  static WorkflowOutput _instantiate(DecodingData data) {
    return WorkflowOutput(
      description: data.dec(_f$description),
      value: data.dec(_f$value),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WorkflowOutput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WorkflowOutput>(map);
  }

  static WorkflowOutput fromJson(String json) {
    return ensureInitialized().decodeJson<WorkflowOutput>(json);
  }
}

mixin WorkflowOutputMappable {
  String toJson() {
    return WorkflowOutputMapper.ensureInitialized().encodeJson<WorkflowOutput>(
      this as WorkflowOutput,
    );
  }

  Map<String, dynamic> toMap() {
    return WorkflowOutputMapper.ensureInitialized().encodeMap<WorkflowOutput>(
      this as WorkflowOutput,
    );
  }

  WorkflowOutputCopyWith<WorkflowOutput, WorkflowOutput, WorkflowOutput>
  get copyWith => _WorkflowOutputCopyWithImpl<WorkflowOutput, WorkflowOutput>(
    this as WorkflowOutput,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return WorkflowOutputMapper.ensureInitialized().stringifyValue(
      this as WorkflowOutput,
    );
  }

  @override
  bool operator ==(Object other) {
    return WorkflowOutputMapper.ensureInitialized().equalsValue(
      this as WorkflowOutput,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkflowOutputMapper.ensureInitialized().hashValue(
      this as WorkflowOutput,
    );
  }
}

extension WorkflowOutputValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WorkflowOutput, $Out> {
  WorkflowOutputCopyWith<$R, WorkflowOutput, $Out> get $asWorkflowOutput =>
      $base.as((v, t, t2) => _WorkflowOutputCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WorkflowOutputCopyWith<$R, $In extends WorkflowOutput, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? description, String? value});
  WorkflowOutputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WorkflowOutputCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WorkflowOutput, $Out>
    implements WorkflowOutputCopyWith<$R, WorkflowOutput, $Out> {
  _WorkflowOutputCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WorkflowOutput> $mapper =
      WorkflowOutputMapper.ensureInitialized();
  @override
  $R call({Object? description = $none, Object? value = $none}) => $apply(
    FieldCopyWithData({
      if (description != $none) #description: description,
      if (value != $none) #value: value,
    }),
  );
  @override
  WorkflowOutput $make(CopyWithData data) => WorkflowOutput(
    description: data.get(#description, or: $value.description),
    value: data.get(#value, or: $value.value),
  );

  @override
  WorkflowOutputCopyWith<$R2, WorkflowOutput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkflowOutputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WorkflowSecretMapper extends ClassMapperBase<WorkflowSecret> {
  WorkflowSecretMapper._();

  static WorkflowSecretMapper? _instance;
  static WorkflowSecretMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkflowSecretMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WorkflowSecret';

  static String? _$description(WorkflowSecret v) => v.description;
  static const Field<WorkflowSecret, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static bool? _$required(WorkflowSecret v) => v.required;
  static const Field<WorkflowSecret, bool> _f$required = Field(
    'required',
    _$required,
    opt: true,
  );

  @override
  final MappableFields<WorkflowSecret> fields = const {
    #description: _f$description,
    #required: _f$required,
  };
  @override
  final bool ignoreNull = true;

  static WorkflowSecret _instantiate(DecodingData data) {
    return WorkflowSecret(
      description: data.dec(_f$description),
      required: data.dec(_f$required),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WorkflowSecret fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WorkflowSecret>(map);
  }

  static WorkflowSecret fromJson(String json) {
    return ensureInitialized().decodeJson<WorkflowSecret>(json);
  }
}

mixin WorkflowSecretMappable {
  String toJson() {
    return WorkflowSecretMapper.ensureInitialized().encodeJson<WorkflowSecret>(
      this as WorkflowSecret,
    );
  }

  Map<String, dynamic> toMap() {
    return WorkflowSecretMapper.ensureInitialized().encodeMap<WorkflowSecret>(
      this as WorkflowSecret,
    );
  }

  WorkflowSecretCopyWith<WorkflowSecret, WorkflowSecret, WorkflowSecret>
  get copyWith => _WorkflowSecretCopyWithImpl<WorkflowSecret, WorkflowSecret>(
    this as WorkflowSecret,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return WorkflowSecretMapper.ensureInitialized().stringifyValue(
      this as WorkflowSecret,
    );
  }

  @override
  bool operator ==(Object other) {
    return WorkflowSecretMapper.ensureInitialized().equalsValue(
      this as WorkflowSecret,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkflowSecretMapper.ensureInitialized().hashValue(
      this as WorkflowSecret,
    );
  }
}

extension WorkflowSecretValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WorkflowSecret, $Out> {
  WorkflowSecretCopyWith<$R, WorkflowSecret, $Out> get $asWorkflowSecret =>
      $base.as((v, t, t2) => _WorkflowSecretCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WorkflowSecretCopyWith<$R, $In extends WorkflowSecret, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? description, bool? required});
  WorkflowSecretCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WorkflowSecretCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WorkflowSecret, $Out>
    implements WorkflowSecretCopyWith<$R, WorkflowSecret, $Out> {
  _WorkflowSecretCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WorkflowSecret> $mapper =
      WorkflowSecretMapper.ensureInitialized();
  @override
  $R call({Object? description = $none, Object? required = $none}) => $apply(
    FieldCopyWithData({
      if (description != $none) #description: description,
      if (required != $none) #required: required,
    }),
  );
  @override
  WorkflowSecret $make(CopyWithData data) => WorkflowSecret(
    description: data.get(#description, or: $value.description),
    required: data.get(#required, or: $value.required),
  );

  @override
  WorkflowSecretCopyWith<$R2, WorkflowSecret, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkflowSecretCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WorkflowRunConfigMapper extends ClassMapperBase<WorkflowRunConfig> {
  WorkflowRunConfigMapper._();

  static WorkflowRunConfigMapper? _instance;
  static WorkflowRunConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkflowRunConfigMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WorkflowRunConfig';

  static List<String> _$workflows(WorkflowRunConfig v) => v.workflows;
  static const Field<WorkflowRunConfig, List<String>> _f$workflows = Field(
    'workflows',
    _$workflows,
  );
  static List<String>? _$types(WorkflowRunConfig v) => v.types;
  static const Field<WorkflowRunConfig, List<String>> _f$types = Field(
    'types',
    _$types,
    opt: true,
  );

  @override
  final MappableFields<WorkflowRunConfig> fields = const {
    #workflows: _f$workflows,
    #types: _f$types,
  };
  @override
  final bool ignoreNull = true;

  static WorkflowRunConfig _instantiate(DecodingData data) {
    return WorkflowRunConfig(
      workflows: data.dec(_f$workflows),
      types: data.dec(_f$types),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WorkflowRunConfig fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WorkflowRunConfig>(map);
  }

  static WorkflowRunConfig fromJson(String json) {
    return ensureInitialized().decodeJson<WorkflowRunConfig>(json);
  }
}

mixin WorkflowRunConfigMappable {
  String toJson() {
    return WorkflowRunConfigMapper.ensureInitialized()
        .encodeJson<WorkflowRunConfig>(this as WorkflowRunConfig);
  }

  Map<String, dynamic> toMap() {
    return WorkflowRunConfigMapper.ensureInitialized()
        .encodeMap<WorkflowRunConfig>(this as WorkflowRunConfig);
  }

  WorkflowRunConfigCopyWith<
    WorkflowRunConfig,
    WorkflowRunConfig,
    WorkflowRunConfig
  >
  get copyWith =>
      _WorkflowRunConfigCopyWithImpl<WorkflowRunConfig, WorkflowRunConfig>(
        this as WorkflowRunConfig,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WorkflowRunConfigMapper.ensureInitialized().stringifyValue(
      this as WorkflowRunConfig,
    );
  }

  @override
  bool operator ==(Object other) {
    return WorkflowRunConfigMapper.ensureInitialized().equalsValue(
      this as WorkflowRunConfig,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkflowRunConfigMapper.ensureInitialized().hashValue(
      this as WorkflowRunConfig,
    );
  }
}

extension WorkflowRunConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WorkflowRunConfig, $Out> {
  WorkflowRunConfigCopyWith<$R, WorkflowRunConfig, $Out>
  get $asWorkflowRunConfig => $base.as(
    (v, t, t2) => _WorkflowRunConfigCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class WorkflowRunConfigCopyWith<
  $R,
  $In extends WorkflowRunConfig,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get workflows;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get types;
  $R call({List<String>? workflows, List<String>? types});
  WorkflowRunConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WorkflowRunConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WorkflowRunConfig, $Out>
    implements WorkflowRunConfigCopyWith<$R, WorkflowRunConfig, $Out> {
  _WorkflowRunConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WorkflowRunConfig> $mapper =
      WorkflowRunConfigMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get workflows =>
      ListCopyWith(
        $value.workflows,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(workflows: v),
      );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get types =>
      $value.types != null
      ? ListCopyWith(
          $value.types!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(types: v),
        )
      : null;
  @override
  $R call({List<String>? workflows, Object? types = $none}) => $apply(
    FieldCopyWithData({
      if (workflows != null) #workflows: workflows,
      if (types != $none) #types: types,
    }),
  );
  @override
  WorkflowRunConfig $make(CopyWithData data) => WorkflowRunConfig(
    workflows: data.get(#workflows, or: $value.workflows),
    types: data.get(#types, or: $value.types),
  );

  @override
  WorkflowRunConfigCopyWith<$R2, WorkflowRunConfig, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkflowRunConfigCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CronScheduleMapper extends ClassMapperBase<CronSchedule> {
  CronScheduleMapper._();

  static CronScheduleMapper? _instance;
  static CronScheduleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CronScheduleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CronSchedule';

  static String _$cron(CronSchedule v) => v.cron;
  static const Field<CronSchedule, String> _f$cron = Field('cron', _$cron);

  @override
  final MappableFields<CronSchedule> fields = const {#cron: _f$cron};
  @override
  final bool ignoreNull = true;

  static CronSchedule _instantiate(DecodingData data) {
    return CronSchedule(data.dec(_f$cron));
  }

  @override
  final Function instantiate = _instantiate;

  static CronSchedule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CronSchedule>(map);
  }

  static CronSchedule fromJson(String json) {
    return ensureInitialized().decodeJson<CronSchedule>(json);
  }
}

mixin CronScheduleMappable {
  String toJson() {
    return CronScheduleMapper.ensureInitialized().encodeJson<CronSchedule>(
      this as CronSchedule,
    );
  }

  Map<String, dynamic> toMap() {
    return CronScheduleMapper.ensureInitialized().encodeMap<CronSchedule>(
      this as CronSchedule,
    );
  }

  CronScheduleCopyWith<CronSchedule, CronSchedule, CronSchedule> get copyWith =>
      _CronScheduleCopyWithImpl<CronSchedule, CronSchedule>(
        this as CronSchedule,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CronScheduleMapper.ensureInitialized().stringifyValue(
      this as CronSchedule,
    );
  }

  @override
  bool operator ==(Object other) {
    return CronScheduleMapper.ensureInitialized().equalsValue(
      this as CronSchedule,
      other,
    );
  }

  @override
  int get hashCode {
    return CronScheduleMapper.ensureInitialized().hashValue(
      this as CronSchedule,
    );
  }
}

extension CronScheduleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CronSchedule, $Out> {
  CronScheduleCopyWith<$R, CronSchedule, $Out> get $asCronSchedule =>
      $base.as((v, t, t2) => _CronScheduleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CronScheduleCopyWith<$R, $In extends CronSchedule, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? cron});
  CronScheduleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CronScheduleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CronSchedule, $Out>
    implements CronScheduleCopyWith<$R, CronSchedule, $Out> {
  _CronScheduleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CronSchedule> $mapper =
      CronScheduleMapper.ensureInitialized();
  @override
  $R call({String? cron}) =>
      $apply(FieldCopyWithData({if (cron != null) #cron: cron}));
  @override
  CronSchedule $make(CopyWithData data) =>
      CronSchedule(data.get(#cron, or: $value.cron));

  @override
  CronScheduleCopyWith<$R2, CronSchedule, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CronScheduleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class JobMapper extends ClassMapperBase<Job> {
  JobMapper._();

  static JobMapper? _instance;
  static JobMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JobMapper._());
      RunDefaultsMapper.ensureInitialized();
      StepMapper.ensureInitialized();
      ServiceContainerMapper.ensureInitialized();
      JobStrategyMapper.ensureInitialized();
      PermissionsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Job';

  static String? _$name(Job v) => v.name;
  static const Field<Job, String> _f$name = Field('name', _$name, opt: true);
  static Object? _$runsOn(Job v) => v.runsOn;
  static const Field<Job, Object> _f$runsOn = Field(
    'runsOn',
    _$runsOn,
    key: r'runs-on',
    opt: true,
  );
  static Object? _$needs(Job v) => v.needs;
  static const Field<Job, Object> _f$needs = Field('needs', _$needs, opt: true);
  static Object? _$ifCondition(Job v) => v.ifCondition;
  static const Field<Job, Object> _f$ifCondition = Field(
    'ifCondition',
    _$ifCondition,
    key: r'if',
    opt: true,
  );
  static Object? _$environment(Job v) => v.environment;
  static const Field<Job, Object> _f$environment = Field(
    'environment',
    _$environment,
    opt: true,
  );
  static Object? _$env(Job v) => v.env;
  static const Field<Job, Object> _f$env = Field('env', _$env, opt: true);
  static RunDefaults? _$defaults(Job v) => v.defaults;
  static const Field<Job, RunDefaults> _f$defaults = Field(
    'defaults',
    _$defaults,
    opt: true,
  );
  static Map<String, String>? _$outputs(Job v) => v.outputs;
  static const Field<Job, Map<String, String>> _f$outputs = Field(
    'outputs',
    _$outputs,
    opt: true,
  );
  static List<Step>? _$steps(Job v) => v.steps;
  static const Field<Job, List<Step>> _f$steps = Field(
    'steps',
    _$steps,
    opt: true,
  );
  static Map<String, ServiceContainer>? _$services(Job v) => v.services;
  static const Field<Job, Map<String, ServiceContainer>> _f$services = Field(
    'services',
    _$services,
    opt: true,
  );
  static Object? _$container(Job v) => v.container;
  static const Field<Job, Object> _f$container = Field(
    'container',
    _$container,
    opt: true,
  );
  static JobStrategy? _$strategy(Job v) => v.strategy;
  static const Field<Job, JobStrategy> _f$strategy = Field(
    'strategy',
    _$strategy,
    opt: true,
  );
  static Permissions? _$permissions(Job v) => v.permissions;
  static const Field<Job, Permissions> _f$permissions = Field(
    'permissions',
    _$permissions,
    opt: true,
  );
  static Object? _$concurrency(Job v) => v.concurrency;
  static const Field<Job, Object> _f$concurrency = Field(
    'concurrency',
    _$concurrency,
    opt: true,
  );
  static Object? _$timeoutMinutes(Job v) => v.timeoutMinutes;
  static const Field<Job, Object> _f$timeoutMinutes = Field(
    'timeoutMinutes',
    _$timeoutMinutes,
    key: r'timeout-minutes',
    opt: true,
  );
  static Object? _$continueOnError(Job v) => v.continueOnError;
  static const Field<Job, Object> _f$continueOnError = Field(
    'continueOnError',
    _$continueOnError,
    key: r'continue-on-error',
    opt: true,
  );
  static String? _$uses(Job v) => v.uses;
  static const Field<Job, String> _f$uses = Field('uses', _$uses, opt: true);
  static Map<String, dynamic>? _$withInputs(Job v) => v.withInputs;
  static const Field<Job, Map<String, dynamic>> _f$withInputs = Field(
    'withInputs',
    _$withInputs,
    key: r'with',
    opt: true,
  );
  static Object? _$secrets(Job v) => v.secrets;
  static const Field<Job, Object> _f$secrets = Field(
    'secrets',
    _$secrets,
    opt: true,
  );

  @override
  final MappableFields<Job> fields = const {
    #name: _f$name,
    #runsOn: _f$runsOn,
    #needs: _f$needs,
    #ifCondition: _f$ifCondition,
    #environment: _f$environment,
    #env: _f$env,
    #defaults: _f$defaults,
    #outputs: _f$outputs,
    #steps: _f$steps,
    #services: _f$services,
    #container: _f$container,
    #strategy: _f$strategy,
    #permissions: _f$permissions,
    #concurrency: _f$concurrency,
    #timeoutMinutes: _f$timeoutMinutes,
    #continueOnError: _f$continueOnError,
    #uses: _f$uses,
    #withInputs: _f$withInputs,
    #secrets: _f$secrets,
  };
  @override
  final bool ignoreNull = true;

  static Job _instantiate(DecodingData data) {
    return Job(
      name: data.dec(_f$name),
      runsOn: data.dec(_f$runsOn),
      needs: data.dec(_f$needs),
      ifCondition: data.dec(_f$ifCondition),
      environment: data.dec(_f$environment),
      env: data.dec(_f$env),
      defaults: data.dec(_f$defaults),
      outputs: data.dec(_f$outputs),
      steps: data.dec(_f$steps),
      services: data.dec(_f$services),
      container: data.dec(_f$container),
      strategy: data.dec(_f$strategy),
      permissions: data.dec(_f$permissions),
      concurrency: data.dec(_f$concurrency),
      timeoutMinutes: data.dec(_f$timeoutMinutes),
      continueOnError: data.dec(_f$continueOnError),
      uses: data.dec(_f$uses),
      withInputs: data.dec(_f$withInputs),
      secrets: data.dec(_f$secrets),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Job fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Job>(map);
  }

  static Job fromJson(String json) {
    return ensureInitialized().decodeJson<Job>(json);
  }
}

mixin JobMappable {
  String toJson() {
    return JobMapper.ensureInitialized().encodeJson<Job>(this as Job);
  }

  Map<String, dynamic> toMap() {
    return JobMapper.ensureInitialized().encodeMap<Job>(this as Job);
  }

  JobCopyWith<Job, Job, Job> get copyWith =>
      _JobCopyWithImpl<Job, Job>(this as Job, $identity, $identity);
  @override
  String toString() {
    return JobMapper.ensureInitialized().stringifyValue(this as Job);
  }

  @override
  bool operator ==(Object other) {
    return JobMapper.ensureInitialized().equalsValue(this as Job, other);
  }

  @override
  int get hashCode {
    return JobMapper.ensureInitialized().hashValue(this as Job);
  }
}

extension JobValueCopy<$R, $Out> on ObjectCopyWith<$R, Job, $Out> {
  JobCopyWith<$R, Job, $Out> get $asJob =>
      $base.as((v, t, t2) => _JobCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JobCopyWith<$R, $In extends Job, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  RunDefaultsCopyWith<$R, RunDefaults, RunDefaults>? get defaults;
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>?
  get outputs;
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>>? get steps;
  MapCopyWith<
    $R,
    String,
    ServiceContainer,
    ServiceContainerCopyWith<$R, ServiceContainer, ServiceContainer>
  >?
  get services;
  JobStrategyCopyWith<$R, JobStrategy, JobStrategy>? get strategy;
  PermissionsCopyWith<$R, Permissions, Permissions>? get permissions;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get withInputs;
  $R call({
    String? name,
    Object? runsOn,
    Object? needs,
    Object? ifCondition,
    Object? environment,
    Object? env,
    RunDefaults? defaults,
    Map<String, String>? outputs,
    List<Step>? steps,
    Map<String, ServiceContainer>? services,
    Object? container,
    JobStrategy? strategy,
    Permissions? permissions,
    Object? concurrency,
    Object? timeoutMinutes,
    Object? continueOnError,
    String? uses,
    Map<String, dynamic>? withInputs,
    Object? secrets,
  });
  JobCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JobCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Job, $Out>
    implements JobCopyWith<$R, Job, $Out> {
  _JobCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Job> $mapper = JobMapper.ensureInitialized();
  @override
  RunDefaultsCopyWith<$R, RunDefaults, RunDefaults>? get defaults =>
      $value.defaults?.copyWith.$chain((v) => call(defaults: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>?
  get outputs => $value.outputs != null
      ? MapCopyWith(
          $value.outputs!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(outputs: v),
        )
      : null;
  @override
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>>? get steps =>
      $value.steps != null
      ? ListCopyWith(
          $value.steps!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(steps: v),
        )
      : null;
  @override
  MapCopyWith<
    $R,
    String,
    ServiceContainer,
    ServiceContainerCopyWith<$R, ServiceContainer, ServiceContainer>
  >?
  get services => $value.services != null
      ? MapCopyWith(
          $value.services!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(services: v),
        )
      : null;
  @override
  JobStrategyCopyWith<$R, JobStrategy, JobStrategy>? get strategy =>
      $value.strategy?.copyWith.$chain((v) => call(strategy: v));
  @override
  PermissionsCopyWith<$R, Permissions, Permissions>? get permissions =>
      $value.permissions?.copyWith.$chain((v) => call(permissions: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get withInputs => $value.withInputs != null
      ? MapCopyWith(
          $value.withInputs!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(withInputs: v),
        )
      : null;
  @override
  $R call({
    Object? name = $none,
    Object? runsOn = $none,
    Object? needs = $none,
    Object? ifCondition = $none,
    Object? environment = $none,
    Object? env = $none,
    Object? defaults = $none,
    Object? outputs = $none,
    Object? steps = $none,
    Object? services = $none,
    Object? container = $none,
    Object? strategy = $none,
    Object? permissions = $none,
    Object? concurrency = $none,
    Object? timeoutMinutes = $none,
    Object? continueOnError = $none,
    Object? uses = $none,
    Object? withInputs = $none,
    Object? secrets = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (runsOn != $none) #runsOn: runsOn,
      if (needs != $none) #needs: needs,
      if (ifCondition != $none) #ifCondition: ifCondition,
      if (environment != $none) #environment: environment,
      if (env != $none) #env: env,
      if (defaults != $none) #defaults: defaults,
      if (outputs != $none) #outputs: outputs,
      if (steps != $none) #steps: steps,
      if (services != $none) #services: services,
      if (container != $none) #container: container,
      if (strategy != $none) #strategy: strategy,
      if (permissions != $none) #permissions: permissions,
      if (concurrency != $none) #concurrency: concurrency,
      if (timeoutMinutes != $none) #timeoutMinutes: timeoutMinutes,
      if (continueOnError != $none) #continueOnError: continueOnError,
      if (uses != $none) #uses: uses,
      if (withInputs != $none) #withInputs: withInputs,
      if (secrets != $none) #secrets: secrets,
    }),
  );
  @override
  Job $make(CopyWithData data) => Job(
    name: data.get(#name, or: $value.name),
    runsOn: data.get(#runsOn, or: $value.runsOn),
    needs: data.get(#needs, or: $value.needs),
    ifCondition: data.get(#ifCondition, or: $value.ifCondition),
    environment: data.get(#environment, or: $value.environment),
    env: data.get(#env, or: $value.env),
    defaults: data.get(#defaults, or: $value.defaults),
    outputs: data.get(#outputs, or: $value.outputs),
    steps: data.get(#steps, or: $value.steps),
    services: data.get(#services, or: $value.services),
    container: data.get(#container, or: $value.container),
    strategy: data.get(#strategy, or: $value.strategy),
    permissions: data.get(#permissions, or: $value.permissions),
    concurrency: data.get(#concurrency, or: $value.concurrency),
    timeoutMinutes: data.get(#timeoutMinutes, or: $value.timeoutMinutes),
    continueOnError: data.get(#continueOnError, or: $value.continueOnError),
    uses: data.get(#uses, or: $value.uses),
    withInputs: data.get(#withInputs, or: $value.withInputs),
    secrets: data.get(#secrets, or: $value.secrets),
  );

  @override
  JobCopyWith<$R2, Job, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _JobCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RunDefaultsMapper extends ClassMapperBase<RunDefaults> {
  RunDefaultsMapper._();

  static RunDefaultsMapper? _instance;
  static RunDefaultsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RunDefaultsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RunDefaults';

  static String? _$shell(RunDefaults v) => v.shell;
  static const Field<RunDefaults, String> _f$shell = Field(
    'shell',
    _$shell,
    opt: true,
  );
  static String? _$workingDirectory(RunDefaults v) => v.workingDirectory;
  static const Field<RunDefaults, String> _f$workingDirectory = Field(
    'workingDirectory',
    _$workingDirectory,
    key: r'working-directory',
    opt: true,
  );

  @override
  final MappableFields<RunDefaults> fields = const {
    #shell: _f$shell,
    #workingDirectory: _f$workingDirectory,
  };
  @override
  final bool ignoreNull = true;

  static RunDefaults _instantiate(DecodingData data) {
    return RunDefaults(
      shell: data.dec(_f$shell),
      workingDirectory: data.dec(_f$workingDirectory),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RunDefaults fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RunDefaults>(map);
  }

  static RunDefaults fromJson(String json) {
    return ensureInitialized().decodeJson<RunDefaults>(json);
  }
}

mixin RunDefaultsMappable {
  String toJson() {
    return RunDefaultsMapper.ensureInitialized().encodeJson<RunDefaults>(
      this as RunDefaults,
    );
  }

  Map<String, dynamic> toMap() {
    return RunDefaultsMapper.ensureInitialized().encodeMap<RunDefaults>(
      this as RunDefaults,
    );
  }

  RunDefaultsCopyWith<RunDefaults, RunDefaults, RunDefaults> get copyWith =>
      _RunDefaultsCopyWithImpl<RunDefaults, RunDefaults>(
        this as RunDefaults,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RunDefaultsMapper.ensureInitialized().stringifyValue(
      this as RunDefaults,
    );
  }

  @override
  bool operator ==(Object other) {
    return RunDefaultsMapper.ensureInitialized().equalsValue(
      this as RunDefaults,
      other,
    );
  }

  @override
  int get hashCode {
    return RunDefaultsMapper.ensureInitialized().hashValue(this as RunDefaults);
  }
}

extension RunDefaultsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RunDefaults, $Out> {
  RunDefaultsCopyWith<$R, RunDefaults, $Out> get $asRunDefaults =>
      $base.as((v, t, t2) => _RunDefaultsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RunDefaultsCopyWith<$R, $In extends RunDefaults, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? shell, String? workingDirectory});
  RunDefaultsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RunDefaultsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RunDefaults, $Out>
    implements RunDefaultsCopyWith<$R, RunDefaults, $Out> {
  _RunDefaultsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RunDefaults> $mapper =
      RunDefaultsMapper.ensureInitialized();
  @override
  $R call({Object? shell = $none, Object? workingDirectory = $none}) => $apply(
    FieldCopyWithData({
      if (shell != $none) #shell: shell,
      if (workingDirectory != $none) #workingDirectory: workingDirectory,
    }),
  );
  @override
  RunDefaults $make(CopyWithData data) => RunDefaults(
    shell: data.get(#shell, or: $value.shell),
    workingDirectory: data.get(#workingDirectory, or: $value.workingDirectory),
  );

  @override
  RunDefaultsCopyWith<$R2, RunDefaults, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RunDefaultsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StepMapper extends ClassMapperBase<Step> {
  StepMapper._();

  static StepMapper? _instance;
  static StepMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StepMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Step';

  static String? _$id(Step v) => v.id;
  static const Field<Step, String> _f$id = Field('id', _$id, opt: true);
  static String? _$name(Step v) => v.name;
  static const Field<Step, String> _f$name = Field('name', _$name, opt: true);
  static Object? _$ifCondition(Step v) => v.ifCondition;
  static const Field<Step, Object> _f$ifCondition = Field(
    'ifCondition',
    _$ifCondition,
    key: r'if',
    opt: true,
  );
  static String? _$uses(Step v) => v.uses;
  static const Field<Step, String> _f$uses = Field('uses', _$uses, opt: true);
  static String? _$run(Step v) => v.run;
  static const Field<Step, String> _f$run = Field('run', _$run, opt: true);
  static String? _$shell(Step v) => v.shell;
  static const Field<Step, String> _f$shell = Field(
    'shell',
    _$shell,
    opt: true,
  );
  static Object? _$env(Step v) => v.env;
  static const Field<Step, Object> _f$env = Field('env', _$env, opt: true);
  static Map<String, dynamic>? _$withArguments(Step v) => v.withArguments;
  static const Field<Step, Map<String, dynamic>> _f$withArguments = Field(
    'withArguments',
    _$withArguments,
    key: r'with',
    opt: true,
  );
  static String? _$workingDirectory(Step v) => v.workingDirectory;
  static const Field<Step, String> _f$workingDirectory = Field(
    'workingDirectory',
    _$workingDirectory,
    key: r'working-directory',
    opt: true,
  );
  static Object? _$timeoutMinutes(Step v) => v.timeoutMinutes;
  static const Field<Step, Object> _f$timeoutMinutes = Field(
    'timeoutMinutes',
    _$timeoutMinutes,
    key: r'timeout-minutes',
    opt: true,
  );
  static Object? _$continueOnError(Step v) => v.continueOnError;
  static const Field<Step, Object> _f$continueOnError = Field(
    'continueOnError',
    _$continueOnError,
    key: r'continue-on-error',
    opt: true,
  );

  @override
  final MappableFields<Step> fields = const {
    #id: _f$id,
    #name: _f$name,
    #ifCondition: _f$ifCondition,
    #uses: _f$uses,
    #run: _f$run,
    #shell: _f$shell,
    #env: _f$env,
    #withArguments: _f$withArguments,
    #workingDirectory: _f$workingDirectory,
    #timeoutMinutes: _f$timeoutMinutes,
    #continueOnError: _f$continueOnError,
  };
  @override
  final bool ignoreNull = true;

  static Step _instantiate(DecodingData data) {
    return Step(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      ifCondition: data.dec(_f$ifCondition),
      uses: data.dec(_f$uses),
      run: data.dec(_f$run),
      shell: data.dec(_f$shell),
      env: data.dec(_f$env),
      withArguments: data.dec(_f$withArguments),
      workingDirectory: data.dec(_f$workingDirectory),
      timeoutMinutes: data.dec(_f$timeoutMinutes),
      continueOnError: data.dec(_f$continueOnError),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Step fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Step>(map);
  }

  static Step fromJson(String json) {
    return ensureInitialized().decodeJson<Step>(json);
  }
}

mixin StepMappable {
  String toJson() {
    return StepMapper.ensureInitialized().encodeJson<Step>(this as Step);
  }

  Map<String, dynamic> toMap() {
    return StepMapper.ensureInitialized().encodeMap<Step>(this as Step);
  }

  StepCopyWith<Step, Step, Step> get copyWith =>
      _StepCopyWithImpl<Step, Step>(this as Step, $identity, $identity);
  @override
  String toString() {
    return StepMapper.ensureInitialized().stringifyValue(this as Step);
  }

  @override
  bool operator ==(Object other) {
    return StepMapper.ensureInitialized().equalsValue(this as Step, other);
  }

  @override
  int get hashCode {
    return StepMapper.ensureInitialized().hashValue(this as Step);
  }
}

extension StepValueCopy<$R, $Out> on ObjectCopyWith<$R, Step, $Out> {
  StepCopyWith<$R, Step, $Out> get $asStep =>
      $base.as((v, t, t2) => _StepCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StepCopyWith<$R, $In extends Step, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get withArguments;
  $R call({
    String? id,
    String? name,
    Object? ifCondition,
    String? uses,
    String? run,
    String? shell,
    Object? env,
    Map<String, dynamic>? withArguments,
    String? workingDirectory,
    Object? timeoutMinutes,
    Object? continueOnError,
  });
  StepCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StepCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Step, $Out>
    implements StepCopyWith<$R, Step, $Out> {
  _StepCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Step> $mapper = StepMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get withArguments => $value.withArguments != null
      ? MapCopyWith(
          $value.withArguments!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(withArguments: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? ifCondition = $none,
    Object? uses = $none,
    Object? run = $none,
    Object? shell = $none,
    Object? env = $none,
    Object? withArguments = $none,
    Object? workingDirectory = $none,
    Object? timeoutMinutes = $none,
    Object? continueOnError = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (ifCondition != $none) #ifCondition: ifCondition,
      if (uses != $none) #uses: uses,
      if (run != $none) #run: run,
      if (shell != $none) #shell: shell,
      if (env != $none) #env: env,
      if (withArguments != $none) #withArguments: withArguments,
      if (workingDirectory != $none) #workingDirectory: workingDirectory,
      if (timeoutMinutes != $none) #timeoutMinutes: timeoutMinutes,
      if (continueOnError != $none) #continueOnError: continueOnError,
    }),
  );
  @override
  Step $make(CopyWithData data) => Step(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    ifCondition: data.get(#ifCondition, or: $value.ifCondition),
    uses: data.get(#uses, or: $value.uses),
    run: data.get(#run, or: $value.run),
    shell: data.get(#shell, or: $value.shell),
    env: data.get(#env, or: $value.env),
    withArguments: data.get(#withArguments, or: $value.withArguments),
    workingDirectory: data.get(#workingDirectory, or: $value.workingDirectory),
    timeoutMinutes: data.get(#timeoutMinutes, or: $value.timeoutMinutes),
    continueOnError: data.get(#continueOnError, or: $value.continueOnError),
  );

  @override
  StepCopyWith<$R2, Step, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StepCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ServiceContainerMapper extends ClassMapperBase<ServiceContainer> {
  ServiceContainerMapper._();

  static ServiceContainerMapper? _instance;
  static ServiceContainerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceContainerMapper._());
      ContainerCredentialsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceContainer';

  static String? _$image(ServiceContainer v) => v.image;
  static const Field<ServiceContainer, String> _f$image = Field(
    'image',
    _$image,
    opt: true,
  );
  static ContainerCredentials? _$credentials(ServiceContainer v) =>
      v.credentials;
  static const Field<ServiceContainer, ContainerCredentials> _f$credentials =
      Field('credentials', _$credentials, opt: true);
  static List<Object>? _$ports(ServiceContainer v) => v.ports;
  static const Field<ServiceContainer, List<Object>> _f$ports = Field(
    'ports',
    _$ports,
    opt: true,
  );
  static Map<String, dynamic>? _$env(ServiceContainer v) => v.env;
  static const Field<ServiceContainer, Map<String, dynamic>> _f$env = Field(
    'env',
    _$env,
    opt: true,
  );
  static String? _$options(ServiceContainer v) => v.options;
  static const Field<ServiceContainer, String> _f$options = Field(
    'options',
    _$options,
    opt: true,
  );
  static List<String>? _$volumes(ServiceContainer v) => v.volumes;
  static const Field<ServiceContainer, List<String>> _f$volumes = Field(
    'volumes',
    _$volumes,
    opt: true,
  );

  @override
  final MappableFields<ServiceContainer> fields = const {
    #image: _f$image,
    #credentials: _f$credentials,
    #ports: _f$ports,
    #env: _f$env,
    #options: _f$options,
    #volumes: _f$volumes,
  };
  @override
  final bool ignoreNull = true;

  static ServiceContainer _instantiate(DecodingData data) {
    return ServiceContainer(
      image: data.dec(_f$image),
      credentials: data.dec(_f$credentials),
      ports: data.dec(_f$ports),
      env: data.dec(_f$env),
      options: data.dec(_f$options),
      volumes: data.dec(_f$volumes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceContainer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceContainer>(map);
  }

  static ServiceContainer fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceContainer>(json);
  }
}

mixin ServiceContainerMappable {
  String toJson() {
    return ServiceContainerMapper.ensureInitialized()
        .encodeJson<ServiceContainer>(this as ServiceContainer);
  }

  Map<String, dynamic> toMap() {
    return ServiceContainerMapper.ensureInitialized()
        .encodeMap<ServiceContainer>(this as ServiceContainer);
  }

  ServiceContainerCopyWith<ServiceContainer, ServiceContainer, ServiceContainer>
  get copyWith =>
      _ServiceContainerCopyWithImpl<ServiceContainer, ServiceContainer>(
        this as ServiceContainer,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ServiceContainerMapper.ensureInitialized().stringifyValue(
      this as ServiceContainer,
    );
  }

  @override
  bool operator ==(Object other) {
    return ServiceContainerMapper.ensureInitialized().equalsValue(
      this as ServiceContainer,
      other,
    );
  }

  @override
  int get hashCode {
    return ServiceContainerMapper.ensureInitialized().hashValue(
      this as ServiceContainer,
    );
  }
}

extension ServiceContainerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceContainer, $Out> {
  ServiceContainerCopyWith<$R, ServiceContainer, $Out>
  get $asServiceContainer =>
      $base.as((v, t, t2) => _ServiceContainerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServiceContainerCopyWith<$R, $In extends ServiceContainer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ContainerCredentialsCopyWith<$R, ContainerCredentials, ContainerCredentials>?
  get credentials;
  ListCopyWith<$R, Object, ObjectCopyWith<$R, Object, Object>>? get ports;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get env;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get volumes;
  $R call({
    String? image,
    ContainerCredentials? credentials,
    List<Object>? ports,
    Map<String, dynamic>? env,
    String? options,
    List<String>? volumes,
  });
  ServiceContainerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ServiceContainerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceContainer, $Out>
    implements ServiceContainerCopyWith<$R, ServiceContainer, $Out> {
  _ServiceContainerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceContainer> $mapper =
      ServiceContainerMapper.ensureInitialized();
  @override
  ContainerCredentialsCopyWith<$R, ContainerCredentials, ContainerCredentials>?
  get credentials =>
      $value.credentials?.copyWith.$chain((v) => call(credentials: v));
  @override
  ListCopyWith<$R, Object, ObjectCopyWith<$R, Object, Object>>? get ports =>
      $value.ports != null
      ? ListCopyWith(
          $value.ports!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(ports: v),
        )
      : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get env => $value.env != null
      ? MapCopyWith(
          $value.env!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(env: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get volumes =>
      $value.volumes != null
      ? ListCopyWith(
          $value.volumes!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(volumes: v),
        )
      : null;
  @override
  $R call({
    Object? image = $none,
    Object? credentials = $none,
    Object? ports = $none,
    Object? env = $none,
    Object? options = $none,
    Object? volumes = $none,
  }) => $apply(
    FieldCopyWithData({
      if (image != $none) #image: image,
      if (credentials != $none) #credentials: credentials,
      if (ports != $none) #ports: ports,
      if (env != $none) #env: env,
      if (options != $none) #options: options,
      if (volumes != $none) #volumes: volumes,
    }),
  );
  @override
  ServiceContainer $make(CopyWithData data) => ServiceContainer(
    image: data.get(#image, or: $value.image),
    credentials: data.get(#credentials, or: $value.credentials),
    ports: data.get(#ports, or: $value.ports),
    env: data.get(#env, or: $value.env),
    options: data.get(#options, or: $value.options),
    volumes: data.get(#volumes, or: $value.volumes),
  );

  @override
  ServiceContainerCopyWith<$R2, ServiceContainer, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ServiceContainerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ContainerCredentialsMapper extends ClassMapperBase<ContainerCredentials> {
  ContainerCredentialsMapper._();

  static ContainerCredentialsMapper? _instance;
  static ContainerCredentialsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContainerCredentialsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ContainerCredentials';

  static String? _$username(ContainerCredentials v) => v.username;
  static const Field<ContainerCredentials, String> _f$username = Field(
    'username',
    _$username,
    opt: true,
  );
  static String? _$password(ContainerCredentials v) => v.password;
  static const Field<ContainerCredentials, String> _f$password = Field(
    'password',
    _$password,
    opt: true,
  );

  @override
  final MappableFields<ContainerCredentials> fields = const {
    #username: _f$username,
    #password: _f$password,
  };
  @override
  final bool ignoreNull = true;

  static ContainerCredentials _instantiate(DecodingData data) {
    return ContainerCredentials(
      username: data.dec(_f$username),
      password: data.dec(_f$password),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ContainerCredentials fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ContainerCredentials>(map);
  }

  static ContainerCredentials fromJson(String json) {
    return ensureInitialized().decodeJson<ContainerCredentials>(json);
  }
}

mixin ContainerCredentialsMappable {
  String toJson() {
    return ContainerCredentialsMapper.ensureInitialized()
        .encodeJson<ContainerCredentials>(this as ContainerCredentials);
  }

  Map<String, dynamic> toMap() {
    return ContainerCredentialsMapper.ensureInitialized()
        .encodeMap<ContainerCredentials>(this as ContainerCredentials);
  }

  ContainerCredentialsCopyWith<
    ContainerCredentials,
    ContainerCredentials,
    ContainerCredentials
  >
  get copyWith =>
      _ContainerCredentialsCopyWithImpl<
        ContainerCredentials,
        ContainerCredentials
      >(this as ContainerCredentials, $identity, $identity);
  @override
  String toString() {
    return ContainerCredentialsMapper.ensureInitialized().stringifyValue(
      this as ContainerCredentials,
    );
  }

  @override
  bool operator ==(Object other) {
    return ContainerCredentialsMapper.ensureInitialized().equalsValue(
      this as ContainerCredentials,
      other,
    );
  }

  @override
  int get hashCode {
    return ContainerCredentialsMapper.ensureInitialized().hashValue(
      this as ContainerCredentials,
    );
  }
}

extension ContainerCredentialsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ContainerCredentials, $Out> {
  ContainerCredentialsCopyWith<$R, ContainerCredentials, $Out>
  get $asContainerCredentials => $base.as(
    (v, t, t2) => _ContainerCredentialsCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ContainerCredentialsCopyWith<
  $R,
  $In extends ContainerCredentials,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? username, String? password});
  ContainerCredentialsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ContainerCredentialsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ContainerCredentials, $Out>
    implements ContainerCredentialsCopyWith<$R, ContainerCredentials, $Out> {
  _ContainerCredentialsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ContainerCredentials> $mapper =
      ContainerCredentialsMapper.ensureInitialized();
  @override
  $R call({Object? username = $none, Object? password = $none}) => $apply(
    FieldCopyWithData({
      if (username != $none) #username: username,
      if (password != $none) #password: password,
    }),
  );
  @override
  ContainerCredentials $make(CopyWithData data) => ContainerCredentials(
    username: data.get(#username, or: $value.username),
    password: data.get(#password, or: $value.password),
  );

  @override
  ContainerCredentialsCopyWith<$R2, ContainerCredentials, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ContainerCredentialsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class JobStrategyMapper extends ClassMapperBase<JobStrategy> {
  JobStrategyMapper._();

  static JobStrategyMapper? _instance;
  static JobStrategyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JobStrategyMapper._());
      MatrixMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JobStrategy';

  static Matrix? _$matrix(JobStrategy v) => v.matrix;
  static const Field<JobStrategy, Matrix> _f$matrix = Field(
    'matrix',
    _$matrix,
    opt: true,
  );
  static Object? _$failFast(JobStrategy v) => v.failFast;
  static const Field<JobStrategy, Object> _f$failFast = Field(
    'failFast',
    _$failFast,
    key: r'fail-fast',
    opt: true,
  );
  static Object? _$maxParallel(JobStrategy v) => v.maxParallel;
  static const Field<JobStrategy, Object> _f$maxParallel = Field(
    'maxParallel',
    _$maxParallel,
    key: r'max-parallel',
    opt: true,
  );

  @override
  final MappableFields<JobStrategy> fields = const {
    #matrix: _f$matrix,
    #failFast: _f$failFast,
    #maxParallel: _f$maxParallel,
  };
  @override
  final bool ignoreNull = true;

  static JobStrategy _instantiate(DecodingData data) {
    return JobStrategy(
      matrix: data.dec(_f$matrix),
      failFast: data.dec(_f$failFast),
      maxParallel: data.dec(_f$maxParallel),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static JobStrategy fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JobStrategy>(map);
  }

  static JobStrategy fromJson(String json) {
    return ensureInitialized().decodeJson<JobStrategy>(json);
  }
}

mixin JobStrategyMappable {
  String toJson() {
    return JobStrategyMapper.ensureInitialized().encodeJson<JobStrategy>(
      this as JobStrategy,
    );
  }

  Map<String, dynamic> toMap() {
    return JobStrategyMapper.ensureInitialized().encodeMap<JobStrategy>(
      this as JobStrategy,
    );
  }

  JobStrategyCopyWith<JobStrategy, JobStrategy, JobStrategy> get copyWith =>
      _JobStrategyCopyWithImpl<JobStrategy, JobStrategy>(
        this as JobStrategy,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return JobStrategyMapper.ensureInitialized().stringifyValue(
      this as JobStrategy,
    );
  }

  @override
  bool operator ==(Object other) {
    return JobStrategyMapper.ensureInitialized().equalsValue(
      this as JobStrategy,
      other,
    );
  }

  @override
  int get hashCode {
    return JobStrategyMapper.ensureInitialized().hashValue(this as JobStrategy);
  }
}

extension JobStrategyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JobStrategy, $Out> {
  JobStrategyCopyWith<$R, JobStrategy, $Out> get $asJobStrategy =>
      $base.as((v, t, t2) => _JobStrategyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JobStrategyCopyWith<$R, $In extends JobStrategy, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MatrixCopyWith<$R, Matrix, Matrix>? get matrix;
  $R call({Matrix? matrix, Object? failFast, Object? maxParallel});
  JobStrategyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JobStrategyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JobStrategy, $Out>
    implements JobStrategyCopyWith<$R, JobStrategy, $Out> {
  _JobStrategyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JobStrategy> $mapper =
      JobStrategyMapper.ensureInitialized();
  @override
  MatrixCopyWith<$R, Matrix, Matrix>? get matrix =>
      $value.matrix?.copyWith.$chain((v) => call(matrix: v));
  @override
  $R call({
    Object? matrix = $none,
    Object? failFast = $none,
    Object? maxParallel = $none,
  }) => $apply(
    FieldCopyWithData({
      if (matrix != $none) #matrix: matrix,
      if (failFast != $none) #failFast: failFast,
      if (maxParallel != $none) #maxParallel: maxParallel,
    }),
  );
  @override
  JobStrategy $make(CopyWithData data) => JobStrategy(
    matrix: data.get(#matrix, or: $value.matrix),
    failFast: data.get(#failFast, or: $value.failFast),
    maxParallel: data.get(#maxParallel, or: $value.maxParallel),
  );

  @override
  JobStrategyCopyWith<$R2, JobStrategy, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _JobStrategyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MatrixMapper extends ClassMapperBase<Matrix> {
  MatrixMapper._();

  static MatrixMapper? _instance;
  static MatrixMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatrixMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Matrix';

  static Map<String, Object> _$values(Matrix v) => v.values;
  static const Field<Matrix, Map<String, Object>> _f$values = Field(
    'values',
    _$values,
    opt: true,
    def: const {},
  );
  static List<Map<String, dynamic>>? _$include(Matrix v) => v.include;
  static const Field<Matrix, List<Map<String, dynamic>>> _f$include = Field(
    'include',
    _$include,
    opt: true,
  );
  static List<Map<String, dynamic>>? _$exclude(Matrix v) => v.exclude;
  static const Field<Matrix, List<Map<String, dynamic>>> _f$exclude = Field(
    'exclude',
    _$exclude,
    opt: true,
  );

  @override
  final MappableFields<Matrix> fields = const {
    #values: _f$values,
    #include: _f$include,
    #exclude: _f$exclude,
  };
  @override
  final bool ignoreNull = true;

  static Matrix _instantiate(DecodingData data) {
    return Matrix(
      values: data.dec(_f$values),
      include: data.dec(_f$include),
      exclude: data.dec(_f$exclude),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Matrix fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Matrix>(map);
  }

  static Matrix fromJson(String json) {
    return ensureInitialized().decodeJson<Matrix>(json);
  }
}

mixin MatrixMappable {
  String toJson() {
    return MatrixMapper.ensureInitialized().encodeJson<Matrix>(this as Matrix);
  }

  Map<String, dynamic> toMap() {
    return MatrixMapper.ensureInitialized().encodeMap<Matrix>(this as Matrix);
  }

  MatrixCopyWith<Matrix, Matrix, Matrix> get copyWith =>
      _MatrixCopyWithImpl<Matrix, Matrix>(this as Matrix, $identity, $identity);
  @override
  String toString() {
    return MatrixMapper.ensureInitialized().stringifyValue(this as Matrix);
  }

  @override
  bool operator ==(Object other) {
    return MatrixMapper.ensureInitialized().equalsValue(this as Matrix, other);
  }

  @override
  int get hashCode {
    return MatrixMapper.ensureInitialized().hashValue(this as Matrix);
  }
}

extension MatrixValueCopy<$R, $Out> on ObjectCopyWith<$R, Matrix, $Out> {
  MatrixCopyWith<$R, Matrix, $Out> get $asMatrix =>
      $base.as((v, t, t2) => _MatrixCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MatrixCopyWith<$R, $In extends Matrix, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, Object, ObjectCopyWith<$R, Object, Object>>
  get values;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >?
  get include;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >?
  get exclude;
  $R call({
    Map<String, Object>? values,
    List<Map<String, dynamic>>? include,
    List<Map<String, dynamic>>? exclude,
  });
  MatrixCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MatrixCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Matrix, $Out>
    implements MatrixCopyWith<$R, Matrix, $Out> {
  _MatrixCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Matrix> $mapper = MatrixMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, Object, ObjectCopyWith<$R, Object, Object>>
  get values => MapCopyWith(
    $value.values,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(values: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >?
  get include => $value.include != null
      ? ListCopyWith(
          $value.include!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(include: v),
        )
      : null;
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >?
  get exclude => $value.exclude != null
      ? ListCopyWith(
          $value.exclude!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(exclude: v),
        )
      : null;
  @override
  $R call({
    Map<String, Object>? values,
    Object? include = $none,
    Object? exclude = $none,
  }) => $apply(
    FieldCopyWithData({
      if (values != null) #values: values,
      if (include != $none) #include: include,
      if (exclude != $none) #exclude: exclude,
    }),
  );
  @override
  Matrix $make(CopyWithData data) => Matrix(
    values: data.get(#values, or: $value.values),
    include: data.get(#include, or: $value.include),
    exclude: data.get(#exclude, or: $value.exclude),
  );

  @override
  MatrixCopyWith<$R2, Matrix, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MatrixCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PermissionsMapper extends ClassMapperBase<Permissions> {
  PermissionsMapper._();

  static PermissionsMapper? _instance;
  static PermissionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PermissionsMapper._());
      PermissionsShorthandMapper.ensureInitialized();
      PermissionLevelMapper.ensureInitialized();
      ModelPermissionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Permissions';

  static PermissionsShorthand? _$shorthand(Permissions v) => v.shorthand;
  static const Field<Permissions, PermissionsShorthand> _f$shorthand = Field(
    'shorthand',
    _$shorthand,
    opt: true,
  );
  static PermissionLevel? _$contents(Permissions v) => v.contents;
  static const Field<Permissions, PermissionLevel> _f$contents = Field(
    'contents',
    _$contents,
    opt: true,
  );
  static PermissionLevel? _$packages(Permissions v) => v.packages;
  static const Field<Permissions, PermissionLevel> _f$packages = Field(
    'packages',
    _$packages,
    opt: true,
  );
  static PermissionLevel? _$actions(Permissions v) => v.actions;
  static const Field<Permissions, PermissionLevel> _f$actions = Field(
    'actions',
    _$actions,
    opt: true,
  );
  static PermissionLevel? _$attestations(Permissions v) => v.attestations;
  static const Field<Permissions, PermissionLevel> _f$attestations = Field(
    'attestations',
    _$attestations,
    opt: true,
  );
  static PermissionLevel? _$checks(Permissions v) => v.checks;
  static const Field<Permissions, PermissionLevel> _f$checks = Field(
    'checks',
    _$checks,
    opt: true,
  );
  static PermissionLevel? _$deployments(Permissions v) => v.deployments;
  static const Field<Permissions, PermissionLevel> _f$deployments = Field(
    'deployments',
    _$deployments,
    opt: true,
  );
  static PermissionLevel? _$discussions(Permissions v) => v.discussions;
  static const Field<Permissions, PermissionLevel> _f$discussions = Field(
    'discussions',
    _$discussions,
    opt: true,
  );
  static PermissionLevel? _$idToken(Permissions v) => v.idToken;
  static const Field<Permissions, PermissionLevel> _f$idToken = Field(
    'idToken',
    _$idToken,
    key: r'id-token',
    opt: true,
  );
  static PermissionLevel? _$issues(Permissions v) => v.issues;
  static const Field<Permissions, PermissionLevel> _f$issues = Field(
    'issues',
    _$issues,
    opt: true,
  );
  static ModelPermission? _$models(Permissions v) => v.models;
  static const Field<Permissions, ModelPermission> _f$models = Field(
    'models',
    _$models,
    opt: true,
  );
  static PermissionLevel? _$pages(Permissions v) => v.pages;
  static const Field<Permissions, PermissionLevel> _f$pages = Field(
    'pages',
    _$pages,
    opt: true,
  );
  static PermissionLevel? _$pullRequests(Permissions v) => v.pullRequests;
  static const Field<Permissions, PermissionLevel> _f$pullRequests = Field(
    'pullRequests',
    _$pullRequests,
    key: r'pull-requests',
    opt: true,
  );
  static PermissionLevel? _$repositoryProjects(Permissions v) =>
      v.repositoryProjects;
  static const Field<Permissions, PermissionLevel> _f$repositoryProjects =
      Field(
        'repositoryProjects',
        _$repositoryProjects,
        key: r'repository-projects',
        opt: true,
      );
  static PermissionLevel? _$securityEvents(Permissions v) => v.securityEvents;
  static const Field<Permissions, PermissionLevel> _f$securityEvents = Field(
    'securityEvents',
    _$securityEvents,
    key: r'security-events',
    opt: true,
  );
  static PermissionLevel? _$statuses(Permissions v) => v.statuses;
  static const Field<Permissions, PermissionLevel> _f$statuses = Field(
    'statuses',
    _$statuses,
    opt: true,
  );
  static Map<String, PermissionLevel>? _$additional(Permissions v) =>
      v.additional;
  static const Field<Permissions, Map<String, PermissionLevel>> _f$additional =
      Field('additional', _$additional, opt: true);

  @override
  final MappableFields<Permissions> fields = const {
    #shorthand: _f$shorthand,
    #contents: _f$contents,
    #packages: _f$packages,
    #actions: _f$actions,
    #attestations: _f$attestations,
    #checks: _f$checks,
    #deployments: _f$deployments,
    #discussions: _f$discussions,
    #idToken: _f$idToken,
    #issues: _f$issues,
    #models: _f$models,
    #pages: _f$pages,
    #pullRequests: _f$pullRequests,
    #repositoryProjects: _f$repositoryProjects,
    #securityEvents: _f$securityEvents,
    #statuses: _f$statuses,
    #additional: _f$additional,
  };
  @override
  final bool ignoreNull = true;

  static Permissions _instantiate(DecodingData data) {
    return Permissions(
      shorthand: data.dec(_f$shorthand),
      contents: data.dec(_f$contents),
      packages: data.dec(_f$packages),
      actions: data.dec(_f$actions),
      attestations: data.dec(_f$attestations),
      checks: data.dec(_f$checks),
      deployments: data.dec(_f$deployments),
      discussions: data.dec(_f$discussions),
      idToken: data.dec(_f$idToken),
      issues: data.dec(_f$issues),
      models: data.dec(_f$models),
      pages: data.dec(_f$pages),
      pullRequests: data.dec(_f$pullRequests),
      repositoryProjects: data.dec(_f$repositoryProjects),
      securityEvents: data.dec(_f$securityEvents),
      statuses: data.dec(_f$statuses),
      additional: data.dec(_f$additional),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Permissions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Permissions>(map);
  }

  static Permissions fromJson(String json) {
    return ensureInitialized().decodeJson<Permissions>(json);
  }
}

mixin PermissionsMappable {
  String toJson() {
    return PermissionsMapper.ensureInitialized().encodeJson<Permissions>(
      this as Permissions,
    );
  }

  Map<String, dynamic> toMap() {
    return PermissionsMapper.ensureInitialized().encodeMap<Permissions>(
      this as Permissions,
    );
  }

  PermissionsCopyWith<Permissions, Permissions, Permissions> get copyWith =>
      _PermissionsCopyWithImpl<Permissions, Permissions>(
        this as Permissions,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PermissionsMapper.ensureInitialized().stringifyValue(
      this as Permissions,
    );
  }

  @override
  bool operator ==(Object other) {
    return PermissionsMapper.ensureInitialized().equalsValue(
      this as Permissions,
      other,
    );
  }

  @override
  int get hashCode {
    return PermissionsMapper.ensureInitialized().hashValue(this as Permissions);
  }
}

extension PermissionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Permissions, $Out> {
  PermissionsCopyWith<$R, Permissions, $Out> get $asPermissions =>
      $base.as((v, t, t2) => _PermissionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PermissionsCopyWith<$R, $In extends Permissions, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    String,
    PermissionLevel,
    ObjectCopyWith<$R, PermissionLevel, PermissionLevel>
  >?
  get additional;
  $R call({
    PermissionsShorthand? shorthand,
    PermissionLevel? contents,
    PermissionLevel? packages,
    PermissionLevel? actions,
    PermissionLevel? attestations,
    PermissionLevel? checks,
    PermissionLevel? deployments,
    PermissionLevel? discussions,
    PermissionLevel? idToken,
    PermissionLevel? issues,
    ModelPermission? models,
    PermissionLevel? pages,
    PermissionLevel? pullRequests,
    PermissionLevel? repositoryProjects,
    PermissionLevel? securityEvents,
    PermissionLevel? statuses,
    Map<String, PermissionLevel>? additional,
  });
  PermissionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PermissionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Permissions, $Out>
    implements PermissionsCopyWith<$R, Permissions, $Out> {
  _PermissionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Permissions> $mapper =
      PermissionsMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    String,
    PermissionLevel,
    ObjectCopyWith<$R, PermissionLevel, PermissionLevel>
  >?
  get additional => $value.additional != null
      ? MapCopyWith(
          $value.additional!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(additional: v),
        )
      : null;
  @override
  $R call({
    Object? shorthand = $none,
    Object? contents = $none,
    Object? packages = $none,
    Object? actions = $none,
    Object? attestations = $none,
    Object? checks = $none,
    Object? deployments = $none,
    Object? discussions = $none,
    Object? idToken = $none,
    Object? issues = $none,
    Object? models = $none,
    Object? pages = $none,
    Object? pullRequests = $none,
    Object? repositoryProjects = $none,
    Object? securityEvents = $none,
    Object? statuses = $none,
    Object? additional = $none,
  }) => $apply(
    FieldCopyWithData({
      if (shorthand != $none) #shorthand: shorthand,
      if (contents != $none) #contents: contents,
      if (packages != $none) #packages: packages,
      if (actions != $none) #actions: actions,
      if (attestations != $none) #attestations: attestations,
      if (checks != $none) #checks: checks,
      if (deployments != $none) #deployments: deployments,
      if (discussions != $none) #discussions: discussions,
      if (idToken != $none) #idToken: idToken,
      if (issues != $none) #issues: issues,
      if (models != $none) #models: models,
      if (pages != $none) #pages: pages,
      if (pullRequests != $none) #pullRequests: pullRequests,
      if (repositoryProjects != $none) #repositoryProjects: repositoryProjects,
      if (securityEvents != $none) #securityEvents: securityEvents,
      if (statuses != $none) #statuses: statuses,
      if (additional != $none) #additional: additional,
    }),
  );
  @override
  Permissions $make(CopyWithData data) => Permissions(
    shorthand: data.get(#shorthand, or: $value.shorthand),
    contents: data.get(#contents, or: $value.contents),
    packages: data.get(#packages, or: $value.packages),
    actions: data.get(#actions, or: $value.actions),
    attestations: data.get(#attestations, or: $value.attestations),
    checks: data.get(#checks, or: $value.checks),
    deployments: data.get(#deployments, or: $value.deployments),
    discussions: data.get(#discussions, or: $value.discussions),
    idToken: data.get(#idToken, or: $value.idToken),
    issues: data.get(#issues, or: $value.issues),
    models: data.get(#models, or: $value.models),
    pages: data.get(#pages, or: $value.pages),
    pullRequests: data.get(#pullRequests, or: $value.pullRequests),
    repositoryProjects: data.get(
      #repositoryProjects,
      or: $value.repositoryProjects,
    ),
    securityEvents: data.get(#securityEvents, or: $value.securityEvents),
    statuses: data.get(#statuses, or: $value.statuses),
    additional: data.get(#additional, or: $value.additional),
  );

  @override
  PermissionsCopyWith<$R2, Permissions, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PermissionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WorkflowDefaultsMapper extends ClassMapperBase<WorkflowDefaults> {
  WorkflowDefaultsMapper._();

  static WorkflowDefaultsMapper? _instance;
  static WorkflowDefaultsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkflowDefaultsMapper._());
      RunDefaultsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WorkflowDefaults';

  static RunDefaults? _$run(WorkflowDefaults v) => v.run;
  static const Field<WorkflowDefaults, RunDefaults> _f$run = Field(
    'run',
    _$run,
    opt: true,
  );

  @override
  final MappableFields<WorkflowDefaults> fields = const {#run: _f$run};
  @override
  final bool ignoreNull = true;

  static WorkflowDefaults _instantiate(DecodingData data) {
    return WorkflowDefaults(run: data.dec(_f$run));
  }

  @override
  final Function instantiate = _instantiate;

  static WorkflowDefaults fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WorkflowDefaults>(map);
  }

  static WorkflowDefaults fromJson(String json) {
    return ensureInitialized().decodeJson<WorkflowDefaults>(json);
  }
}

mixin WorkflowDefaultsMappable {
  String toJson() {
    return WorkflowDefaultsMapper.ensureInitialized()
        .encodeJson<WorkflowDefaults>(this as WorkflowDefaults);
  }

  Map<String, dynamic> toMap() {
    return WorkflowDefaultsMapper.ensureInitialized()
        .encodeMap<WorkflowDefaults>(this as WorkflowDefaults);
  }

  WorkflowDefaultsCopyWith<WorkflowDefaults, WorkflowDefaults, WorkflowDefaults>
  get copyWith =>
      _WorkflowDefaultsCopyWithImpl<WorkflowDefaults, WorkflowDefaults>(
        this as WorkflowDefaults,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WorkflowDefaultsMapper.ensureInitialized().stringifyValue(
      this as WorkflowDefaults,
    );
  }

  @override
  bool operator ==(Object other) {
    return WorkflowDefaultsMapper.ensureInitialized().equalsValue(
      this as WorkflowDefaults,
      other,
    );
  }

  @override
  int get hashCode {
    return WorkflowDefaultsMapper.ensureInitialized().hashValue(
      this as WorkflowDefaults,
    );
  }
}

extension WorkflowDefaultsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WorkflowDefaults, $Out> {
  WorkflowDefaultsCopyWith<$R, WorkflowDefaults, $Out>
  get $asWorkflowDefaults =>
      $base.as((v, t, t2) => _WorkflowDefaultsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WorkflowDefaultsCopyWith<$R, $In extends WorkflowDefaults, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  RunDefaultsCopyWith<$R, RunDefaults, RunDefaults>? get run;
  $R call({RunDefaults? run});
  WorkflowDefaultsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WorkflowDefaultsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WorkflowDefaults, $Out>
    implements WorkflowDefaultsCopyWith<$R, WorkflowDefaults, $Out> {
  _WorkflowDefaultsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WorkflowDefaults> $mapper =
      WorkflowDefaultsMapper.ensureInitialized();
  @override
  RunDefaultsCopyWith<$R, RunDefaults, RunDefaults>? get run =>
      $value.run?.copyWith.$chain((v) => call(run: v));
  @override
  $R call({Object? run = $none}) =>
      $apply(FieldCopyWithData({if (run != $none) #run: run}));
  @override
  WorkflowDefaults $make(CopyWithData data) =>
      WorkflowDefaults(run: data.get(#run, or: $value.run));

  @override
  WorkflowDefaultsCopyWith<$R2, WorkflowDefaults, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WorkflowDefaultsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ConcurrencyMapper extends ClassMapperBase<Concurrency> {
  ConcurrencyMapper._();

  static ConcurrencyMapper? _instance;
  static ConcurrencyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConcurrencyMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Concurrency';

  static String _$group(Concurrency v) => v.group;
  static const Field<Concurrency, String> _f$group = Field('group', _$group);
  static Object? _$cancelInProgress(Concurrency v) => v.cancelInProgress;
  static const Field<Concurrency, Object> _f$cancelInProgress = Field(
    'cancelInProgress',
    _$cancelInProgress,
    key: r'cancel-in-progress',
    opt: true,
  );

  @override
  final MappableFields<Concurrency> fields = const {
    #group: _f$group,
    #cancelInProgress: _f$cancelInProgress,
  };
  @override
  final bool ignoreNull = true;

  static Concurrency _instantiate(DecodingData data) {
    return Concurrency(
      group: data.dec(_f$group),
      cancelInProgress: data.dec(_f$cancelInProgress),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Concurrency fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Concurrency>(map);
  }

  static Concurrency fromJson(String json) {
    return ensureInitialized().decodeJson<Concurrency>(json);
  }
}

mixin ConcurrencyMappable {
  String toJson() {
    return ConcurrencyMapper.ensureInitialized().encodeJson<Concurrency>(
      this as Concurrency,
    );
  }

  Map<String, dynamic> toMap() {
    return ConcurrencyMapper.ensureInitialized().encodeMap<Concurrency>(
      this as Concurrency,
    );
  }

  ConcurrencyCopyWith<Concurrency, Concurrency, Concurrency> get copyWith =>
      _ConcurrencyCopyWithImpl<Concurrency, Concurrency>(
        this as Concurrency,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ConcurrencyMapper.ensureInitialized().stringifyValue(
      this as Concurrency,
    );
  }

  @override
  bool operator ==(Object other) {
    return ConcurrencyMapper.ensureInitialized().equalsValue(
      this as Concurrency,
      other,
    );
  }

  @override
  int get hashCode {
    return ConcurrencyMapper.ensureInitialized().hashValue(this as Concurrency);
  }
}

extension ConcurrencyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Concurrency, $Out> {
  ConcurrencyCopyWith<$R, Concurrency, $Out> get $asConcurrency =>
      $base.as((v, t, t2) => _ConcurrencyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ConcurrencyCopyWith<$R, $In extends Concurrency, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? group, Object? cancelInProgress});
  ConcurrencyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConcurrencyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Concurrency, $Out>
    implements ConcurrencyCopyWith<$R, Concurrency, $Out> {
  _ConcurrencyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Concurrency> $mapper =
      ConcurrencyMapper.ensureInitialized();
  @override
  $R call({String? group, Object? cancelInProgress = $none}) => $apply(
    FieldCopyWithData({
      if (group != null) #group: group,
      if (cancelInProgress != $none) #cancelInProgress: cancelInProgress,
    }),
  );
  @override
  Concurrency $make(CopyWithData data) => Concurrency(
    group: data.get(#group, or: $value.group),
    cancelInProgress: data.get(#cancelInProgress, or: $value.cancelInProgress),
  );

  @override
  ConcurrencyCopyWith<$R2, Concurrency, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ConcurrencyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class JobEnvironmentMapper extends ClassMapperBase<JobEnvironment> {
  JobEnvironmentMapper._();

  static JobEnvironmentMapper? _instance;
  static JobEnvironmentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JobEnvironmentMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'JobEnvironment';

  static String _$name(JobEnvironment v) => v.name;
  static const Field<JobEnvironment, String> _f$name = Field('name', _$name);
  static String? _$url(JobEnvironment v) => v.url;
  static const Field<JobEnvironment, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
  );

  @override
  final MappableFields<JobEnvironment> fields = const {
    #name: _f$name,
    #url: _f$url,
  };
  @override
  final bool ignoreNull = true;

  static JobEnvironment _instantiate(DecodingData data) {
    return JobEnvironment(name: data.dec(_f$name), url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static JobEnvironment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JobEnvironment>(map);
  }

  static JobEnvironment fromJson(String json) {
    return ensureInitialized().decodeJson<JobEnvironment>(json);
  }
}

mixin JobEnvironmentMappable {
  String toJson() {
    return JobEnvironmentMapper.ensureInitialized().encodeJson<JobEnvironment>(
      this as JobEnvironment,
    );
  }

  Map<String, dynamic> toMap() {
    return JobEnvironmentMapper.ensureInitialized().encodeMap<JobEnvironment>(
      this as JobEnvironment,
    );
  }

  JobEnvironmentCopyWith<JobEnvironment, JobEnvironment, JobEnvironment>
  get copyWith => _JobEnvironmentCopyWithImpl<JobEnvironment, JobEnvironment>(
    this as JobEnvironment,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return JobEnvironmentMapper.ensureInitialized().stringifyValue(
      this as JobEnvironment,
    );
  }

  @override
  bool operator ==(Object other) {
    return JobEnvironmentMapper.ensureInitialized().equalsValue(
      this as JobEnvironment,
      other,
    );
  }

  @override
  int get hashCode {
    return JobEnvironmentMapper.ensureInitialized().hashValue(
      this as JobEnvironment,
    );
  }
}

extension JobEnvironmentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JobEnvironment, $Out> {
  JobEnvironmentCopyWith<$R, JobEnvironment, $Out> get $asJobEnvironment =>
      $base.as((v, t, t2) => _JobEnvironmentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JobEnvironmentCopyWith<$R, $In extends JobEnvironment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? url});
  JobEnvironmentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _JobEnvironmentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JobEnvironment, $Out>
    implements JobEnvironmentCopyWith<$R, JobEnvironment, $Out> {
  _JobEnvironmentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JobEnvironment> $mapper =
      JobEnvironmentMapper.ensureInitialized();
  @override
  $R call({String? name, Object? url = $none}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (url != $none) #url: url,
    }),
  );
  @override
  JobEnvironment $make(CopyWithData data) => JobEnvironment(
    name: data.get(#name, or: $value.name),
    url: data.get(#url, or: $value.url),
  );

  @override
  JobEnvironmentCopyWith<$R2, JobEnvironment, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _JobEnvironmentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ContainerReferenceMapper extends ClassMapperBase<ContainerReference> {
  ContainerReferenceMapper._();

  static ContainerReferenceMapper? _instance;
  static ContainerReferenceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContainerReferenceMapper._());
      ContainerCredentialsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ContainerReference';

  static String? _$image(ContainerReference v) => v.image;
  static const Field<ContainerReference, String> _f$image = Field(
    'image',
    _$image,
    opt: true,
  );
  static ContainerCredentials? _$credentials(ContainerReference v) =>
      v.credentials;
  static const Field<ContainerReference, ContainerCredentials> _f$credentials =
      Field('credentials', _$credentials, opt: true);
  static Map<String, dynamic>? _$env(ContainerReference v) => v.env;
  static const Field<ContainerReference, Map<String, dynamic>> _f$env = Field(
    'env',
    _$env,
    opt: true,
  );
  static String? _$options(ContainerReference v) => v.options;
  static const Field<ContainerReference, String> _f$options = Field(
    'options',
    _$options,
    opt: true,
  );
  static List<Object>? _$ports(ContainerReference v) => v.ports;
  static const Field<ContainerReference, List<Object>> _f$ports = Field(
    'ports',
    _$ports,
    opt: true,
  );
  static List<String>? _$volumes(ContainerReference v) => v.volumes;
  static const Field<ContainerReference, List<String>> _f$volumes = Field(
    'volumes',
    _$volumes,
    opt: true,
  );

  @override
  final MappableFields<ContainerReference> fields = const {
    #image: _f$image,
    #credentials: _f$credentials,
    #env: _f$env,
    #options: _f$options,
    #ports: _f$ports,
    #volumes: _f$volumes,
  };
  @override
  final bool ignoreNull = true;

  static ContainerReference _instantiate(DecodingData data) {
    return ContainerReference(
      image: data.dec(_f$image),
      credentials: data.dec(_f$credentials),
      env: data.dec(_f$env),
      options: data.dec(_f$options),
      ports: data.dec(_f$ports),
      volumes: data.dec(_f$volumes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ContainerReference fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ContainerReference>(map);
  }

  static ContainerReference fromJson(String json) {
    return ensureInitialized().decodeJson<ContainerReference>(json);
  }
}

mixin ContainerReferenceMappable {
  String toJson() {
    return ContainerReferenceMapper.ensureInitialized()
        .encodeJson<ContainerReference>(this as ContainerReference);
  }

  Map<String, dynamic> toMap() {
    return ContainerReferenceMapper.ensureInitialized()
        .encodeMap<ContainerReference>(this as ContainerReference);
  }

  ContainerReferenceCopyWith<
    ContainerReference,
    ContainerReference,
    ContainerReference
  >
  get copyWith =>
      _ContainerReferenceCopyWithImpl<ContainerReference, ContainerReference>(
        this as ContainerReference,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ContainerReferenceMapper.ensureInitialized().stringifyValue(
      this as ContainerReference,
    );
  }

  @override
  bool operator ==(Object other) {
    return ContainerReferenceMapper.ensureInitialized().equalsValue(
      this as ContainerReference,
      other,
    );
  }

  @override
  int get hashCode {
    return ContainerReferenceMapper.ensureInitialized().hashValue(
      this as ContainerReference,
    );
  }
}

extension ContainerReferenceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ContainerReference, $Out> {
  ContainerReferenceCopyWith<$R, ContainerReference, $Out>
  get $asContainerReference => $base.as(
    (v, t, t2) => _ContainerReferenceCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ContainerReferenceCopyWith<
  $R,
  $In extends ContainerReference,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ContainerCredentialsCopyWith<$R, ContainerCredentials, ContainerCredentials>?
  get credentials;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get env;
  ListCopyWith<$R, Object, ObjectCopyWith<$R, Object, Object>>? get ports;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get volumes;
  $R call({
    String? image,
    ContainerCredentials? credentials,
    Map<String, dynamic>? env,
    String? options,
    List<Object>? ports,
    List<String>? volumes,
  });
  ContainerReferenceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ContainerReferenceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ContainerReference, $Out>
    implements ContainerReferenceCopyWith<$R, ContainerReference, $Out> {
  _ContainerReferenceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ContainerReference> $mapper =
      ContainerReferenceMapper.ensureInitialized();
  @override
  ContainerCredentialsCopyWith<$R, ContainerCredentials, ContainerCredentials>?
  get credentials =>
      $value.credentials?.copyWith.$chain((v) => call(credentials: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get env => $value.env != null
      ? MapCopyWith(
          $value.env!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(env: v),
        )
      : null;
  @override
  ListCopyWith<$R, Object, ObjectCopyWith<$R, Object, Object>>? get ports =>
      $value.ports != null
      ? ListCopyWith(
          $value.ports!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(ports: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get volumes =>
      $value.volumes != null
      ? ListCopyWith(
          $value.volumes!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(volumes: v),
        )
      : null;
  @override
  $R call({
    Object? image = $none,
    Object? credentials = $none,
    Object? env = $none,
    Object? options = $none,
    Object? ports = $none,
    Object? volumes = $none,
  }) => $apply(
    FieldCopyWithData({
      if (image != $none) #image: image,
      if (credentials != $none) #credentials: credentials,
      if (env != $none) #env: env,
      if (options != $none) #options: options,
      if (ports != $none) #ports: ports,
      if (volumes != $none) #volumes: volumes,
    }),
  );
  @override
  ContainerReference $make(CopyWithData data) => ContainerReference(
    image: data.get(#image, or: $value.image),
    credentials: data.get(#credentials, or: $value.credentials),
    env: data.get(#env, or: $value.env),
    options: data.get(#options, or: $value.options),
    ports: data.get(#ports, or: $value.ports),
    volumes: data.get(#volumes, or: $value.volumes),
  );

  @override
  ContainerReferenceCopyWith<$R2, ContainerReference, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ContainerReferenceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

