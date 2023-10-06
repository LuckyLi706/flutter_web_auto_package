import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_auto_package/base/base_dialog.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/util/sp_util.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';

class CommonDialog {
  static final TextEditingController inputController = TextEditingController();

  ///展示输入弹窗
  static Future showInputDialog(
      {required String label, required Function(dynamic) onConfirm}) {
    return SmartDialog.show(
        builder: (context) {
          return Center(
            child: BaseDialog(
              S.of(context).input_dialog,
              onConfirm: () {
                if (inputController.text.isEmpty) {
                  SmartDialog.showToast(S.of(context).input_can_not_empty);
                  return;
                }
                onConfirm(inputController.text);
              },
              contentWidget: Row(
                children: [
                  Text(
                    SpUtil.getInstance().getLocalIndex() == 0
                        ? '${S.of(context).please_input}$label'
                        : '${S.of(context).please_input} $label',
                    style: StyleUtil.getTextStyle(
                        ThemeTextStyle.labelMediumTextStyle),
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
            ),
          );
        },
        clickMaskDismiss: false,
        backDismiss: false);
  }

  static Future showErrorDialog({required String message}) {
    return SmartDialog.show(
        builder: (context) {
          return Center(
            child: BaseDialog(
              S.of(context).error_dialog,
              contentWidget: Text(
                message,
                style:
                    StyleUtil.getTextStyle(ThemeTextStyle.labelLargeTextStyle),
              ),
              isShowIconWidget: true,
              titleLeftIconWidget: const Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
            ),
          );
        },
        clickMaskDismiss: false,
        backDismiss: false);
  }

  static dismissDialog() {
    SmartDialog.dismiss();
  }
}
