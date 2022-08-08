import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback? onConfirmBtnTap, onCancelBtnTap;
  final String? textOkButton, textCancelButton;
  final Widget content;

  const CustomDialog({
    Key? key,
    this.onConfirmBtnTap,
    this.textOkButton,
    this.textCancelButton,
    this.onCancelBtnTap,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: content,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textCancelButton != null
                ? Flexible(
                    fit: FlexFit.loose,
                    flex: 6,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: onCancelBtnTap ?? () => Navigator.pop(context),
                      child: Text(
                        textCancelButton ?? 'Cerrar',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  )
                : Container(),
            onCancelBtnTap != null ? const SizedBox(width: 25) : Container(),
            Flexible(
              fit: FlexFit.loose,
              flex: 6,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: onConfirmBtnTap ?? () => Navigator.pop(context),
                  color: CustomColors.dartMainColor,
                  child: Text(
                    textOkButton ?? 'Continuar',
                    style: const TextStyle(color: Colors.white),
                  )),
            )
          ],
        )
      ],
    );
  }
}
