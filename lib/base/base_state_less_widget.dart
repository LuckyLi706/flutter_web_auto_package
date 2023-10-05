import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initWidget(),
      appBar: AppBar(
        title: Text(getAppBarTitle()),
        centerTitle: true,
      ),
    );
  }

  Widget initWidget();

  String getAppBarTitle();
}
