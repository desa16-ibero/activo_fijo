import 'package:flutter/widgets.dart';
import 'package:form_validation/form_validation.dart';

class ItemTextFormField {
  final String hint;
  final String? customMessage;
  final TextInputType inputType;
  final IconData? icon;
  String value;
  bool? obscureText;
  final List<ValueValidator>? validations;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  ItemTextFormField({
    required this.hint,
    required this.inputType,
    this.icon,
    required this.value,
    this.obscureText,
    this.validations,
    this.controller,
    this.focusNode,
    this.customMessage,
  });
}
