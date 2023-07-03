import 'package:flutter/material.dart';
import 'package:shared_notes/theme/theme.dart';

class MainTextArea extends StatelessWidget {
  const MainTextArea({
    super.key,
    this.onChanged,
    this.maxLines = 3,
    this.labelText,
    this.initialValue,
    this.controller,
  });

  final int maxLines;
  final String? labelText;
  final void Function(String)? onChanged;
  final String? initialValue;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      controller: controller,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        filled: true,
        fillColor: AppInputStyle.fillColor,
        border: AppInputStyle.border,
        focusedBorder: AppInputStyle.focusedBorder,
        enabledBorder: AppInputStyle.enabledBorder,
        labelStyle: AppInputStyle.labelStyle,
        labelText: labelText,
      ),
    );
  }
}
