import 'package:flutter/material.dart';
import 'package:shared_notes/screens/screens.dart';
import 'package:shared_notes/widgets/widgets.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  static Page page() => const MaterialPage(child: TabsScreen());

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final PageController _pageController;
  late int currentPage;

  @override
  void initState() {
    currentPage = 0;
    _pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onChangePage(int page) {
    currentPage = page;
    _pageController.jumpToPage(currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        onTap: _onChangePage,
        currentTab: currentPage,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          NotesScreen(isGroup: false),
          NotesScreen(isGroup: true),
          CreateNoteScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
