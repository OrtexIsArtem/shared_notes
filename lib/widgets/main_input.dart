import 'package:flutter/material.dart';
import 'package:shared_notes/theme/theme.dart';

class MainInput extends StatelessWidget {
  const MainInput({
    super.key,
    required this.labelText,
    this.onChanged,
    this.initialValue,
  });

  final String labelText;
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
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
