// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:js_interop';

import 'generic_sensor.dart';

typedef AccelerometerLocalCoordinateSystem = String;

@JS('Accelerometer')
@staticInterop
class Accelerometer implements Sensor {
  external factory Accelerometer([AccelerometerSensorOptions options]);
}

extension AccelerometerExtension on Accelerometer {
  external double? get x;
  external double? get y;
  external double? get z;
}

@JS()
@staticInterop
@anonymous
class AccelerometerSensorOptions implements SensorOptions {
  external factory AccelerometerSensorOptions(
      {AccelerometerLocalCoordinateSystem referenceFrame});
}

extension AccelerometerSensorOptionsExtension on AccelerometerSensorOptions {
  external set referenceFrame(AccelerometerLocalCoordinateSystem value);
  external AccelerometerLocalCoordinateSystem get referenceFrame;
}

@JS('LinearAccelerationSensor')
@staticInterop
class LinearAccelerationSensor implements Accelerometer {
  external factory LinearAccelerationSensor(
      [AccelerometerSensorOptions options]);
}

@JS('GravitySensor')
@staticInterop
class GravitySensor implements Accelerometer {
  external factory GravitySensor([AccelerometerSensorOptions options]);
}

@JS()
@staticInterop
@anonymous
class AccelerometerReadingValues implements JSObject {
  external factory AccelerometerReadingValues({
    required double? x,
    required double? y,
    required double? z,
  });
}

extension AccelerometerReadingValuesExtension on AccelerometerReadingValues {
  external set x(double? value);
  external double? get x;
  external set y(double? value);
  external double? get y;
  external set z(double? value);
  external double? get z;
}

@JS()
@staticInterop
@anonymous
class LinearAccelerationReadingValues implements AccelerometerReadingValues {
  external factory LinearAccelerationReadingValues();
}

@JS()
@staticInterop
@anonymous
class GravityReadingValues implements AccelerometerReadingValues {
  external factory GravityReadingValues();
}