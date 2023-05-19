import 'package:flutter/material.dart';
import 'core/util/color_schemes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.light,
      home: Scaffold(
          body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nahit Mamati"),
              ElevatedButton(onPressed: () {}, child: Text("Test"))
            ],
          ),
        ],
      )),
    );
  }
}


    // return MultiBlocProvider(
    //     providers: [],
    //     child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       theme: Themes.lightTheme,
    //       darkTheme: Themes.darkTheme,
    //       home: Scaffold(
    //           body: Center(
    //         child: Text("Nahit Mamati"),
    //       )),
    //     ));