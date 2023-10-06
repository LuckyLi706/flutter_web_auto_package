import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_auto_package/base/base_state_widget.dart';
import 'package:flutter_web_auto_package/common/dialog/common_dialog.dart';
import 'package:flutter_web_auto_package/common/widget/common_toast.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/model/config_save_model.dart';
import 'package:flutter_web_auto_package/model/default_settings_change_notifier.dart';
import 'package:flutter_web_auto_package/model/locale_change_notifier.dart';
import 'package:flutter_web_auto_package/model/theme_change_notifier.dart';
import 'package:flutter_web_auto_package/request/default_settings_request.dart';
import 'package:flutter_web_auto_package/ui/widget/card_item_widget.dart';
import 'package:flutter_web_auto_package/ui/widget/check_box_item_widget.dart';
import 'package:flutter_web_auto_package/ui/widget/opacity_text_delete_widget.dart';
import 'package:flutter_web_auto_package/util/screen_util.dart';
import 'package:flutter_web_auto_package/util/sp_util.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';
import 'package:provider/provider.dart';

///默认设置页面
class DefaultSettingsPage extends StatefulWidget {
  const DefaultSettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DefaultSettingsPageState();
  }
}

class _DefaultSettingsPageState extends BaseStateWidget<DefaultSettingsPage> {
  final TextEditingController buildAddress = TextEditingController();
  final TextEditingController scriptAddress = TextEditingController();
  final DefaultSettingsChangeNotifier defaultSettingsChangeNotifier =
      DefaultSettingsChangeNotifier();

  ///语言
  final List<String> languageConfig = [];

  final List<Color> themeColors = const [
    Color(0xff0000ba),
    Color(0xffc62828),
    Color(0xff1565c0),
    Color(0xffce5b78),
    Color(0xff2e7d32),
    Color(0xff37474f),
    Color(0xffe65100),
    Color(0xff095d9e),
    Color(0xff1f3339),
    Color(0xffbc004b),
    Color(0xff9a25ae),
    Color(0xff004881)
  ];

