import 'package:flutter/material.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/screens.dart';
import 'package:shared_notes/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      children: [
        const MainHeader('Profile'),
        const Text('User Id: #idid'),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              MyGroupScreen.to();
            },
            child: const Text('Manage Group'),
          ),
        ),
      ],
    );
  }
}
