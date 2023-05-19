import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:neefs/features/news/presentation/cubit/news_cubit.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';
import 'package:neefs/features/user/presentation/pages/login_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as locator;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
  await locator.init();
  await Hive.initFlutter();
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
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getIt<ThemeData>(instanceName: 'lightTheme'),
            darkTheme: getIt<ThemeData>(instanceName: 'darkTheme'),
            themeMode: ThemeMode.light,
            home: const LoginPage()));
  }
}
