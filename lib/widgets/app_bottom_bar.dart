import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_notes/constant/constant.dart';
import 'package:shared_notes/theme/theme.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    super.key,
    required this.onTap,
  });

  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CurvedNavigationBar(
      backgroundColor: AppColors.primary,
      animationCurve: kAnimation,
      animationDuration: kAnimationDuration,
      items: [
        CurvedNavigationBarItem(
          child: const Icon(Icons.task),
          label: 'Personal',
          labelStyle: textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.assignment),
          label: 'Group',
          labelStyle: textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.add_box),
          label: 'Create',
          labelStyle: textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.account_circle),
          label: 'Settings',
          labelStyle: textTheme.bodySmall!.copyWith(fontSize: 14),
        ),
      ],
      onTap: onTap,
    );
  }
}
