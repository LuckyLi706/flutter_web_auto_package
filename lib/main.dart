import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_auto_package/model/theme_change_notifier.dart';
import 'package:flutter_web_auto_package/routes/new_router_observer.dart';
import 'package:flutter_web_auto_package/routes/route_helper.dart';
import 'package:flutter_web_auto_package/ui/pages/main_page.dart';
import 'package:flutter_web_auto_package/util/sp_util.dart';
import 'package:provider/provider.dart';

import 'common/widget/common_toast.dart';
import 'constants.dart';
import 'generated/l10n.dart';
import 'model/locale_change_notifier.dart';

Future<void> main() async {
  await initConfig();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChangeNotifier()),
      ChangeNotifierProvider(create: (_) => LocaleChangeNotifier()),
    ],
    child: const MyApp(),
  ));
}

Future<void> initConfig() async {
  await SpUtil.getInstance().initSp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FlutterSmartDialog.init(
        toastBuilder: (String msg) => CommonToast(msg: msg),
      ),
      navigatorKey: Constants.navigatorKey,
      routes: RouteHelper.routes,
      debugShowCheckedModeBanner: false,

      theme: Provider.of<ThemeChangeNotifier>(context)
          .themeList[SpUtil.getInstance().getThemeIndex()],

      onGenerateTitle: (context) {
        ///国家化时候的回调，内容和上面的title一样
        return S.of(context).package_machine;
      },

      ///国际化（使用AndroidStudio 里面的Flutter Intl的插件）
      locale: Provider.of<LocaleChangeNotifier>(context)
          .localeList[SpUtil.getInstance().getLocalIndex()],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,

      ///监听路由的动作
      navigatorObservers: [NewRouteObserver()],
    );
  }
}
