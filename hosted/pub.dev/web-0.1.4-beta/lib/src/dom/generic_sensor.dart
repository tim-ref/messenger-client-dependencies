// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:js_interop';

import 'dom.dart';
import 'hr_time.dart';
import 'html.dart';
import 'webidl.dart';

typedef MockSensorType = String;

@JS('Sensor')
@staticInterop
class Sensor implements EventTarget {}

extension SensorExtension on Sensor {
  external JSVoid start();
  external JSVoid stop();
  external bool get activated;
  external bool get hasReading;
  external DOMHighResTimeStamp? get timestamp;
  external set onreading(EventHandler value);
  external EventHandler get onreading;
  external set onactivate(EventHandler value);
  external EventHandler get onactivate;
  external set onerror(EventHandler value);
  external EventHandler get onerror;
}

@JS()
@staticInterop
@anonymous
class SensorOptions implements JSObject {
  external factory SensorOptions({double frequency});
}

extension SensorOptionsExtension on SensorOptions {
  external set frequency(double value);
  external double get frequency;
}

@JS('SensorErrorEvent')
@staticInterop
class SensorErrorEvent implements Event {
  external factory SensorErrorEvent(
    String type,
    SensorErrorEventInit errorEventInitDict,
  );
}

extension SensorErrorEventExtension on SensorErrorEvent {
  external DOMException get error;
}

@JS()
@staticInterop
@anonymous
class SensorErrorEventInit implements EventInit {
  external factory SensorErrorEventInit({required DOMException error});
}

extension SensorErrorEventInitExtension on SensorErrorEventInit {
  external set error(DOMException value);
  external DOMException get error;
}

@JS()
@staticInterop
@anonymous
class MockSensorConfiguration implements JSObject {
  external factory MockSensorConfiguration({
    required MockSensorType mockSensorType,
    bool connected,
    double? maxSamplingFrequency,
    double? minSamplingFrequency,
  });
}

extension MockSensorConfigurationExtension on MockSensorConfiguration {
  external set mockSensorType(MockSensorType value);
  external MockSensorType get mockSensorType;
  external set connected(bool value);
  external bool get connected;
  external set maxSamplingFrequency(double? value);
  external double? get maxSamplingFrequency;
  external set minSamplingFrequency(double? value);
  external double? get minSamplingFrequency;
}

@JS()
@staticInterop
@anonymous
class MockSensor implements JSObject {
  external factory MockSensor({
    double maxSamplingFrequency,
    double minSamplingFrequency,
    double requestedSamplingFrequency,
  });
}

extension MockSensorExtension on MockSensor {
  external set maxSamplingFrequency(double value);
  external double get maxSamplingFrequency;
  external set minSamplingFrequency(double value);
  external double get minSamplingFrequency;
  external set requestedSamplingFrequency(double value);
  external double get requestedSamplingFrequency;
}

@JS()
@staticInterop
@anonymous
class MockSensorReadingValues implements JSObject {
  external factory MockSensorReadingValues();
}
