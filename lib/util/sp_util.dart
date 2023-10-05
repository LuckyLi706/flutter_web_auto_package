import 'package:flutter_web_auto_package/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences? _prefs;

  SpUtil._internal();

  factory SpUtil() => _instance;

  static final SpUtil _instance = SpUtil._internal();

  static SpUtil getInstance() {
    return _instance;
  }

  Future<void> initSp() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> setThemeIndex(int index) async {
    return await _prefs?.setInt(Constants.sharePreTheme, index);
  }

  int getThemeIndex() {
    return _prefs?.getInt(Constants.sharePreTheme) ?? 0;
  }

  Future<bool?> setLocalIndex(int index) async {
    return await _prefs?.setInt(Constants.sharePreLocal, index);
  }

  int getLocalIndex() {
    return _prefs?.getInt(Constants.sharePreLocal) ?? 0;
  }
}
