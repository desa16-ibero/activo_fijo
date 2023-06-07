import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/home_service.dart';
import '../utils/custom_colors.dart';

class RadioGroup extends StatefulWidget {
  const RadioGroup({Key? key}) : super(key: key);

  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class FixedAssetList {
  final String name;
  final int index;

  const FixedAssetList({required this.name, required this.index});
}

class RadioGroupWidget extends State {
  List<FixedAssetList> fList = const [
    FixedAssetList(
      index: 0,
      name: 'Número UIA',
    ),
    FixedAssetList(
      index: 1,
      name: 'Serie',
    ),
    FixedAssetList(
      index: 2,
      name: 'Marca',
    ),
    FixedAssetList(
      index: 3,
      name: 'Modelo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var homeService = Provider.of<HomeService>(context, listen: false);

    return Column(
      children: fList
          .map((data) => RadioListTile(
                title: Text(
                  data.name,
                  style: const TextStyle(color: CustomColors.dartMainColor),
                ),
                groupValue: homeService.selectedOptionMenu,
                value: data.index,
                activeColor: CustomColors.dartMainColor,
                onChanged: (val) {
                  setState(() {
                    homeService.selectedOptionMenu = data.index;
                  });
                  homeService.setSelectedRadio(val, context);
                },
              ))
          .toList(),
    );
  }
}
