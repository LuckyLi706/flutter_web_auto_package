import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/util/platform_util.dart';
import 'package:flutter_web_auto_package/util/screen_util.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog(this.titleName,
      {super.key,

      ///弹窗展示的内容
      required this.contentWidget,

      ///确定按钮回调
      this.onConfirm,

      ///弹窗长度
      this.dialogWidth,

      ///弹窗高度
      this.dialogHeight,

      ///是否展示取消按钮
      this.isShowCancel,

      ///取消按钮的回调
      this.onCancel,
      this.isShowIconWidget = false,
      this.titleLeftIconWidget});

  final double? dialogWidth;
  final double? dialogHeight;
  final String titleName;
  final Widget contentWidget;
  final bool? isShowCancel;
  final Function()? onConfirm;
  final Function()? onCancel;
  final bool isShowIconWidget;
  final Widget? titleLeftIconWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius:
              BorderRadius.all(Radius.circular(StyleUtil.inputDialogRadius))),
      padding: EdgeInsets.only(
          top: StyleUtil.inputDialogTopBottomPadding,
          left: StyleUtil.inputDialogLeftRightPadding,
          right: StyleUtil.inputDialogLeftRightPadding),
      width: dialogWidth ?? getDialogDefaultWidth(),
      height: dialogHeight ?? StyleUtil.inputDialogHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: isShowIconWidget,
                  child: titleLeftIconWidget ?? Container()),
              Visibility(
                visible: isShowIconWidget,
                child: const SizedBox(
                  width: 10,
                ),
              ),
              Text(
                S.of(context).error_dialog,
                style:
                    StyleUtil.getTextStyle(ThemeTextStyle.titleLargeTextStyle),
              ),
            ],
          ),
          contentWidget,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  onConfirm?.call();
                  SmartDialog.dismiss();
                },
                child: Text(
                  S.of(context).confirm,
                ),
              ),
              Visibility(
                visible: isShowCancel ?? true,
                child: TextButton(
                  onPressed: () {
                    onCancel?.call();
                    SmartDialog.dismiss();
                  },
                  child: Text(
                    S.of(context).cancel,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  double getDialogDefaultWidth() {
    // if (ScreenUtil.screenWidth() < 400 ||
    //     (!PlatformUtil.isTablet() && PlatformUtil.isMobile())) {
    //   return ScreenUtil.screenWidth() - 50;
    // } else {
    //   return ScreenUtil.screenWidth() / 4;
    // }
    if (ScreenUtil.screenWidth() > 1200) {
      return ScreenUtil.screenWidth() / 4;
    } else if (ScreenUtil.screenWidth() > 900) {
      return ScreenUtil.screenWidth() / 3;
    } else if (ScreenUtil.screenWidth() > 600) {
      return ScreenUtil.screenWidth() / 2;
    } else {
      return ScreenUtil.screenWidth() - 100;
    }
  }
}
