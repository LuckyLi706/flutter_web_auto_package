import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';

///帶有透明度删除图标的文本
class OpacityTextDeleteWidget extends StatelessWidget {
  const OpacityTextDeleteWidget(
    this.text, {
    super.key,
    required this.onDelete,
  });

  final String text;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.all(
            Radius.circular(StyleUtil.opacityTextDeleteRadius)),
      ),
      padding: EdgeInsets.only(
          left: StyleUtil.opacityTextDeleteLeftRightPadding,
          right: StyleUtil.opacityTextDeleteLeftRightPadding,
          top: StyleUtil.opacityTextDeleteTopBottomPadding,
          bottom: StyleUtil.opacityTextDeleteTopBottomPadding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: StyleUtil.getTextStyle(ThemeTextStyle.labelMediumTextStyle),
          ),
          SizedBox(
            width: StyleUtil.opacityTextDeleteWide,
          ),
          InkWell(
              onTap: () {
                onDelete();
              },
              child: Tooltip(
                message: S.of(context).delete,
                child: Icon(
                  Icons.delete,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),
        ],
      ),
    );
  }
}
