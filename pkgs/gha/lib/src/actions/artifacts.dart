part of 'actions.dart';

/// Uploads build artifacts using actions/upload-artifact@v4
Step uploadArtifact({
  required Object path, // String or List<String>
  String? name,
  int? retentionDays,
  String? ifNoFilesFound, // 'warn', 'error', 'ignore'
  Object? compressionLevel, // int or String
  bool? overwrite,
  bool? includeHiddenFiles,
}) {
  return Step(
    uses: 'actions/upload-artifact@v4',
    withArguments: buildWith(
      {
        'name': name,
        'path': path,
        'retentionDays': retentionDays,
        'ifNoFilesFound': ifNoFilesFound,
        'compressionLevel': compressionLevel,
        'overwrite': overwrite,
        'includeHiddenFiles': includeHiddenFiles,
      },
      {
        'retentionDays': 'retention-days',
        'ifNoFilesFound': 'if-no-files-found',
        'compressionLevel': 'compression-level',
        'includeHiddenFiles': 'include-hidden-files',
      },
    ),
  );
}

/// Downloads artifacts using actions/download-artifact@v4
Step downloadArtifact({
  String? name,
  String? artifactIds,
  String? path,
  String? pattern,
  String? githubToken,
  String? repository,
  String? runId,
  bool? mergeMultiple,
}) {
  return Step(
    uses: 'actions/download-artifact@v4',
    withArguments: buildWith(
      {
        'name': name,
        'artifactIds': artifactIds,
        'path': path,
        'pattern': pattern,
        'githubToken': githubToken,
        'repository': repository,
        'runId': runId,
        'mergeMultiple': mergeMultiple,
      },
      {
        'artifactIds': 'artifact-ids',
        'githubToken': 'github-token',
        'runId': 'run-id',
        'mergeMultiple': 'merge-multiple',
      },
    ),
  );
}
