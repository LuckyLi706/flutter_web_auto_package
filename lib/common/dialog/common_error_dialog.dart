import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/util/screen_util.dart';
import 'package:flutter_web_auto_package/util/sp_util.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';

void showErrorDialog({required String message}) {
  SmartDialog.show(
      builder: (context) {
        return Center(
          child: CommonErrorDialog(
            message: message,
          ),
        );
      },
      clickMaskDismiss: false,
      backDismiss: false);
}

///通用的输入框
class CommonErrorDialog extends StatelessWidget {
  const CommonErrorDialog({super.key, required this.message});

  final String message;

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
      width: ScreenUtil.screenWidth() / 5,
      height: StyleUtil.inputDialogHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).error_dialog,
                style: StyleUtil.getTextStyle(ThemeTextStyle.titleLargeTextStyle),
              ),
            ],
          ),
          Text(
            message,
            style: StyleUtil.getTextStyle(ThemeTextStyle.labelLargeTextStyle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                style: Theme.of(context).filledButtonTheme.style?.copyWith(

                    ///定义按钮的最小尺寸
                    minimumSize:
                        MaterialStateProperty.all(const Size(100, 40))),
                onPressed: () {
                  SmartDialog.dismiss();
                },
                child: Text(
                  S.of(context).confirm,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
