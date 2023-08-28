
import '../../domain/entities/version.dart';

class VersionModel extends Version {
  const VersionModel({
    required String current,
    required String message,
    required List<String> features,
    required String updateUrl,
    required List<OldVersionModel> allVersions,
  }) : super(
            current: current,
            message: message,
            features: features,
            updateUrl: updateUrl,
            allVersions: allVersions);

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      current: json['current'] as String,
      message: json['message'] as String,
      features: json['features'].cast<String>() as List<String>,
      updateUrl: json['updateUrl'] as String,
      allVersions: (json['allVersions'] as List)
          .map((e) => OldVersionModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'current': this.current,
      'message': this.message,
      'features': this.features,
      'updateUrl': this.updateUrl,
      'allVersions': this.allVersions,
    } as Map<String, dynamic>;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionModel &&
          runtimeType == other.runtimeType &&
          current == other.current &&
          message == other.message &&
          features == other.features &&
          updateUrl == other.updateUrl &&
          allVersions == other.allVersions;

  @override
  int get hashCode =>
      current.hashCode ^
      message.hashCode ^
      features.hashCode ^
      updateUrl.hashCode ^
      allVersions.hashCode;

  @override
  String toString() {
    return 'VersionModel{current: $current, message: $message, features: $features, updateUrl: $updateUrl, allVersions: $allVersions}';
  }
}

class OldVersionModel extends OldVersion {
  const OldVersionModel({
    required String version,
    required List<String> features,
  }) : super(version: version, features: features);

  factory OldVersionModel.fromJson(Map<String, dynamic> json) {
    return OldVersionModel(
      version: json['version'] as String,
      features: json['features'].cast<String>() as List<String>,
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
