part of 'actions.dart';

/// Caches dependencies and build outputs using actions/cache@v4
Step cache({
  String? path,
  String? key,
  String? restoreKeys,
  Object? uploadChunkSize,
  bool? enableCrossOsArchive,
  bool? failOnCacheMiss,
  bool? lookupOnly,
  bool? saveAlways,
}) {
  return Step(
    uses: 'actions/cache@v4',
    withArguments: buildWith(
      {
        'path': path,
        'key': key,
        'restoreKeys': restoreKeys,
        'uploadChunkSize': uploadChunkSize,
        'enableCrossOsArchive': enableCrossOsArchive,
        'failOnCacheMiss': failOnCacheMiss,
        'lookupOnly': lookupOnly,
        'saveAlways': saveAlways,
      },
      {
        'restoreKeys': 'restore-keys',
        'uploadChunkSize': 'upload-chunk-size',
        'failOnCacheMiss': 'fail-on-cache-miss',
        'lookupOnly': 'lookup-only',
        'saveAlways': 'save-always',
      },
    ),
  );
}

/// Restores cache without saving using actions/cache/restore@v4
Step cacheRestore({
  required Object path, // String or List<String>
  required String key,
  Object? restoreKeys, // String or List<String>
  bool? enableCrossOsArchive,
}) {
  return Step(
    uses: 'actions/cache/restore@v4',
    withArguments: buildWith(
      {
        'path': path,
        'key': key,
        'restoreKeys': restoreKeys,
        'enableCrossOsArchive': enableCrossOsArchive,
      },
      {'restoreKeys': 'restore-keys'},
    ),
  );
}

/// Saves cache without restoring using actions/cache/save@v4
Step cacheSave({
  required Object path, // String or List<String>
  required String key,
  bool? enableCrossOsArchive,
}) {
  return Step(
    uses: 'actions/cache/save@v4',
    withArguments: buildWith({
      'path': path,
      'key': key,
      'enableCrossOsArchive': enableCrossOsArchive,
    }, {}),
  );
}
