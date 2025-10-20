part of 'actions.dart';

/// Sets up Node.js using actions/setup-node@v4
Step setupNode({
  String? nodeVersion,
  String? cache, // 'npm', 'pnpm', 'yarn'
  String? cacheDependencyPath,
  String? registryUrl,
  String? scope,
  bool? alwaysAuth,
  String? nodeVersionFile,
  String? architecture,
  bool? checkLatest,
  String? token,
  String? mirror,
  String? mirrorToken,
}) {
  return Step(
    uses: 'actions/setup-node@v4',
    withArguments: buildWith(
      {
        'nodeVersion': nodeVersion,
        'cache': cache,
        'cacheDependencyPath': cacheDependencyPath,
        'registryUrl': registryUrl,
        'scope': scope,
        'alwaysAuth': alwaysAuth,
        'nodeVersionFile': nodeVersionFile,
        'architecture': architecture,
        'checkLatest': checkLatest,
        'token': token,
        'mirror': mirror,
        'mirrorToken': mirrorToken,
      },
      {
        'nodeVersion': 'node-version',
        'nodeVersionFile': 'node-version-file',
        'cacheDependencyPath': 'cache-dependency-path',
        'registryUrl': 'registry-url',
        'alwaysAuth': 'always-auth',
        'checkLatest': 'check-latest',
        'mirrorToken': 'mirror-token',
      },
    ),
  );
}

/// Sets up Python using actions/setup-python@v5
Step setupPython({
  String? pythonVersion,
  String? cache, // 'pip'
  String? pythonVersionFile,
  String? architecture,
  bool? checkLatest,
  String? token,
  String? cacheDependencyPath,
  bool? updateEnvironment,
  bool? allowPrereleases,
  bool? freethreaded,
}) {
  return Step(
    uses: 'actions/setup-python@v5',
    withArguments: buildWith(
      {
        'pythonVersion': pythonVersion,
        'cache': cache,
        'pythonVersionFile': pythonVersionFile,
        'architecture': architecture,
        'checkLatest': checkLatest,
        'token': token,
        'cacheDependencyPath': cacheDependencyPath,
        'updateEnvironment': updateEnvironment,
        'allowPrereleases': allowPrereleases,
        'freethreaded': freethreaded,
      },
      {
        'pythonVersion': 'python-version',
        'pythonVersionFile': 'python-version-file',
        'checkLatest': 'check-latest',
        'cacheDependencyPath': 'cache-dependency-path',
        'updateEnvironment': 'update-environment',
        'allowPrereleases': 'allow-prereleases',
      },
    ),
  );
}

/// Sets up Java using actions/setup-java@v4
Step setupJava({
  String? distribution, // 'temurin', 'zulu', etc.
  String? javaVersion,
  String? cache, // 'maven', 'gradle', 'sbt'
  String? javaVersionFile,
  String? javaPackage,
  String? architecture,
  String? jdkFile,
  bool? checkLatest,
  String? serverId,
  String? serverUsername,
  String? serverPassword,
  String? settingsPath,
  bool? overwriteSettings,
  String? gpgPrivateKey,
  String? gpgPassphrase,
  String? jobStatus,
  String? token,
  String? mvnToolchainId,
  String? mvnToolchainVendor,
}) {
  return Step(
    uses: 'actions/setup-java@v4',
    withArguments: buildWith(
      {
        'distribution': distribution,
        'javaVersion': javaVersion,
        'cache': cache,
        'javaVersionFile': javaVersionFile,
        'javaPackage': javaPackage,
        'architecture': architecture,
        'jdkFile': jdkFile,
        'checkLatest': checkLatest,
        'serverId': serverId,
        'serverUsername': serverUsername,
        'serverPassword': serverPassword,
        'settingsPath': settingsPath,
        'overwriteSettings': overwriteSettings,
        'gpgPrivateKey': gpgPrivateKey,
        'gpgPassphrase': gpgPassphrase,
        'jobStatus': jobStatus,
        'token': token,
        'mvnToolchainId': mvnToolchainId,
        'mvnToolchainVendor': mvnToolchainVendor,
      },
      {
        'javaVersion': 'java-version',
        'javaVersionFile': 'java-version-file',
        'javaPackage': 'java-package',
        'checkLatest': 'check-latest',
        'serverId': 'server-id',
        'serverUsername': 'server-username',
        'serverPassword': 'server-password',
        'settingsPath': 'settings-path',
        'overwriteSettings': 'overwrite-settings',
        'gpgPrivateKey': 'gpg-private-key',
        'gpgPassphrase': 'gpg-passphrase',
        'jobStatus': 'job-status',
        'mvnToolchainId': 'mvn-toolchain-id',
        'mvnToolchainVendor': 'mvn-toolchain-vendor',
      },
    ),
  );
}

/// Sets up Go using actions/setup-go@v5
Step setupGo({
  String? goVersion,
  String? goVersionFile,
  bool? checkLatest,
  String? token,
  bool? cache,
  String? cacheDependencyPath,
  String? architecture,
}) {
  return Step(
    uses: 'actions/setup-go@v5',
    withArguments: buildWith(
      {
        'goVersion': goVersion,
        'goVersionFile': goVersionFile,
        'checkLatest': checkLatest,
        'token': token,
        'cache': cache,
        'cacheDependencyPath': cacheDependencyPath,
        'architecture': architecture,
      },
      {
        'goVersion': 'go-version',
        'goVersionFile': 'go-version-file',
        'checkLatest': 'check-latest',
        'cacheDependencyPath': 'cache-dependency-path',
      },
    ),
  );
}

/// Sets up .NET using actions/setup-dotnet@v4
Step setupDotnet({
  String? dotnetVersion,
  String? dotnetQuality,
  String? globalJsonFile,
  String? sourceUrl,
  String? owner,
  String? configFile,
  bool? cache,
  String? cacheDependencyPath,
}) {
  return Step(
    uses: 'actions/setup-dotnet@v4',
    withArguments: buildWith(
      {
        'dotnetVersion': dotnetVersion,
        'dotnetQuality': dotnetQuality,
        'globalJsonFile': globalJsonFile,
        'sourceUrl': sourceUrl,
        'owner': owner,
        'configFile': configFile,
        'cache': cache,
        'cacheDependencyPath': cacheDependencyPath,
      },
      {
        'dotnetVersion': 'dotnet-version',
        'dotnetQuality': 'dotnet-quality',
        'globalJsonFile': 'global-json-file',
        'sourceUrl': 'source-url',
        'configFile': 'config-file',
        'cacheDependencyPath': 'cache-dependency-path',
      },
    ),
  );
}

/// Sets up Dart using dart-lang/setup-dart@v1
Step setupDart({
  String?
  sdk, // channel (stable, beta, dev, main) or version (e.g., 3.1 or 3.1.1)
  String? flavor, // 'release' or 'raw'
  String? architecture, // 'x64', 'ia32', 'arm', 'arm64'
}) {
  return Step(
    uses: 'dart-lang/setup-dart@v1',
    withArguments: buildWith({
      'sdk': sdk,
      'flavor': flavor,
      'architecture': architecture,
    }, {}),
  );
}
