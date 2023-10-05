import 'package:flutter/material.dart';

///水波纹按钮（展示无用处，不需要了）
class RippleButton extends StatelessWidget {
  const RippleButton(this.text,
      {super.key,
      this.horizontal = 60,
      required this.onTap,
      this.vertical = 8});

  final String text;

  ///左右边距的总和
  final double horizontal;

  ///上下边距的总和
  final double vertical;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: vertical, horizontal: horizontal),
            child: Text(
              text,

              ///  style: StyleUtil.buttonTextStyle(),
            ),
          ),
          onTap: () {
            onTap();
          },
        ),
      ),
    );
  }
}
