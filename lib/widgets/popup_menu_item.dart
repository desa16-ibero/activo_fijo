import 'package:flutter/material.dart';

class PopUpMenuItem {
  static PopupMenuItem<int> createPopUpMenuItem(
      String title, int position, IconData iconData) {
    return PopupMenuItem<int>(
      value: position,
      child: ListTile(
        title: Text(title),
        leading: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
