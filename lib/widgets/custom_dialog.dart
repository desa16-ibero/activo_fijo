import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomDialog extends StatelessWidget {
  final bool isCustomDialog;
  final VoidCallback? onConfirmBtnTap, onCancelBtnTap;
  final String? textOkButton, textCancelButton;
  final Widget? content;

  final Color? background;
  final IconData? iconEvent;
  final String? title, message;

  const CustomDialog({
    Key? key,
    this.onConfirmBtnTap,
    this.textOkButton,
    this.textCancelButton,
    this.onCancelBtnTap,
    this.content,
    required this.isCustomDialog,
    this.background,
    this.iconEvent,
    this.title,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: isCustomDialog
          ? content
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _roundedContainer(
                    true,
                    Colors.grey[800] as Color,
                    Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: background,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          iconEvent,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    130),
                _roundedContainer(
                    false,
                    Colors.white,
                    Center(
                      child: Column(
                        children: [
                          Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            message!,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    null),
              ],
            ),
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

  Widget _roundedContainer(
      bool isTop, Color backgroundColor, Widget content, double? height) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(isTop ? 0.0 : 10.0),
            top: Radius.circular(isTop ? 10.0 : 0.0)),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: backgroundColor,
            offset: const Offset(0.0, 1.0),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: content,
    );
  }
}
