// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:js_interop';

import 'webgl1.dart';

@JS('WEBGL_debug_shaders')
@staticInterop
class WEBGL_debug_shaders implements JSObject {}

extension WEBGLDebugShadersExtension on WEBGL_debug_shaders {
  external String getTranslatedShaderSource(WebGLShader shader);
}
