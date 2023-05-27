import 'package:equatable/equatable.dart';

class LanguageState {
  String language;
  bool darkMode;

  LanguageState({
    this.language = "en",
    required this.darkMode,
  });

}