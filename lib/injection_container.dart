import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'clash/data/datasources/datasources.dart';
import 'clash/data/datasources/player_local_data_source.dart';
import 'clash/data/datasources/player_remote_data_source.dart';
import 'clash/data/datasources/upcoming_chest_local_data_source.dart';
import 'clash/data/datasources/upcoming_chest_remote_data_source.dart';
import 'clash/data/repositories/current_player_tag_repository_impl.dart';
import 'clash/data/repositories/player_repository_impl.dart';
import 'clash/data/repositories/upcoming_chest_repository_impl.dart';
import 'clash/domain/repository/current_player_tag_repository.dart';
import 'clash/domain/repository/player_repository.dart';
import 'clash/domain/repository/upcoming_chest_repository.dart';
import 'clash/domain/usecases/get_player.dart';
import 'clash/domain/usecases/get_upcoming_chests.dart';
import 'clash/presentation/bloc/currentplayertag/bloc.dart';
import 'clash/presentation/bloc/player/bloc.dart';
import 'clash/presentation/bloc/upcomingchest/bloc.dart';
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

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => DataConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
