import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class PopUpMenuItem {
  static PopupMenuItem<int> createPopUpMenuItem(
      String title, int position, IconData iconData) {
    return PopupMenuItem<int>(
      value: position,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: CustomColors.dartMainColor),
        ),
        leading: Icon(
          iconData,
          color: CustomColors.dartMainColor,
        ),
      ),
    );
  }
}
