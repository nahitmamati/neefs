import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:neefs/features/news/presentation/cubit/news_cubit.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/obs_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';
import 'package:neefs/features/user/presentation/pages/login_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/util/color_schemes.dart';
import 'injection_container.dart' as Locator;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
  await Hive.initFlutter();
  await Locator.init();
  configLoading();
}

void configLoading() {
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
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(
            create: (context) => getIt<UserCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<NewsCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<TicketsCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ObsCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getIt<ThemeData>(instanceName: 'lightTheme'),
          darkTheme: getIt<ThemeData>(instanceName: 'darkTheme'),
          themeMode: ThemeMode.light,
          home: const LoginPage(),
          builder: EasyLoading.init(),
        ));
  }
}
