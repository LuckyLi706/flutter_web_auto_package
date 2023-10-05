import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/constants.dart';

class ScreenUtil {
  ///状态栏的高度
  static double statusBarHeight() {
    return MediaQuery.of(Constants.navigatorKey.currentContext!).padding.top;
  }

  /// appBar的高度
  static double appBarHeight() {
    return kToolbarHeight;
  }

  ///屏幕的高度
  static double screenHeight() {
    return MediaQuery.of(Constants.navigatorKey.currentContext!).size.height;
  }

  ///屏幕的宽度
  static double screenWidth() {
    return MediaQuery.of(Constants.navigatorKey.currentContext!).size.width;
  }
}
