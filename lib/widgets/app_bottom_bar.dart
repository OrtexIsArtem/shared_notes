import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_notes/constant/constant.dart';
import 'package:shared_notes/theme/theme.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    super.key,
    required this.onTap,
    required this.currentTab,
  });

  final void Function(int) onTap;
  final int currentTab;

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14);

    return CurvedNavigationBar(
      backgroundColor: AppColors.primary,
      animationCurve: kAnimation,
      animationDuration: const Duration(milliseconds: 150),
      index: currentTab,
      items: [
        CurvedNavigationBarItem(
          child: const Icon(Icons.task),
          label: 'Personal',
          labelStyle: labelStyle,
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.assignment),
          label: 'Group',
          labelStyle: labelStyle,
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.add_box),
          label: 'Create',
          labelStyle: labelStyle,
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.account_circle),
          label: 'Settings',
          labelStyle: labelStyle,
        ),
      ],
      onTap: onTap,
    );
  }
}
