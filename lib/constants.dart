import 'package:flutter/material.dart';

class Constants {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final BuildContext context = navigatorKey.currentContext!;
  static const String sharePreTheme = 'theme';
  static const String sharePreLocal = 'local';

  static const String baseUrl = 'http://127.0.0.1:9000';
}
