import 'package:flutter/material.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/settings/view/create_group_screen.dart';
import 'package:shared_notes/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      children: [
        const MainHeader('Settings'),
        TextButton(
          onPressed: () {
            CreateGroupScreen.to(context);
          },
          child: const Text('Create Group'),
        ),
      ],
    );
  }
}
