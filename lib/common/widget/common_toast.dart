import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';

Future showToast(String msg) {
  return SmartDialog.showToast(msg);
}

class CommonToast extends StatelessWidget {
  const CommonToast({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: StyleUtil.commonToastBottom),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius:
              BorderRadius.all(Radius.circular(StyleUtil.commonToastRadius)),
        ),
        padding: EdgeInsets.only(
            left: StyleUtil.commonToastLeftRightPadding,
            right: StyleUtil.commonToastLeftRightPadding,
            top: StyleUtil.commonToastTopBottomPadding,
            bottom: StyleUtil.commonToastTopBottomPadding),
        child: Text(
          msg,
          style: StyleUtil.getTextStyle(ThemeTextStyle.labelMediumTextStyle)
              ?.copyWith(color: const Color(0xe5eceaea)),
        ),
      ),
    );
  }
}
