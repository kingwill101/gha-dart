part of 'actions.dart';

/// Configures GitHub Pages using actions/configure-pages@v5
Step configurePages({
  String? staticSiteGenerator,
  String? generatorConfigFile,
  String? token,
  String? enablement,
}) {
  return Step(
    uses: 'actions/configure-pages@v5',
    withArguments: buildWith(
      {
        'staticSiteGenerator': staticSiteGenerator,
        'generatorConfigFile': generatorConfigFile,
        'token': token,
        'enablement': enablement,
      },
      {
        'staticSiteGenerator': 'static_site_generator',
        'generatorConfigFile': 'generator_config_file',
      },
    ),
  );
}

/// Uploads artifact for GitHub Pages using actions/upload-pages-artifact@v3
Step uploadPagesArtifact({required String path, String? name}) {
  return Step(
    uses: 'actions/upload-pages-artifact@v3',
    withArguments: buildWith({'path': path, 'name': name}, {}),
  );
}

/// Deploys to GitHub Pages using actions/deploy-pages@v4
Step deployPages({
  String? token,
  Object? timeout,
  Object? errorCount,
  Object? reportingInterval,
  String? artifactName,
  bool? preview,
}) {
  return Step(
    uses: 'actions/deploy-pages@v4',
    withArguments: buildWith(
      {
        'token': token,
        'timeout': timeout,
        'errorCount': errorCount,
        'reportingInterval': reportingInterval,
        'artifactName': artifactName,
        'preview': preview,
      },
      {
        'errorCount': 'error_count',
        'reportingInterval': 'reporting_interval',
        'artifactName': 'artifact_name',
      },
    ),
  );
}
