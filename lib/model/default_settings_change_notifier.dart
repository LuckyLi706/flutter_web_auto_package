import 'package:flutter/material.dart';

class DefaultSettingsChangeNotifier extends ChangeNotifier {
  ///环境地址
  List<String> _environConfig = [];

  ///渠道配置
  List<String> _flavorConfig = [];

  final List<bool> _languageCheck = List.generate(2, (index) => false);

  List<String> get environConfig => _environConfig;

  set environConfig(List<String> value) {
    _environConfig = value;
    notifyListeners();
  }

  List<String> get flavorConfig => _flavorConfig;

  set flavorConfig(List<String> value) {
    _flavorConfig = value;
    notifyListeners();
  }

  List<bool> get languageCheck => _languageCheck;

  void setLanguageCheck(int index) {
    for (int i = 0; i < _languageCheck.length; i++) {
      if (index == i) {
        _languageCheck[i] = true;
      } else {
        _languageCheck[i] = false;
      }
    }
    notifyListeners();
  }
}
