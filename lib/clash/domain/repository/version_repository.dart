import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/version.dart';

abstract class VersionRepository {
  Future<Either<Failure, Version>> getVersion();
  Future<bool> isUpdatedVersion();
  Future<void> saveCurrentVersion(String versionTag);
}
