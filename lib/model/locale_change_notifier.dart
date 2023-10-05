import 'package:flutter/material.dart';

class LocaleChangeNotifier extends ChangeNotifier {
  List<Locale> localeList = [const Locale('zh'), const Locale('en')];

  Locale _locale = const Locale('zh');

  Locale get locale => _locale;

  void setLanguage(int index) {
    _locale = localeList[index];
    notifyListeners();
  }
}
