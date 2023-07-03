import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_notes/constant/constant.dart';
import 'package:shared_notes/global_blocs/auth/auth_bloc.dart';
import 'package:shared_notes/widgets/widgets.dart';

import '../../../theme/theme.dart';

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

  _onDone(BuildContext context) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return BottomSheetWrapper(
          child: Column(
            children: [
              MainButton(
                title: 'Create an account',
                onPressed: () {},
              ),
              const SizedBox(height: kBottomMargin),
              BorderButton(
                child: Text(
                  'Log in',
                  style: AppButtonStyle.primaryButtonText,
                ),
                onPressed: () {},
              ),
              const SizedBox(height: kBottomMargin),
              const _LoginDivider(),
              const SizedBox(height: kBottomMargin),
              BorderButton(
                child: Text(
                  'Continue with Google',
                  style: AppButtonStyle.primaryButtonText,
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(AuthSignInWithGoogleEvent());
                },
              ),
              const SizedBox(height: kBottomMargin),
              BorderButton(
                child: Text(
                  'Continue with Apple',
                  style: AppButtonStyle.primaryButtonText,
                ),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return IntroductionScreen(
          pages: _listPagesViewModel,
          showBackButton: true,
          showNextButton: false,
          back: const Icon(Icons.arrow_back),
          done: const Text("Done"),
          onDone: () => _onDone(context),
        );
      }),
    );
  }
}

class _LoginDivider extends StatelessWidget {
  const _LoginDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2.0,
            color: AppColors.border,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'or',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  color: AppColors.border,
                ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2.0,
            color: AppColors.border,
          ),
        ),
      ],
    );
  }
}
