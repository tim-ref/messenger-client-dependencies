// ignore_for_file: invalid_annotation_target, sort_unnamed_constructors_first, sort_constructors_first, prefer_mixin

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

// Project imports:
import '../../../../dstu2.dart';

part 'devices.enums.dart';
part 'devices.freezed.dart';
part 'devices.g.dart';

@freezed
class Device with Resource, _$Device {
  const Device._();
  const factory Device({
    @Default(Dstu2ResourceType.Device)
    @JsonKey(unknownEnumValue: Dstu2ResourceType.Device)
    Dstu2ResourceType resourceType,
    @JsonKey(includeFromJson: true, includeToJson: false) int? dbId,
    @JsonKey(name: 'id') FhirId? fhirId,
    FhirMeta? meta,
    FhirUri? implicitRules,
    @JsonKey(name: '_implicitRules') Element? implicitRulesElement,
    FhirCode? language,
    @JsonKey(name: '_language') Element? languageElement,
    Narrative? text,
    List<Resource>? contained,
    @JsonKey(name: 'extension') List<FhirExtension>? extension_,
    List<FhirExtension>? modifierExtension,
    List<Identifier>? identifier,
    required CodeableConcept type,
    List<Annotation>? note,
    @JsonKey(unknownEnumValue: DeviceStatus.unknown) DeviceStatus? status,
    @JsonKey(name: '_status') Element? statusElement,
    String? manufacturer,
    @JsonKey(name: '_manufacturer') Element? manufacturerElement,
    String? model,
    String? version,
    FhirDateTime? manufactureDate,
    @JsonKey(name: '_manufactureDate') Element? manufactureDateElement,
    FhirDateTime? expiry,
    String? udi,
    @JsonKey(name: '_udi') Element? udiElement,
    String? lotNumber,
    @JsonKey(name: '_lotNumber') Element? lotNumberElement,
    Reference? owner,
    Reference? location,
    Reference? patient,
    List<ContactPoint>? contact,
    FhirUri? url,
    @JsonKey(name: '_url') Element? urlElement,
  }) = _Device;

  /// Factory constructor, accepts a [String] in YAML format as an argument
  factory Device.fromYaml(dynamic yaml) => yaml is String
      ? Device.fromJson(
          jsonDecode(jsonEncode(loadYaml(yaml))) as Map<String, dynamic>)
      : yaml is YamlMap
          ? Device.fromJson(
              jsonDecode(jsonEncode(yaml)) as Map<String, dynamic>)
          : throw ArgumentError(
              'Device cannot be constructed from input provided,'
              ' it is neither a yaml string nor a yaml map.');

  /// Factory constructor, accepts [Map<String, dynamic>] as an argument
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  /// Acts like a constructor, returns a [Device], accepts a
  /// [String] as an argument, mostly because I got tired of typing it out
  factory Device.fromJsonString(String source) {
    final dynamic json = jsonDecode(source);
    if (json is Map<String, dynamic>) {
      return _$DeviceFromJson(json);
    } else {
      throw FormatException('FormatException:\nYou passed $json\n'
          'This does not properly decode to a Map<String,dynamic>.');
    }
  }

  /// Another convenience method because more and more I'm transmitting FHIR
  /// data as a String and not a Map
  @override
  String toJsonString() => jsonEncode(toJson());

  Device updateContactPointSystem(ContactPointSystem system, [int index = 0]) {
    if (contact == null || contact!.isEmpty) {
      return copyWith(contact: <ContactPoint>[ContactPoint(system: system)]);
    } else if (index >= contact!.length) {
      return copyWith(
          contact: <ContactPoint>[...contact!, ContactPoint(system: system)]);
    } else {
      return copyWith(contact: <ContactPoint>[
        ...contact!.sublist(0, index),
        contact![index].copyWith(system: system),
        ...contact!.sublist(index + 1)
      ]);
    }
  }

