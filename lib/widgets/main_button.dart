import 'package:flutter/material.dart';
import 'package:shared_notes/constant/constant.dart';
import 'package:shared_notes/theme/theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.color = Colors.blue,
    required this.onPressed,
    this.isInProgress = false,
  });

  final Color color;
  final String title;
  final void Function()? onPressed;
  final bool isInProgress;

  @override
  Widget build(BuildContext context) {
    return isInProgress
        ? const CircularProgressIndicator()
        : SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kButtonBorderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kVerticalButtonPadding),
                child: Text(
                  title,
                  style: AppButtonStyle.primaryButtonText.copyWith(color: AppColors.white),
                ),
              ),
            ),
          );
  }
}
