import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:neefs/features/news/presentation/cubit/news_cubit.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';
import 'package:neefs/features/user/presentation/pages/login_page.dart';
import 'core/util/color_schemes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
  await Hive.initFlutter();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserCubit(),
          ),
          BlocProvider(
            create: (context) => NewsCubit(),
          ),
          BlocProvider(
            create: (context) => TicketsCubit(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
            darkTheme:
                ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
            themeMode: ThemeMode.light,
            home: LoginPage()));
  }
}
