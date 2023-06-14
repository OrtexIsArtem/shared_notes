import 'package:flutter/material.dart';
import 'package:shared_notes/layouts/layouts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Page page() => const MaterialPage(child: HomeScreen());


  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      children: [
        Text('HomeScreen')
      ],
    );
  }
}
