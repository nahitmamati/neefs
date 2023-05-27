import 'package:bloc/bloc.dart';

import '../../../../core/util/storage.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState>{
  bool languageSwitch = false;
  bool themeSwitch = false;
  LanguageCubit(super.initialState);


  changeLanguage({String lang = "en"}) async {
    final storage = AppStorage();
    // update current state
    bool mode = (await storage.readAppSettings())["darkMode"];
    final newState = LanguageState(
      language: lang,
      darkMode: mode,
    );
    languageSwitch = lang == "en"? false : true;

    emit(newState);



    await storage.writeAppSettings(
      darkMode: mode,
      language: lang,
    );
  }

  changeThemeMode({bool mode = false}) async {
    final storage = AppStorage();
    // update current state
    String lang = (await storage.readAppSettings())["language"];
    final newState = LanguageState(
      language: lang,
      darkMode: mode,
    );
    themeSwitch = mode;
    emit(newState);



    await storage.writeAppSettings(
      darkMode: mode,
      language: lang,
    );
  }
}