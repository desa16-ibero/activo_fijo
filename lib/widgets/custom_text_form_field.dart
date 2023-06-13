import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validation/form_validation.dart';

import '../utils/custom_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isTFFLogin;
  final bool? enabled;
  final String hint;
  final String? initialValue, customMessage;
  final TextInputType textInputType;
  final IconData? prefixIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<ValueValidator>? validators;

  final bool? obscureText,
      isLastTFF,
      withoutDecoration,
      withoutDecorationWithoutCount;
  final VoidCallback? changeObscureText, send;
  final int? max;

  const CustomTextFormField({
    Key? key,
    this.enabled,
    this.initialValue,
    required this.hint,
    required this.textInputType,
    this.prefixIcon,
    this.onChanged,
    required this.isTFFLogin,
    this.obscureText,
    this.isLastTFF,
    this.changeObscureText,
    this.send,
    this.validators,
    this.controller,
    this.focusNode,
    this.withoutDecoration,
    this.max,
    this.withoutDecorationWithoutCount,
    this.customMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withoutDecoration != null
        ? TextFormField(
            onChanged: onChanged,
            keyboardType: textInputType,
            textAlign: TextAlign.center,
            initialValue: initialValue,
            inputFormatters: withoutDecorationWithoutCount == null
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ]
                : [],
            validator: (value) => _validateText(value, customMessage),
          )
        : !isTFFLogin
            ? Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  enabled: enabled,
                  controller: controller,
                  focusNode: focusNode,
                  maxLines: obscureText != null ? 1 : null,
                  initialValue: controller == null ? initialValue : null,
                  keyboardType: textInputType,
                  obscureText:
                      obscureText != null ? obscureText as bool : false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(prefixIcon),
                      labelText: hint,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                      //
                      suffixIcon: obscureText != null
                          ? IconButton(
                              icon: Icon(
                                obscureText!
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: CustomColors.mainColor,
                              ),
                              onPressed: changeObscureText,
                            )
                          : null),
                  onChanged: onChanged,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  validator: (value) => _validateText(value, customMessage),
                  onFieldSubmitted: (_) => isLastTFF! ? send!() : null,
                  textInputAction:
                      isLastTFF! ? TextInputAction.send : TextInputAction.next,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    initialValue: initialValue,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    keyboardType: textInputType,
                    style: const TextStyle(color: Colors.black),
                    obscureText:
                        obscureText != null ? obscureText as bool : false,
                    onFieldSubmitted: (_) => isLastTFF! ? send!() : null,
                    textInputAction: isLastTFF!
                        ? TextInputAction.send
                        : TextInputAction.next,
                    validator: (value) => _validateText(value, customMessage),
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10),
                      hintText: hint,
                      hintStyle: const TextStyle(color: Colors.black),
                      suffixIcon: isLastTFF!
                          ? IconButton(
                              icon: Icon(
                                obscureText!
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: CustomColors.mainColor,
                              ),
                              onPressed: changeObscureText,
                            )
                          : null,
                    ),
                  ),
                ),
              );
  }

  _validateText(String? value, String? customMessage) {
    if (validators != null) {
      var validator = Validator(
        validators: validators as List<ValueValidator>,
      );

      String? message = validator.validate(
        label: hint,
        value: value,
      );

      String? translateMessage = '';

      if (message != null) {
        if (customMessage != null) {
          translateMessage = customMessage;
          return translateMessage;
        }
        if (message.contains('is required')) {
          translateMessage = message.replaceAll('is required', 'es requerido');
        }
        if (message.contains('is invalid')) {
          translateMessage = message.replaceAll('is invalid', 'no es válido');
        }
        if (message.contains('must contain at least')) {
          translateMessage = message
              .replaceAll('must contain at least', 'debe contener al menos')
              .replaceAll('characters', 'caracteres');
        }
        if (message.contains('must contain at most')) {
          translateMessage = message
              .replaceAll('must contain at most', 'debe contener como máximo')
              .replaceAll('characters', 'caracteres');
        }
        if (message.contains('must be at most')) {
          translateMessage =
              message.replaceAll('must be at most', 'el máximo es de \$');
        }
        if (message.contains('must be at least')) {
          translateMessage =
              message.replaceAll('must be at least', 'el mínimo es de \$');
        }
      } else {
        translateMessage = message;
      }
      return translateMessage;
    }
  }
}
