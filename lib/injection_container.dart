import 'package:carousel_slider/carousel_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:neefs/core/network/network_info.dart';
import 'package:neefs/features/news/presentation/cubit/news_cubit.dart';
import 'package:neefs/features/news/presentation/pages/bottom_navigation_bar.dart';
import 'package:neefs/features/news/presentation/pages/home_page.dart';
import 'package:neefs/features/news/presentation/pages/news_detail.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/user/data/datasources/user_local_datasource.dart';
import 'package:neefs/features/user/data/datasources/user_remote_datasource.dart';
import 'package:neefs/features/user/data/repositories/user_repository_impl.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/domain/repositories/user_repository.dart';
import 'package:neefs/features/user/domain/usecases/login_usecase.dart';
import 'package:neefs/features/user/domain/usecases/register_usecase.dart';
import 'package:neefs/features/user/presentation/cubit/obs_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';

import 'core/util/color_schemes.dart';
import 'core/util/constants.dart';
import 'features/user/presentation/pages/login_page.dart';
import 'features/user/presentation/pages/register_page.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Loading
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.spinningCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = lightColorScheme.primary
    ..backgroundColor = lightColorScheme.surface
    ..indicatorColor = lightColorScheme.primary
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;

  //Router
  getIt.registerLazySingleton<GoRouter>(() => GoRouter(
        initialLocation: '/login',
        routes: <RouteBase>[
          GoRoute(
            path: '/login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            path: '/register',
            builder: (BuildContext context, GoRouterState state) {
              return const RegisterPage();
            },
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) {
              return const MyBottomNavigationBar();
            },
          ),
          GoRoute(
            path: '/newsDetail',
            builder: (context, state) {
              return  NewsDetail();
            },
          ),
        ],
      ));

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
  ); //Repositories

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
        userRemoteDataSource: getIt<UserRemoteDataSource>(),
        userLocalDataSource: getIt<UserLocalDataSource>(),
        networkInfo: getIt<NetworkInfo>()),
  );

  //Usecases
  getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(userRepository: getIt<UserRepository>()));
  getIt.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(userRepository: getIt<UserRepository>()));

  //Cubits
  getIt.registerFactory<UserCubit>(() => UserCubit(
      loginUseCase: getIt<LoginUsecase>(),
      registerUsecase: getIt<RegisterUsecase>()));
  getIt.registerFactory<NewsCubit>(() => NewsCubit());
  getIt.registerFactory<TicketsCubit>(() => TicketsCubit());
  getIt.registerFactory<ObsCubit>(() => ObsCubit());
  //TextEditingControls
  getIt.registerLazySingleton<TextEditingController>(
      () => TextEditingController(),
      instanceName: 'emailController');
  getIt.registerLazySingleton<TextEditingController>(
      () => TextEditingController(),
      instanceName: 'passwordController');
  getIt.registerLazySingleton<TextEditingController>(
      () => TextEditingController(),
      instanceName: 'fullNameController');
  //FormKeys
  getIt.registerLazySingleton<GlobalKey<FormState>>(
      () => GlobalKey<FormState>(),
      instanceName: 'loginFormKey');
  getIt.registerLazySingleton<GlobalKey<FormState>>(
      () => GlobalKey<FormState>(),
      instanceName: 'registerFormKey');
  //CarouselSlider controller
  getIt.registerLazySingleton<CarouselController>(
          () => CarouselController(),
      instanceName: 'carouselController');
}
