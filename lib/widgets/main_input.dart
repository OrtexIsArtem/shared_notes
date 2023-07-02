import 'package:flutter/material.dart';
import 'package:shared_notes/theme/theme.dart';

class MainInput extends StatelessWidget {
  const MainInput({
    super.key,
    required this.labelText,
    this.onChanged,
    this.initialValue,
    this.controller,
    this.validator,
  });

  final String labelText;
  final void Function(String)? onChanged;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      initialValue: initialValue,
      decoration: InputDecoration(
        fillColor: AppInputStyle.fillColor,
        filled: true,
        enabledBorder: AppInputStyle.enabledBorder,
        focusedBorder: AppInputStyle.focusedBorder,
        border: AppInputStyle.border,
        labelText: labelText,
        labelStyle: AppInputStyle.labelStyle,
      ),
    );
  }
}
