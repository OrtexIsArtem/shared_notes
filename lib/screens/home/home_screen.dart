import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_notes/constant/constant.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/notes_details.dart';
import 'package:shared_notes/theme/theme.dart';
import 'package:shared_notes/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Page page() => const MaterialPage(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  _onChangePage(int page) {
    _pageController.animateToPage(
      page,
      duration: kAnimationDuration,
      curve: kAnimation,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        onTap: _onChangePage,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MainLayout(
            children: [
              const MainHeader('My Notes'),
              const SizedBox(height: 20),
              NotesCard(
                onPress: () {
                  NotesDetails.to();
                },
                onSwitch: (val) {},
              ),
            ],
          ),
          MainLayout(
            children: [
              const MainHeader('Group Notes'),
              const SizedBox(height: 20),
              NotesCard(
                onPress: () {
                  NotesDetails.to();
                },
                onSwitch: (val) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
