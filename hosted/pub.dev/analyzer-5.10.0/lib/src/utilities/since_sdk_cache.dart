// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pub_semver/pub_semver.dart';

/// The instance of [_SinceSdkCache] that should be used in the analyzer.
final _SinceSdkCache sinceSdkCache = _SinceSdkCache();

class _SinceSdkCache {
  final Map<String, Version> _map = {};

  Version? parse(String versionStr) {
    var result = _map[versionStr];
    if (result == null) {
      try {
        result = Version.parse('$versionStr.0');
        _map[versionStr] = result;
      } on FormatException {
        return null;
      }
    }
    return result;
  }
}
