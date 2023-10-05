import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';

class CheckBoxItemWidget extends StatelessWidget {
  const CheckBoxItemWidget(this.text,
      {super.key,
      required this.onCheck,
      required this.isCheck,});

  final String text;
  final Function(bool value) onCheck;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(5)),
      // ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isCheck,
            onChanged: (value) {
              onCheck(value ?? false);
            },
            shape: const CircleBorder(), //这里就是实现圆形的设置
          ),
          Text(
            text,
            style: StyleUtil.getTextStyle(ThemeTextStyle.labelMediumTextStyle),
          ),
        ],
      ),
    );
  }
}
