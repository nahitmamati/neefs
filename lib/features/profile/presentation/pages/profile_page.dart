import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool switchOn = false;
  bool switchOn2 = false;

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
                  value: switchOn,
                  onChanged: (value) {
                    setState(() {
                      switchOn = value;
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(value);
                    });
                  },
                ),
                Text(switchOn ? AppLocalizations.of(context).getTranslate("dark_mode") : AppLocalizations.of(context).getTranslate("light_mode")),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: switchOn2,
                  onChanged: (value) {
                    setState(() {
                      switchOn2 = value;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bu özelliğimiz geliştirme aşamasında")));
                    });
                  },
                ),
                Text(switchOn2 ? "tr" : "en"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
