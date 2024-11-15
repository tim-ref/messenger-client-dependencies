// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:js_interop';

import 'html.dart';

typedef FencedFrameConfigSize = JSAny?;
typedef FencedFrameConfigURL = String;
typedef ReportEventType = JSAny?;
typedef OpaqueProperty = String;
typedef FenceReportingDestination = String;

@JS('HTMLFencedFrameElement')
@staticInterop
class HTMLFencedFrameElement implements HTMLElement {
  external factory HTMLFencedFrameElement();
}

extension HTMLFencedFrameElementExtension on HTMLFencedFrameElement {
  external set config(FencedFrameConfig? value);
  external FencedFrameConfig? get config;
  external set width(String value);
  external String get width;
  external set height(String value);
  external String get height;
}

@JS('FencedFrameConfig')
@staticInterop
class FencedFrameConfig implements JSObject {}

extension FencedFrameConfigExtension on FencedFrameConfig {
  external JSVoid setSharedStorageContext(String contextString);
  external FencedFrameConfigURL? get url;
  external FencedFrameConfigSize? get containerWidth;
  external FencedFrameConfigSize? get containerHeight;
  external FencedFrameConfigSize? get contentWidth;
  external FencedFrameConfigSize? get contentHeight;
}

@JS()
@staticInterop
@anonymous
class FenceEvent implements JSObject {
  external factory FenceEvent({
    required String eventType,
    required String eventData,
    required JSArray destination,
  });
}

extension FenceEventExtension on FenceEvent {
  external set eventType(String value);
  external String get eventType;
  external set eventData(String value);
  external String get eventData;
  external set destination(JSArray value);
  external JSArray get destination;
}

@JS('Fence')
@staticInterop
class Fence implements JSObject {}

extension FenceExtension on Fence {
  external JSVoid reportEvent(ReportEventType event);
  external JSVoid setReportEventDataForAutomaticBeacons(FenceEvent event);
  external JSArray getNestedConfigs();
}
