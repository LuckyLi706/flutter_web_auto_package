import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/base/base_state_widget.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/model/task_add_change_notifier.dart';
import 'package:flutter_web_auto_package/ui/widget/card_item_widget.dart';
import 'package:flutter_web_auto_package/ui/widget/check_box_item_widget.dart';
import 'package:flutter_web_auto_package/util/screen_util.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';
import 'package:provider/provider.dart';

class TaskAddPage extends StatefulWidget {
  const TaskAddPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TaskAddPageState();
  }
}

class _TaskAddPageState extends BaseStateWidget<TaskAddPage> {
  final TaskAddChangeNotifier taskAddChangeNotifier = TaskAddChangeNotifier();

  final TextEditingController taskNameController = TextEditingController();

  List<String> packagePlatform = ['Android', 'IOS'];

  @override
  String getAppBarTitle() {
    return S.of(context).add_package_task;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget initWidget() {
    return SizedBox(
        height: ScreenUtil.screenHeight(),
        width: ScreenUtil.screenWidth(),
        child: Stack(
          children: [
            SizedBox(
              height: ScreenUtil.screenHeight() -
                  StyleUtil.defaultSettingPageBottomHeight -
                  ScreenUtil.appBarHeight(),
              child: SingleChildScrollView(
                  child: ChangeNotifierProvider.value(
                value: taskAddChangeNotifier,
                child: Column(
                  children: [
                    CardItemWidget(
                        S.of(context).task_name,
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: S.of(context).please_input_task_name),
                          controller: taskNameController,
                        ))),
                    CardItemWidget(
                        S.of(context).language_setting,
                        Expanded(

                            ///通过Selector来进行部分刷新，后面一个参数表示比较的数据
                            child: Selector<TaskAddChangeNotifier, List<bool>>(
                          builder: (context, value, child) {
                            return _packagePlatformWidget();
                          },

                          ///根据条件来进行是否刷新
                          shouldRebuild: (previous, next) {
                            return previous[0] != next[0] ||
                                previous[1] != next[1];
                          },

                          ///作为previous的数据进行存储，然后在shouldRebuild中进行比较
                          ///List数据要记得做深拷贝
                          selector: (context, value) {
                            return [...value.packagePlatformCheck];
                          },
                        ))),
                  ],
                ),
              )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                elevation: StyleUtil.defaultSettingPageBottomCardElevation,
                margin: EdgeInsets.zero,
                child: Container(
                  width: ScreenUtil.screenWidth(),
                  height: StyleUtil.defaultSettingPageBottomHeight,
                  alignment: Alignment.center,
                  child: _saveWidget(),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _packagePlatformWidget() {
    List<Widget> widgetList = [];
    for (int i = 0; i < packagePlatform.length; i++) {
      widgetList.add(CheckBoxItemWidget(
        packagePlatform[i],
        onCheck: (value) async {
          if (value) {
            taskAddChangeNotifier.setPackagePlatformCheck(i);
          }
        },
        isCheck: taskAddChangeNotifier.packagePlatformCheck[i],
      ));
    }
    return Wrap(
      runSpacing: StyleUtil.wrapHorizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: StyleUtil.wrapVertical,
      children: widgetList,
    );
  }

  Widget _saveWidget() {
    return FilledButton(
      onPressed: () async {},
      style: Theme.of(context).filledButtonTheme.style?.copyWith(

          ///定义按钮的最小尺寸
          minimumSize: MaterialStateProperty.all(const Size(200, 50))),
      child: Text(S.of(context).save),
    );
  }

  @override
  bool isShowAdd() {
    return false;
  }

  @override
  bool isShowSetting() {
    return false;
  }
}
