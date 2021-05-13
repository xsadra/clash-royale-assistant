import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile(String tag);
}
