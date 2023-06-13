import 'package:flutter/material.dart';

class FullScreenDialog {
  Future<dynamic> fullScreenDialog(
      BuildContext context, Widget content, String title) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(child: content),
      ),
    );
  }
}
