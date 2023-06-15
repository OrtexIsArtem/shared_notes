import 'package:flutter/material.dart';
import 'package:shared_notes/constant/constant.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kButtonBorderRadius),
        border: Border.all(
          color: const Color.fromRGBO(199, 206, 241, 1),
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(199, 206, 241, 1),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(kButtonBorderRadius),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: kVerticalButtonPadding),
            alignment: Alignment.center,
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}
