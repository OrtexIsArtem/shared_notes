import 'package:flutter/material.dart';
import 'package:shared_notes/constant/common.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.children,
    this.bottomNavigationBar,
    this.isScrollable = true,
  });

  final List<Widget> children;
  final Widget? bottomNavigationBar;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: isScrollable
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: children,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children,
                  ),
          ),
        ),
      ),
    );
  }
}
