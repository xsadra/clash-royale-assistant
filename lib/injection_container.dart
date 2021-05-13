import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'clash/data/datasources/profile_local_data_source.dart';
import 'clash/data/datasources/profile_remote_data_source.dart';
import 'clash/data/datasources/upcoming_chest_local_data_source.dart';
import 'clash/data/datasources/upcoming_chest_remote_data_source.dart';
import 'clash/data/repositories/profile_repository_impl.dart';
import 'clash/data/repositories/upcoming_chest_repository_impl.dart';
import 'clash/domain/repository/profile_repository.dart';
import 'clash/domain/repository/upcoming_chest_repository.dart';
import 'clash/domain/usecases/get_profile.dart';
import 'clash/domain/usecases/get_upcoming_chests.dart';
import 'clash/presentation/bloc/profile/profile_bloc.dart';
import 'clash/presentation/bloc/upcomingchest/bloc.dart';
import 'core/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => UpcomingChestsBloc(upcomingChests: sl()),
  );
  sl.registerFactory(
    () => ProfileBloc(profile: sl()),
  );

  sl.registerLazySingleton(() => GetUpcomingChests(repository: sl()));
  sl.registerLazySingleton(() => GetProfile(repository: sl()));

  sl.registerLazySingleton<UpcomingChestsRepository>(
    () => UpcomingChestsRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<UpcomingChestsLocalDataSource>(
    () => UpcomingChestsLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<UpcomingChestsRemoteDataSource>(
    () => UpcomingChestsRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => DataConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