  Device updateContactPointValue(String value, [int index = 0]) {
    if (contact == null || contact!.isEmpty) {
      return copyWith(contact: <ContactPoint>[ContactPoint(value: value)]);
    } else if (index >= contact!.length) {
      return copyWith(
          contact: <ContactPoint>[...contact!, ContactPoint(value: value)]);
    } else {
      return copyWith(contact: <ContactPoint>[
        ...contact!.sublist(0, index),
        contact![index].copyWith(value: value),
        ...contact!.sublist(index + 1)
      ]);
    }
  }

  Device updateContactPointUse(ContactPointUse use, [int index = 0]) {
    if (contact == null || contact!.isEmpty) {
      return copyWith(contact: <ContactPoint>[ContactPoint(use: use)]);
    } else if (index >= contact!.length) {
      return copyWith(
          contact: <ContactPoint>[...contact!, ContactPoint(use: use)]);
    } else {
      return copyWith(contact: <ContactPoint>[
        ...contact!.sublist(0, index),
        contact![index].copyWith(use: use),
        ...contact!.sublist(index + 1)
      ]);
    }
  }

  Device updateContactPointRank(FhirPositiveInt rank, [int index = 0]) {
    if (contact == null || contact!.isEmpty) {
      return copyWith(contact: <ContactPoint>[ContactPoint(rank: rank)]);
    } else if (index >= contact!.length) {
      return copyWith(
          contact: <ContactPoint>[...contact!, ContactPoint(rank: rank)]);
    } else {
      return copyWith(contact: <ContactPoint>[
        ...contact!.sublist(0, index),
        contact![index].copyWith(rank: rank),
        ...contact!.sublist(index + 1)
      ]);
    }
  }

  Device updateContactPointPeriod(Period period, [int index = 0]) {
    if (contact == null || contact!.isEmpty) {
      return copyWith(contact: <ContactPoint>[ContactPoint(period: period)]);
    } else if (index >= contact!.length) {
      return copyWith(
          contact: <ContactPoint>[...contact!, ContactPoint(period: period)]);
    } else {
      return copyWith(contact: <ContactPoint>[
        ...contact!.sublist(0, index),
        contact![index].copyWith(period: period),
        ...contact!.sublist(index + 1)
      ]);
    }
  }
}

@freezed
class DeviceComponent with Resource, _$DeviceComponent {
  const DeviceComponent._();
  const factory DeviceComponent({
    @Default(Dstu2ResourceType.DeviceComponent)
    @JsonKey(unknownEnumValue: Dstu2ResourceType.DeviceComponent)
    Dstu2ResourceType resourceType,
    @JsonKey(includeFromJson: true, includeToJson: false) int? dbId,
    @JsonKey(name: 'id') FhirId? fhirId,
    FhirMeta? meta,
    FhirUri? implicitRules,
    @JsonKey(name: '_implicitRules') Element? implicitRulesElement,
    FhirCode? language,
    @JsonKey(name: '_language') Element? languageElement,
    Narrative? text,
    List<Resource>? contained,
    @JsonKey(name: 'extension') List<FhirExtension>? extension_,
    List<FhirExtension>? modifierExtension,
    required CodeableConcept type,
    required Identifier identifier,
    required FhirInstant lastSystemChange,
    Reference? source,
    Reference? parent,
    List<CodeableConcept>? operationalStatus,
    CodeableConcept? parameterGroup,
    @JsonKey(unknownEnumValue: DeviceComponentMeasurementPrinciple.unknown)
    DeviceComponentMeasurementPrinciple? measurementPrinciple,
    List<DeviceComponentProductionSpecification>? productionSpecification,
    CodeableConcept? languageCode,
  }) = _DeviceComponent;

  /// Factory constructor, accepts a [String] in YAML format as an argument
  factory DeviceComponent.fromYaml(dynamic yaml) => yaml is String
      ? DeviceComponent.fromJson(
          jsonDecode(jsonEncode(loadYaml(yaml))) as Map<String, dynamic>)
      : yaml is YamlMap
          ? DeviceComponent.fromJson(
              jsonDecode(jsonEncode(yaml)) as Map<String, dynamic>)
          : throw ArgumentError(
              'DeviceComponent cannot be constructed from input provided,'
              ' it is neither a yaml string nor a yaml map.');

