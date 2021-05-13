import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/failure.dart';
import '../entities/profile.dart';
import '../repository/profile_repository.dart';

class GetProfile {
  final ProfileRepository repository;

  const GetProfile({
    @required this.repository,
  });

  Future<Either<Failure, Profile>> call(String playerTag) async =>
      await repository.getProfile(playerTag);
}
