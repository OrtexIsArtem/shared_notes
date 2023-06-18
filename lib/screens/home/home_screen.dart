import 'package:flutter/material.dart';
import 'package:shared_notes/constant/constant.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/notes/create_note_screen.dart';
import 'package:shared_notes/screens/notes/notes.dart';
import 'package:shared_notes/screens/notes_details.dart';
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
          const MyNotesScreen(),
          MainLayout(
            children: [
              const MainHeader('Group Notes'),
              const SizedBox(height: 20),

            ],
          ),
          const CreateNoteScreen(),
          const MainLayout(
            children: [
              MainHeader('Profile'),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
