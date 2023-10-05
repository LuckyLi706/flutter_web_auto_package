import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

///可以通过build 参数来定制化loading，
void showLoading({String message = '数据加载中...'}) {
  SmartDialog.showLoading(
      msg: message,
      backDismiss: false,
      clickMaskDismiss: false,
  );
}

