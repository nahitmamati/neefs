import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neefs/features/profile/presentation/cubit/language_cubit.dart';
import '../../../../core/util/localization.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: context.read<LanguageCubit>().themeSwitch,
                  onChanged: (value) {
                    setState(() {
                      context.read<LanguageCubit>().changeThemeMode(mode: value);
                    });
                  },
                ),
                Text(context.read<LanguageCubit>().themeSwitch ? AppLocalizations.of(context).getTranslate("dark_mode") : AppLocalizations.of(context).getTranslate("light_mode")),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: context.read<LanguageCubit>().languageSwitch,
                  onChanged: (value) {
                    setState(() {
                      context.read<LanguageCubit>().changeLanguage(lang: !value ? "en": "tr",);
                    });
                  },
                ),
                Text(context.read<LanguageCubit>().languageSwitch ? "tr" : "en"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
