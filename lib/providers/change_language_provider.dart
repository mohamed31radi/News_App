import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language = 'en';

  void changeLanguage(String lang) {
    if (language == lang) {
      return;
    }
    language = lang;
    notifyListeners();
  }
}
