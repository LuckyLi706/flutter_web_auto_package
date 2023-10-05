import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/routes/route_helper.dart';
import 'package:flutter_web_auto_package/ui/pages/task_add_page.dart';
import 'package:flutter_web_auto_package/ui/widget/helper/custom_floating_button_location.dart';

abstract class BaseStateWidget<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: initWidget(),
        appBar: AppBar(
          title: Text(getAppBarTitle()),
          centerTitle: true,
          actions: [
            Visibility(
              visible: isShowSetting(),
              child: IconButton(
                  tooltip: '设置',
                  onPressed: () {
                    clickSetting();
                  },
                  icon: const Icon(Icons.settings)),
            ),
          ],
        ),
        floatingActionButton: Visibility(
          visible: isShowAdd(),
          child: FloatingActionButton(
            onPressed: () {
              RouteHelper.push(const TaskAddPage());
            },
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(
            FloatingActionButtonLocation.centerFloat, 0, -100));
  }

  ///初始化
  Widget initWidget();

  ///是否展示新增按钮
  bool isShowAdd() {
    return true;
  }

  ///是否展示设置按钮
  bool isShowSetting() {
    return true;
  }

  ///appbar的title
  String getAppBarTitle();

  ///是否展示添加按钮
  void clickAdd() {}

  void clickSetting() {}
}
