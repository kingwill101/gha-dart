import '../workflow.dart';
part 'artifacts.dart';
part 'cache.dart';
part 'languages.dart';
part 'pages.dart';

/// Helper to convert camelCase keys to kebab-case for GitHub Actions
Map<String, dynamic>? buildWith(
  Map<String, dynamic>? opts,
  Map<String, String> mapping,
) {
  if (opts == null) return null;
  final out = <String, dynamic>{};
  for (final entry in opts.entries) {
    final value = entry.value;
    if (value == null) continue;
    final key = mapping[entry.key] ?? entry.key;
    out[key] = value;
  }
  return out.isEmpty ? null : out;
}

/// Checks out your repository using actions/checkout@v4
Step checkout({
  String? ref,
  int? fetchDepth,
  String? repository,
  String? path,
  String? token,
  String? sshKey,
  bool? persistCredentials,
  bool? clean,
  String? filter,
  String? sparseCheckout,
  bool? sparseCheckoutConeMode,
  bool? lfs,
  Object? submodules, // bool or "recursive"
}) {
  return Step(
    uses: 'actions/checkout@v4',
    withArguments: buildWith(
      {
        'ref': ref,
        'fetchDepth': fetchDepth,
        'repository': repository,
        'path': path,
        'token': token,
        'sshKey': sshKey,
        'persistCredentials': persistCredentials,
        'clean': clean,
        'filter': filter,
        'sparseCheckout': sparseCheckout,
        'sparseCheckoutConeMode': sparseCheckoutConeMode,
        'lfs': lfs,
        'submodules': submodules,
      },
      {
        'fetchDepth': 'fetch-depth',
        'sshKey': 'ssh-key',
        'persistCredentials': 'persist-credentials',
        'sparseCheckout': 'sparse-checkout',
        'sparseCheckoutConeMode': 'sparse-checkout-cone-mode',
      },
    ),
  );
}

/// Runs JavaScript code using GitHub's Octokit client via actions/github-script@v7
Step githubScript({
  String? script,
  String? githubToken,
  bool? debug,
  String? userAgent,
  String? previews,
  String? resultEncoding,
  int? retries,
  String? retryExemptStatusCodes,
  String? baseUrl,
}) {
  return Step(
    uses: 'actions/github-script@v7',
    withArguments: buildWith(
      {
        'script': script,
        'githubToken': githubToken,
        'debug': debug,
        'userAgent': userAgent,
        'previews': previews,
        'resultEncoding': resultEncoding,
        'retries': retries,
        'retryExemptStatusCodes': retryExemptStatusCodes,
        'baseUrl': baseUrl,
      },
      {
        'githubToken': 'github-token',
        'userAgent': 'user-agent',
        'resultEncoding': 'result-encoding',
        'retryExemptStatusCodes': 'retry-exempt-status-codes',
        'baseUrl': 'base-url',
      },
    ),
  );
}

/// Creates an installation access token for a GitHub App via actions/create-github-app-token@v2
Step createGitHubAppToken({
  String? appId,
  String? privateKey,
  String? owner,
  String? repositories,
  bool? skipTokenRevoke,
  String? githubApiUrl,
}) {
  return Step(
    uses: 'actions/create-github-app-token@v2',
    withArguments: buildWith(
      {
        'appId': appId,
        'privateKey': privateKey,
        'owner': owner,
        'repositories': repositories,
        'skipTokenRevoke': skipTokenRevoke,
        'githubApiUrl': githubApiUrl,
      },
      {
        'appId': 'app-id',
        'privateKey': 'private-key',
        'skipTokenRevoke': 'skip-token-revoke',
        'githubApiUrl': 'github-api-url',
      },
    ),
  );
}
