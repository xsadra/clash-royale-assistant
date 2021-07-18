import 'package:meta/meta.dart';

import '../../domain/entities/version.dart';

class VersionModel extends Version {
  const VersionModel({
    @required String current,
    @required List<String> features,
    @required List<OldVersionModel> allVersions,
  }) : super(current: current, features: features, allVersions: allVersions);

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      current: json['current'] as String,
      features: json['features'] as List<String>,
      allVersions: json['allVersions'] as List<OldVersionModel>,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'current': this.current,
      'features': this.features,
      'allVersions': this.allVersions,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionModel &&
          runtimeType == other.runtimeType &&
          current == other.current &&
          features == other.features &&
          allVersions == other.allVersions;

  @override
  int get hashCode =>
      current.hashCode ^ features.hashCode ^ allVersions.hashCode;

  @override
  String toString() {
    return 'VersionModel{current: $current, features: $features, allVersions: $allVersions}';
  }
}

class OldVersionModel extends OldVersion {
  const OldVersionModel({
    @required String version,
    @required List<String> features,
  }) : super(version: version, features: features);

  factory OldVersionModel.fromJson(Map<String, dynamic> json) {
    return OldVersionModel(
      version: json['version'] as String,
      features: json['features'] as List<String>,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'version': this.version,
      'features': this.features,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OldVersionModel &&
          runtimeType == other.runtimeType &&
          version == other.version &&
          features == other.features;

  @override
  int get hashCode => version.hashCode ^ features.hashCode;

  @override
  String toString() {
    return 'OldVersionModel{version: $version, features: $features}';
  }
}
