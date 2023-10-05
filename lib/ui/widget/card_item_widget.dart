import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/util/screen_util.dart';
import 'package:flutter_web_auto_package/util/style_util.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget(
    this.labelText,
    this.subWidget, {
    super.key,
    this.margin = StyleUtil.cardItemDefaultMargin,
    this.padding = StyleUtil.cardItemDefaultPadding,
  });

  final double margin;
  final double padding;
  final Widget subWidget;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth(),
      margin: EdgeInsets.all(margin),
      child: Card(
        elevation: 10,

        /// shadowColor: Theme.of(context).primaryColor,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          child: Row(
            children: [
              SizedBox(
                width: StyleUtil.cardLeftTextWidth,
                child: Text(
                  labelText,
                  style: StyleUtil.getTextStyle(
                      ThemeTextStyle.labelLargeTextStyle),
                ),
              ),
              subWidget
            ],
          ),
        ),
      ),
    );
  }
}
