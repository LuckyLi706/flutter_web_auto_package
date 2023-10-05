import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/constants.dart';
import 'package:flutter_web_auto_package/ui/pages/main_page.dart';
import 'package:flutter_web_auto_package/ui/pages/no_found_page.dart';
import 'package:flutter_web_auto_package/ui/pages/task_add_page.dart';

class RouteHelper {
  ///主页
  static const String mainPage = '/';
  static const String noFoundPage = '/noFoundPage';
  static const String taskAddPage = '/taskAddPage';

  ///静态路由注册表
  static Map<String, WidgetBuilder> routes = {
    mainPage: (context) => const MainPage(),
    noFoundPage: (context) => const NoFoundPage(),
    taskAddPage: (context) => const TaskAddPage(),
  };

  ///拦截静态注册表
  static Route? onGenerateRoute<T extends Object>(RouteSettings settings) {
    if (settings.name == null || routes[settings.name] == null) {
      return null;
    }
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (context) {
        String? name = settings.name;
        if (name == null || routes[name] == null) {
          //name = noFoundPage;
        }
        Widget widget = routes[name]!(context);
        return widget;
      },
    );
  }

  ///如果onGenerateRoute不对找不到的路由做处理，就会回调该方法。如果onGenerateRoute处理了，就不回掉该方法
  static Route unKnownRoute<T extends Object>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (context) {
        return routes[noFoundPage]!(context);
      },
    );
  }

  static Future<dynamic> push(Widget route) {
    return Navigator.push(
      Constants.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
