// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// API docs from [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web).
// Attributions and copyright licensing by Mozilla Contributors is licensed
// under [CC-BY-SA 2.5](https://creativecommons.org/licenses/by-sa/2.5/.

// Generated from Web IDL definitions.

@JS()
library;

import 'dart:js_interop';

import 'streams.dart';

typedef CompressionFormat = String;

/// The **`CompressionStream`** interface of the [Compression Streams API] is an
/// API for compressing a stream of data.
extension type CompressionStream._(JSObject _) implements JSObject {
  external factory CompressionStream(CompressionFormat format);

  external ReadableStream get readable;
  external WritableStream get writable;
}

/// The **`DecompressionStream`** interface of the [Compression Streams API] is
/// an API for decompressing a stream of data.
extension type DecompressionStream._(JSObject _) implements JSObject {
  external factory DecompressionStream(CompressionFormat format);

  external ReadableStream get readable;
  external WritableStream get writable;
}
