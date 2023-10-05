import 'package:flutter/cupertino.dart';
import 'package:flutter_web_auto_package/base/base_state_less_widget.dart';

class NoFoundPage extends BaseStatelessWidget {
  const NoFoundPage({super.key});

  @override
  String getAppBarTitle() {
    return '';
  }

  @override
  Widget initWidget() {
    return const Center(
      child: Text(
        '404',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
