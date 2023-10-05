import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/base/base_state_widget.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/routes/route_helper.dart';
import 'package:flutter_web_auto_package/ui/pages/default_settings_page.dart';
import 'package:flutter_web_auto_package/ui/pages/task_add_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends BaseStateWidget<MainPage> {
  @override
  String getAppBarTitle() {
    return S.of(context).package_machine;
  }

  @override
  Widget initWidget() {
    return Container();
  }

  @override
  void clickAdd() {
    RouteHelper.push(const TaskAddPage());
  }

  @override
  void clickSetting() {
    RouteHelper.push(const DefaultSettingsPage());
  }
}
