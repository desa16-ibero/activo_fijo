import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomDropDownButton extends StatelessWidget {
  final String? selectedValue;
  final Map<String, String> dropdownItems;
  final ValueChanged<String?>? onChanged;

  const CustomDropDownButton(
      {Key? key,
      required this.selectedValue,
      required this.dropdownItems,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.0),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 10),
        child: DropdownButtonFormField(
          isExpanded: true,
          itemHeight: null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: CustomColors.mainColor, width: 2),
              borderRadius: BorderRadius.circular(35),
            ),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: CustomColors.mainColor, width: 2),
              borderRadius: BorderRadius.circular(35),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          validator: (value) {
            if (value == 'default' || value == '00') {
              return 'Debes seleccionar una opción';
            }
            return null;
          },
          icon: Row(
            children: [
              Container(
                width: 1,
                height: 30,
                color: CustomColors.mainColor,
              ),
              const Icon(
                Icons.arrow_drop_down_outlined,
                color: CustomColors.mainColor,
                size: 28,
              ),
              const SizedBox(width: 5)
            ],
          ),
          dropdownColor: Colors.white,
          value: selectedValue,
          onChanged: onChanged,
          items: dropdownItems.entries
              .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
              .toList(),
        ),
      ),
    );
  }
}
