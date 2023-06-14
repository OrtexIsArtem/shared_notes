import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  static Page page() => const MaterialPage(child: OnboardScreen());

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  final _listPagesViewModel = [
    PageViewModel(
      title: "Перша сторінка",
      body: "Оце так Апка!",
      image: const Center(
        child: Icon(Icons.waving_hand, size: 50.0),
      ),
    ),
    PageViewModel(
      title: "Ого! друга сторінка",
      body: "Крута Апка!",
      image: const Center(
        child: Icon(Icons.waving_hand, size: 50.0),
      ),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: _listPagesViewModel,
      showBackButton: true,
      showNextButton: false,
      back: const Icon(Icons.arrow_back),
      done: const Text("Done"),
      onDone: () {
      },
    );
  }
}
