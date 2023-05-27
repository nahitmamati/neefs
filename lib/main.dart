import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:neefs/features/news/presentation/cubit/news_cubit.dart';
import 'package:neefs/features/news/presentation/cubit/slider_cubit.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/obs_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'injection_container.dart' as locater;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locater.init();
  await Hive.initFlutter();
  runApp(const MainApp());
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
        BlocProvider(
          create: (context) => getIt<SliderIndexCubit>(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: getIt<ThemeData>(instanceName: 'lightTheme'),
            darkTheme: getIt<ThemeData>(instanceName: 'darkTheme'),
            themeMode: Provider.of<ThemeProvider>(context).themeMode,
            routerConfig: getIt<GoRouter>(),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
