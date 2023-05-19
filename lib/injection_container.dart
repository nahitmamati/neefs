import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:neefs/core/network/network_info.dart';
import 'package:neefs/features/news/presentation/cubit/news_cubit.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/user/data/datasources/user_local_datasource.dart';
import 'package:neefs/features/user/data/datasources/user_remote_datasource.dart';
import 'package:neefs/features/user/data/repositories/user_repository_impl.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/domain/repositories/user_repository.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';

import 'core/util/color_schemes.dart';
import 'core/util/constants.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  //Cubits
  getIt.registerFactory<UserCubit>(() => UserCubit());
  getIt.registerFactory<NewsCubit>(() => NewsCubit());
  getIt.registerFactory<TicketsCubit>(() => TicketsCubit());

  //Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
        userRemoteDataSource: getIt<UserRemoteDataSource>(),
        userLocalDataSource: getIt<UserLocalDataSource>()),
  );

  //Data Sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
        dio: Dio(BaseOptions(baseUrl: Constants.baseUrl))),
  );
  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(
        userAdaptor: UserAdapter(), walletAdapter: WalletAdapter()),
  );

  //Secure Storage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  //Theme Data
  getIt.registerLazySingleton<ThemeData>(
    instanceName: 'lightTheme',
    () => ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
  );
  getIt.registerLazySingleton<ThemeData>(
    instanceName: 'darkTheme',
    () => ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
  );

  //Connectivity
  getIt.registerLazySingleton<Connectivity>(
    () => Connectivity(),
  );

  //Nework Info

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfo(connectivity: getIt<Connectivity>()),
  );
}
