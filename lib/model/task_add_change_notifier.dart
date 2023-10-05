import 'package:flutter/material.dart';

class TaskAddChangeNotifier extends ChangeNotifier {
  final List<bool> _packagePlatformCheck = List.generate(2, (index) => false);

  List<bool> get packagePlatformCheck => _packagePlatformCheck;

  void setPackagePlatformCheck(int index) {
    for (int i = 0; i < _packagePlatformCheck.length; i++) {
      if (index == i) {
        _packagePlatformCheck[i] = true;
      } else {
        _packagePlatformCheck[i] = false;
      }
    }
    notifyListeners();
  }
}
