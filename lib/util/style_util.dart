import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web_auto_package/constants.dart';

class StyleUtil {
  ///默认设置页面底部保存按钮的背景卡片高度
  static double defaultSettingPageBottomHeight = 100;

  ///默认设置页面底部保存按钮的背景卡片立体
  static double defaultSettingPageBottomCardElevation = 10;

  ///默认设置的主题样式的宽和高
  static double defaultSettingPageThemeHeightWidth = 50;

  ///Wrap的垂直间距
  static double wrapVertical = 10;

  ///Wrap的水平间距
  static double wrapHorizontal = 10;

  ///Card左边文字的背景长度
  static double cardLeftTextWidth = 150;

  ///Card的默认外边距
  static const double cardItemDefaultMargin = 10;

  ///Card的默认内边距
  static const double cardItemDefaultPadding = 20;

  ///带有删除文本的圆角
  static double opacityTextDeleteRadius = 5;

  ///带有删除文本的上下内边距
  static double opacityTextDeleteTopBottomPadding = 5;

  ///带有删除文本的左右内边距
  static double opacityTextDeleteLeftRightPadding = 10;

  ///文本和删除按钮的间距
  static double opacityTextDeleteWide = 5;

  ///输入弹窗的圆角
  static double inputDialogRadius = 10;

  ///输入弹窗的左右内边距
  static double inputDialogLeftRightPadding = 10;

  ///输入弹窗的上下内边距
  static double inputDialogTopBottomPadding = 10;

  ///输入弹窗的高度
  static double inputDialogHeight = 200;

  ///输入弹窗文本和输入框的距离
  static double inputDialogWide = 10;

  ///toast的左右内边距
  static double commonToastLeftRightPadding = 10;

  ///toast的上下内边距
  static double commonToastTopBottomPadding = 10;

  ///toast的距离底部
  static double commonToastBottom = 150;

  ///toast的圆角
  static double commonToastRadius = 10;

  /// [TextTheme] 对标德是web端
  /// title ，headline，body，label四个字体属性
  static TextStyle? getTextStyle(ThemeTextStyle defaultTextStyle) {
    if (defaultTextStyle == ThemeTextStyle.titleLargeTextStyle) {
      return Theme.of(Constants.context).textTheme.titleLarge;
    }
    if (defaultTextStyle == ThemeTextStyle.titleSmallTextStyle) {
      return Theme.of(Constants.context).textTheme.titleSmall;
    }
    if (defaultTextStyle == ThemeTextStyle.titleMediumTextStyle) {
      return Theme.of(Constants.context).textTheme.titleMedium;
    }
    if (defaultTextStyle == ThemeTextStyle.labelSmallTextStyle) {
      return Theme.of(Constants.context).textTheme.labelSmall;
    }
    if (defaultTextStyle == ThemeTextStyle.labelMediumTextStyle) {
      return Theme.of(Constants.context).textTheme.labelMedium;
    }
    if (defaultTextStyle == ThemeTextStyle.labelLargeTextStyle) {
      return Theme.of(Constants.context).textTheme.labelLarge;
    }
    return const TextStyle();
  }
}

enum ThemeTextStyle {
  ///title 默认大小对应14，16，22
  titleSmallTextStyle,
  titleMediumTextStyle,
  titleLargeTextStyle,

  ///label 默认大小对应11，12，14
  labelSmallTextStyle,
  labelMediumTextStyle,
  labelLargeTextStyle
}
