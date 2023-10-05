import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/util/screen_util.dart';
import 'package:flutter_web_auto_package/util/sp_util.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';

void showInputDialog(
    {required String label, required Function(dynamic) onConfirm}) {
  SmartDialog.show(
      builder: (context) {
        return Center(
          child: CommonInputDialog(
            label: label,
            onConfirm: onConfirm,
          ),
        );
      },
      clickMaskDismiss: false,
      backDismiss: false);
}

///通用的输入框
class CommonInputDialog extends StatelessWidget {
  CommonInputDialog({super.key, required this.label, required this.onConfirm});

  final String label;
  final TextEditingController inputController = TextEditingController();
  final Function(dynamic) onConfirm;

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
      width: ScreenUtil.screenWidth() / 4,
      height: StyleUtil.inputDialogHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            S.of(context).input_dialog,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              Text(
                SpUtil.getInstance().getLocalIndex() == 0
                    ? '${S.of(context).please_input}$label'
                    : '${S.of(context).please_input} $label',
                style:
                    StyleUtil.getTextStyle(ThemeTextStyle.labelMediumTextStyle),
              ),
              SizedBox(
                width: StyleUtil.inputDialogWide,
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  controller: inputController,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  if (inputController.text.isEmpty) {
                    SmartDialog.showToast(S.of(context).input_can_not_empty);
                    return;
                  }
                  onConfirm(inputController.text);
                  SmartDialog.dismiss();
                },
                child: Text(
                  S.of(context).confirm,
                ),
              ),
              TextButton(
                onPressed: () {
                  SmartDialog.dismiss();
                },
                child: Text(
                  S.of(context).cancel,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
