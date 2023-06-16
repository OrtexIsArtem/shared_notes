import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_notes/screens/screens.dart';
import 'package:shared_notes/theme/theme.dart';

final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: kNavigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      home: const ScreensController(),
    );
  }
}