  @override
  String getAppBarTitle() {
    return S.of(context).default_settings;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      languageConfig.add(S.of(context).chinese);
      languageConfig.add(S.of(context).english);
      defaultSettingsChangeNotifier
          .setLanguageCheck(SpUtil.getInstance().getLocalIndex());
    });

    DefaultSettingsRequest.configFetchRequest(onSuccess: (value) {
      ConfigSaveModel configSaveModel = ConfigSaveModel.toModel(value ?? []);
      buildAddress.text = configSaveModel.sourceCodePath;
      scriptAddress.text = configSaveModel.scriptCodePath;
      defaultSettingsChangeNotifier.environConfig =
          configSaveModel.environments.isNotEmpty
              ? configSaveModel.environments.split(',')
              : [];
      defaultSettingsChangeNotifier.flavorConfig =
          configSaveModel.flavors.isNotEmpty
              ? configSaveModel.flavors.split(',')
              : [];

      if (mounted) {
        setState(() {});
      }
    }, onFail: (value) {
      value != null ? showToast(value) : '';
    });
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
                value: defaultSettingsChangeNotifier,
                child: Column(
                  children: [
                    CardItemWidget(S.of(context).theme_setting,
                        Expanded(child: _themeWidget())),
                    CardItemWidget(
                        S.of(context).language_setting,
                        Expanded(

                            ///通过Selector来进行部分刷新，后面一个参数表示比较的数据
                            child: Selector<DefaultSettingsChangeNotifier,
                                List<bool>>(
                          builder: (context, value, child) {
                            return _languageWidget();
                          },

                          ///根据条件来进行是否刷新
                          shouldRebuild: (previous, next) {
                            return previous[0] != next[0] ||
                                previous[1] != next[1];
                          },

                          ///作为previous的数据进行存储，然后在shouldRebuild中进行比较
                          ///List数据要记得做深拷贝
                          selector: (context, value) {
                            return [...value.languageCheck];
                          },
                        ))),
                    CardItemWidget(
                        S.of(context).source_code_path,
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText:
                                  S.of(context).please_input_source_code_path),
                          controller: buildAddress,
                        ))),
                    CardItemWidget(
                        S.of(context).script_code_path,
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText:
                                  S.of(context).please_input_script_code_path),
                          controller: scriptAddress,
                        ))),
                    CardItemWidget(
                        S.of(context).environment_choose,
                        Expanded(
                            child: Selector<DefaultSettingsChangeNotifier, int>(
                          builder: (context, value, child) {
                            return _environWidget();
                          },
                          selector: (context, value) {
                            return value.environConfig.length;
                          },
                        ))),
                    CardItemWidget(
                        S.of(context).flavor_choose,

                        ///局部刷新，只有list的长度发生变化的时候才去刷新
                        Expanded(
                            child: Selector<DefaultSettingsChangeNotifier, int>(
                          shouldRebuild: (pre, next) => pre != next,
                          builder: (context, value, child) {
                            return _flavorWidget();
                          },
                          selector: (context, value) {
                            return value.flavorConfig.length;
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

  ///主题
  Widget _themeWidget() {
    List<Widget> widgetList = [];
    for (var element in themeColors) {
      widgetList.add(Stack(
        children: [
          Container(
            color: element,
            height: StyleUtil.defaultSettingPageThemeHeightWidth,
            width: StyleUtil.defaultSettingPageThemeHeightWidth,
            child: InkWell(
              onTap: () async {
                ThemeChangeNotifier notifier =
                    Provider.of<ThemeChangeNotifier>(context, listen: false);
                int index = themeColors.indexOf(element);
                await SpUtil.getInstance().setThemeIndex(index);
                notifier.setThemeData(index);
              },
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Consumer<ThemeChangeNotifier>(
                  builder: (context, value, child) {
                return Visibility(
                  visible: SpUtil.getInstance().getThemeIndex() ==
                      themeColors.indexOf(element),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                );
              }))
        ],
      ));
    }
    return Wrap(
      runSpacing: StyleUtil.wrapHorizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: StyleUtil.wrapVertical,
      children: widgetList,
    );
  }

  ///语言
  Widget _languageWidget() {
    List<Widget> widgetList = [];
    languageConfig.clear();
    languageConfig.add(S.of(context).chinese);
    languageConfig.add(S.of(context).english);
    for (int i = 0; i < languageConfig.length; i++) {
      widgetList.add(CheckBoxItemWidget(
        languageConfig[i],
        onCheck: (value) async {
          if (value) {
            LocaleChangeNotifier notifier =
                Provider.of<LocaleChangeNotifier>(context, listen: false);
            await SpUtil.getInstance().setLocalIndex(i);
            notifier.setLanguage(i);
            defaultSettingsChangeNotifier.setLanguageCheck(i);
          }
        },
        isCheck: defaultSettingsChangeNotifier.languageCheck[i],
      ));
    }
    return Wrap(
      runSpacing: StyleUtil.wrapHorizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: StyleUtil.wrapVertical,
      children: widgetList,
    );
  }

  ///环境
  Widget _environWidget() {
    List<Widget> widgetList = [];
    for (int i = 0;
        i < defaultSettingsChangeNotifier.environConfig.length;
        i++) {
      widgetList.add(OpacityTextDeleteWidget(
        defaultSettingsChangeNotifier.environConfig[i],
        onDelete: () {
          defaultSettingsChangeNotifier.environConfig.removeAt(i);
          defaultSettingsChangeNotifier.environConfig =
              defaultSettingsChangeNotifier.environConfig;
        },
      ));
    }
    widgetList.add(IconButton(
      onPressed: () {
        CommonDialog.showInputDialog(
          label: S.of(context).environment,
          onConfirm: (value) {
            defaultSettingsChangeNotifier.environConfig.add(value.toString());
            defaultSettingsChangeNotifier.environConfig =
                defaultSettingsChangeNotifier.environConfig;
          },
        );
      },
      icon: const Icon(Icons.add),
      tooltip: S.of(context).add,
    ));
    return Wrap(
      runSpacing: StyleUtil.wrapHorizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: StyleUtil.wrapVertical,
      children: widgetList,
    );
  }

  ///渠道
  Widget _flavorWidget() {
    List<Widget> widgetList = [];
    for (int i = 0;
        i < defaultSettingsChangeNotifier.flavorConfig.length;
        i++) {
      widgetList.add(OpacityTextDeleteWidget(
        defaultSettingsChangeNotifier.flavorConfig[i],
        onDelete: () {
          defaultSettingsChangeNotifier.flavorConfig.removeAt(i);
          defaultSettingsChangeNotifier.flavorConfig =
              defaultSettingsChangeNotifier.flavorConfig;
        },
      ));
    }
    widgetList.add(IconButton(
      onPressed: () {
        CommonDialog.showInputDialog(
          label: S.of(context).flavor,
          onConfirm: (value) {
            defaultSettingsChangeNotifier.flavorConfig.add(value.toString());
            defaultSettingsChangeNotifier.flavorConfig =
                defaultSettingsChangeNotifier.flavorConfig;
          },
        );
      },
      icon: const Icon(Icons.add),
      tooltip: S.of(context).add,
    ));
    return Wrap(
      runSpacing: StyleUtil.wrapHorizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: StyleUtil.wrapVertical,
      children: widgetList,
    );
  }

  ///保存
  Widget _saveWidget() {
    return FilledButton(
      onPressed: () async {
        ConfigSaveModel configSaveModel = ConfigSaveModel();
        if (buildAddress.text.isEmpty) {
          SmartDialog.showToast(
              '${S.of(context).source_code_path} ${S.of(context).input_can_not_empty}');
          return;
        }
        if (scriptAddress.text.isEmpty) {
          SmartDialog.showToast(
              '${S.of(context).script_code_path} ${S.of(context).input_can_not_empty}');
          return;
        }

        List<String> flavorList = defaultSettingsChangeNotifier.flavorConfig;
        if (flavorList.isNotEmpty) {
          configSaveModel.flavors = flavorList.join(',');
        }
        List<String> environList = defaultSettingsChangeNotifier.environConfig;
        if (environList.isNotEmpty) {
          configSaveModel.environments = environList.join(',');
        }
        configSaveModel.sourceCodePath = buildAddress.text;
        configSaveModel.scriptCodePath = scriptAddress.text;

        DefaultSettingsRequest.configSaveRequest(configSaveModel,
            onSuccess: (p0) {
          if (mounted) {
            showToast(p0);
          }
        }, onFail: (p0) {
          if (mounted) {
            CommonDialog.showErrorDialog(message: p0 ?? '');
          }
        });
      },
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
