import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_notes/global_blocs/auth/auth_bloc.dart';
import 'package:shared_notes/screens/screens.dart';

class ScreensController extends StatefulWidget {
  const ScreensController({super.key});

  @override
  ScreensControllerState createState() => ScreensControllerState();
}

class ScreensControllerState extends State<ScreensController> {

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: context.select((AuthBloc bloc) => bloc.state.userStatus),
      onGeneratePages: (UserAuthStatuses state, List<Page> pages) {
        switch (state) {
          case UserAuthStatuses.authenticated:
            return [TabsScreen.page()];
          case UserAuthStatuses.unauthenticated:
            return [OnboardScreen.page()];
          case UserAuthStatuses.unknown:
            return [SplashScreen.page()];
        }
      },
    );
  }
}
