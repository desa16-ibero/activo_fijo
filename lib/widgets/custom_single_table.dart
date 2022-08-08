import 'package:flutter/material.dart';

class CustomSingleTable extends StatelessWidget {
  final String? title, value;

  const CustomSingleTable({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Table(
        border: TableBorder.symmetric(
            outside: const BorderSide(color: Colors.white)),
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(9),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.grey[300],
                  child: Text(
                    title!,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  child: Text(
                    value!,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300] as Color),
            ),
          ),
        ],
      ),
    );
  }
}