  /// Factory constructor, accepts [Map<String, dynamic>] as an argument
  factory DeviceComponent.fromJson(Map<String, dynamic> json) =>
      _$DeviceComponentFromJson(json);

  /// Acts like a constructor, returns a [DeviceComponent], accepts a
  /// [String] as an argument, mostly because I got tired of typing it out
  factory DeviceComponent.fromJsonString(String source) {
    final dynamic json = jsonDecode(source);
    if (json is Map<String, dynamic>) {
      return _$DeviceComponentFromJson(json);
    } else {
      throw FormatException('FormatException:\nYou passed $json\n'
          'This does not properly decode to a Map<String,dynamic>.');
    }
  }

  /// Another convenience method because more and more I'm transmitting FHIR
  /// data as a String and not a Map
  @override
  String toJsonString() => jsonEncode(toJson());
}

@freezed
class DeviceComponentProductionSpecification
    with _$DeviceComponentProductionSpecification {
  const DeviceComponentProductionSpecification._();
  const factory DeviceComponentProductionSpecification({
    @JsonKey(name: 'id') FhirId? fhirId,
    @JsonKey(name: 'extension') List<FhirExtension>? extension_,
    List<FhirExtension>? modifierExtension,
    CodeableConcept? specType,
    Identifier? componentId,
    String? productionSpec,
  }) = _DeviceComponentProductionSpecification;

  /// Produces a Yaml formatted String version of the object
  String toYaml() => json2yaml(toJson());

  /// Factory constructor, accepts a [String] in YAML format as an argument
  factory DeviceComponentProductionSpecification.fromYaml(dynamic yaml) => yaml
          is String
      ? DeviceComponentProductionSpecification.fromJson(
          jsonDecode(jsonEncode(loadYaml(yaml))) as Map<String, dynamic>)
      : yaml is YamlMap
          ? DeviceComponentProductionSpecification.fromJson(
              jsonDecode(jsonEncode(yaml)) as Map<String, dynamic>)
          : throw ArgumentError(
              'DeviceComponentProductionSpecification cannot be constructed from input provided,'
              ' it is neither a yaml string nor a yaml map.');

  factory DeviceComponentProductionSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$DeviceComponentProductionSpecificationFromJson(json);
}

@freezed
class DeviceMetric with Resource, _$DeviceMetric {
  const DeviceMetric._();
  const factory DeviceMetric({
    @Default(Dstu2ResourceType.DeviceMetric)
    @JsonKey(unknownEnumValue: Dstu2ResourceType.DeviceMetric)
    Dstu2ResourceType resourceType,
    @JsonKey(includeFromJson: true, includeToJson: false) int? dbId,
    @JsonKey(name: 'id') FhirId? fhirId,
    FhirMeta? meta,
    FhirUri? implicitRules,
    @JsonKey(name: '_implicitRules') Element? implicitRulesElement,
    FhirCode? language,
    @JsonKey(name: '_language') Element? languageElement,
    Narrative? text,
    List<Resource>? contained,
    @JsonKey(name: 'extension') List<FhirExtension>? extension_,
    List<FhirExtension>? modifierExtension,
    required CodeableConcept type,
    required Identifier identifier,
    CodeableConcept? unit,
    Reference? source,
    Reference? parent,
    @JsonKey(unknownEnumValue: DeviceMetricOperationalStatus.unknown)
    DeviceMetricOperationalStatus? operationalStatus,
    @JsonKey(name: '_operationalStatus') Element? operationalStatusElement,
    @JsonKey(unknownEnumValue: DeviceMetricColor.unknown)
    DeviceMetricColor? color,
    @JsonKey(name: '_color') Element? colorElement,
    @JsonKey(unknownEnumValue: DeviceMetricCategory.unknown)
    required DeviceMetricCategory category,
    @JsonKey(name: '_category') Element? categoryElement,
    Timing? measurementPeriod,
    List<DeviceMetricCalibration>? calibration,
  }) = _DeviceMetric;

