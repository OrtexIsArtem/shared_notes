import 'package:flutter/material.dart';
import 'package:shared_notes/constant/common.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.children,
    this.bottomNavigationBar,
  });

  final List<Widget> children;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
