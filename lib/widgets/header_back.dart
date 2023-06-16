import 'package:flutter/material.dart';
import 'package:shared_notes/theme/theme.dart';

class HeaderBack extends StatelessWidget {
  final void Function() onLeftButtonPressed;
  final void Function()? onRightButtonPressed;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String? topText;

  const HeaderBack({
    Key? key,
    required this.onLeftButtonPressed,
    this.onRightButtonPressed,
    this.leftIcon,
    this.rightIcon,
    this.topText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                splashRadius: 22,
                onPressed: onLeftButtonPressed,
                icon: leftIcon ??
                    const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.primaryText,
                    ),
              ),
            ),
          ),
          if (topText != null)
            Text(
              topText!,
              style: textTheme.bodyMedium!.copyWith(fontSize: 16),
            ),
          onRightButtonPressed != null && rightIcon != null
              ? Expanded(
                  child: TextButton(
                    onPressed: onRightButtonPressed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 5),
                        if (rightIcon != null) rightIcon!,
                      ],
                    ),
                  ),
                )
              : const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
