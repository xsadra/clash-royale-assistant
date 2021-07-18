import 'package:meta/meta.dart';

class Version {
  final String current;
  final List<String> features;
  final List<OldVersion> allVersions;

  const Version({
    @required this.current,
    @required this.features,
    @required this.allVersions,
  });
}

class OldVersion {
  final String version;
  final List<String> features;

  const OldVersion({
    @required this.version,
    @required this.features,
  });
}