  /// Factory constructor, accepts a [String] in YAML format as an argument
  factory DeviceMetric.fromYaml(dynamic yaml) => yaml is String
      ? DeviceMetric.fromJson(
          jsonDecode(jsonEncode(loadYaml(yaml))) as Map<String, dynamic>)
      : yaml is YamlMap
          ? DeviceMetric.fromJson(
              jsonDecode(jsonEncode(yaml)) as Map<String, dynamic>)
          : throw ArgumentError(
              'DeviceMetric cannot be constructed from input provided,'
              ' it is neither a yaml string nor a yaml map.');

  /// Factory constructor, accepts [Map<String, dynamic>] as an argument
  factory DeviceMetric.fromJson(Map<String, dynamic> json) =>
      _$DeviceMetricFromJson(json);

  /// Acts like a constructor, returns a [DeviceMetric], accepts a
  /// [String] as an argument, mostly because I got tired of typing it out
  factory DeviceMetric.fromJsonString(String source) {
    final dynamic json = jsonDecode(source);
    if (json is Map<String, dynamic>) {
      return _$DeviceMetricFromJson(json);
    } else {
      throw FormatException('FormatException:\nYou passed $json\n'
          'This does not properly decode to a Map<String,dynamic>.');
    }
  }

  /// Another convenience method because more and more I'm transmitting FHIR
  /// data as a String and not a Map
  @override
  String toJsonString() => jsonEncode(toJson());
}

@freezed
class DeviceMetricCalibration with _$DeviceMetricCalibration {
  const DeviceMetricCalibration._();
  const factory DeviceMetricCalibration({
    @JsonKey(name: 'id') FhirId? fhirId,
    @JsonKey(name: 'extension') List<FhirExtension>? extension_,
    List<FhirExtension>? modifierExtension,
    @JsonKey(unknownEnumValue: CalibrationType.unknown) CalibrationType? type,
    @JsonKey(name: '_type') Element? typeElement,
    @JsonKey(unknownEnumValue: CalibrationState.unknown)
    CalibrationState? state,
    @JsonKey(name: '_state') Element? stateElement,
    FhirInstant? time,
    @JsonKey(name: '_time') Element? timeElement,
  }) = _DeviceMetricCalibration;

  /// Produces a Yaml formatted String version of the object
  String toYaml() => json2yaml(toJson());

  /// Factory constructor, accepts a [String] in YAML format as an argument
  factory DeviceMetricCalibration.fromYaml(dynamic yaml) => yaml is String
      ? DeviceMetricCalibration.fromJson(
          jsonDecode(jsonEncode(loadYaml(yaml))) as Map<String, dynamic>)
      : yaml is YamlMap
          ? DeviceMetricCalibration.fromJson(
              jsonDecode(jsonEncode(yaml)) as Map<String, dynamic>)
          : throw ArgumentError(
              'DeviceMetricCalibration cannot be constructed from input provided,'
              ' it is neither a yaml string nor a yaml map.');

  /// Factory constructor, accepts [Map<String, dynamic>] as an argument
  factory DeviceMetricCalibration.fromJson(Map<String, dynamic> json) =>
      _$DeviceMetricCalibrationFromJson(json);

  /// Acts like a constructor, returns a [DeviceMetricCalibration], accepts a
  /// [String] as an argument, mostly because I got tired of typing it out
  factory DeviceMetricCalibration.fromJsonString(String source) {
    final dynamic json = jsonDecode(source);
    if (json is Map<String, dynamic>) {
      return _$DeviceMetricCalibrationFromJson(json);
    } else {
      throw FormatException('FormatException:\nYou passed $json\n'
          'This does not properly decode to a Map<String,dynamic>.');
    }
  }

  /// Another convenience method because more and more I'm transmitting FHIR
  /// data as a String and not a Map
  String toJsonString() => jsonEncode(toJson());
}
