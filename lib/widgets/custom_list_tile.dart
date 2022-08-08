import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title1, subTitle1, title2, subTitle2;
  final IconData icon1, icon2;

  const CustomListTile(
      {Key? key,
      required this.title1,
      required this.subTitle1,
      required this.title2,
      required this.subTitle2,
      required this.icon1,
      required this.icon2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 6,
          child: ListTile(
            title: Text(title1),
            leading: Icon(
              icon1,
              color: CustomColors.dartMainColor,
            ),
            subtitle: Text(subTitle1),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 6,
          child: ListTile(
            title: Text(title2),
            leading: Icon(
              icon2,
              color: CustomColors.dartMainColor,
            ),
            subtitle: Text(subTitle2),
          ),
        ),
      ],
    );
  }
}
