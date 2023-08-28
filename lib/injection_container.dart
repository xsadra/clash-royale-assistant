import 'package:dio/dio.dart' show Dio;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'clash/data/datasources/datasources.dart';
import 'clash/data/repositories/battles_repository_impl.dart';
import 'clash/data/repositories/current_player_tag_repository_impl.dart';
import 'clash/data/repositories/network_connection_checker_repository_impl.dart';
import 'clash/data/repositories/player_repository_impl.dart';
import 'clash/data/repositories/upcoming_chest_repository_impl.dart';
import 'clash/data/repositories/validate_tag_repository_impl.dart';
import 'clash/data/repositories/version_repository_impl.dart';
import 'clash/domain/repository/battles_repository.dart';
import 'clash/domain/repository/current_player_tag_repository.dart';
import 'clash/domain/repository/network_connection_checker_repository.dart';
import 'clash/domain/repository/player_repository.dart';
import 'clash/domain/repository/upcoming_chest_repository.dart';
import 'clash/domain/repository/validate_tag_repository.dart';
import 'clash/domain/repository/version_repository.dart';
import 'clash/domain/usecases/get_player.dart';
import 'clash/domain/usecases/get_upcoming_chests.dart';
import 'clash/presentation/bloc/battles/bloc.dart';
import 'clash/presentation/bloc/currentplayertag/bloc.dart';
import 'clash/presentation/bloc/network_connection_checker/bloc.dart';
import 'clash/presentation/bloc/player/bloc.dart';
import 'clash/presentation/bloc/upcomingchest/bloc.dart';
import 'clash/presentation/bloc/validatetag/bloc.dart';
import 'clash/presentation/bloc/version_checker/bloc.dart';
import 'core/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => UpcomingChestsBloc(upcomingChests: sl()),
  );
  sl.registerFactory(
    () => PlayerBloc(player: sl()),
  );
  sl.registerFactory(
    () => CurrentPlayerTagBloc(repository: sl()),
  );

  sl.registerFactory(
    () => ValidateTagBloc(repository: sl()),
  );

  sl.registerFactory(
    () => BattlesBloc(repository: sl()),
  );

  sl.registerFactory(
    () => VersionCheckerBloc(repository: sl()),
  );

  sl.registerFactory(
    () => NetworkConnectionCheckerBloc(repository: sl()),
  );

  sl.registerLazySingleton(() => GetUpcomingChests(repository: sl()));
  sl.registerLazySingleton(() => GetPlayer(repository: sl()));

  sl.registerLazySingleton<UpcomingChestsRepository>(
    () => UpcomingChestsRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PlayerRepository>(
    () => PlayerRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<CurrentPlayerTagRepository>(
    () => CurrentPlayerTagRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<ValidateTagRepository>(
    () => ValidateTagRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<BattlesRepository>(
    () => BattlesRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkConnectionCheckerRepository>(
    () => NetworkConnectionCheckerRepositoryImpl(
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<VersionRepository>(
    () => VersionRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<UpcomingChestsLocalDataSource>(
    () => UpcomingChestsLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<UpcomingChestsRemoteDataSource>(
    () => UpcomingChestsRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<PlayerLocalDataSource>(
    () => PlayerLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<PlayerRemoteDataSource>(
    () => PlayerRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<CurrentPlayerTagLocalDataSource>(
    () => CurrentPlayerTagLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<ValidateTagRemoteDataSource>(
    () => ValidateTagRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<BattlesRemoteDataSource>(
    () => BattlesRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<BattlesLocalDataSource>(
    () => BattlesLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<VersionRemoteDataSource>(
    () => VersionRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<VersionLocalDataSource>(
    () => VersionLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
