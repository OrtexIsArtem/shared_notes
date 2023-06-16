import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  const MainHeader(
    this.text, {
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.textStyle,
    this.textAlign,
  });

  final String text;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: textStyle ?? textTheme.bodyLarge,
        textAlign: textAlign ?? TextAlign.start,
      ),
    );
  }
}
