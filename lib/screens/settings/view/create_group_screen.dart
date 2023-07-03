import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:shared_notes/global_blocs/setting_bloc/settings_bloc.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/widgets/main_button.dart';
import 'package:shared_notes/widgets/main_input.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});

  static void to(BuildContext context) {
    Get.to(() =>
        BlocProvider.value(
          value: context.read<SettingsBloc>(),
          child: const CreateGroupScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BackLayout(
      child: ScreenScrollLayout(
        children: [
          const MainInput(
            labelText: 'User name',
          ),
          const Text('user name'),
          const Text('user name'),
          const Text('user name'),
          const Expanded(child: SizedBox()),
          MainButton(
            title: 'Add',
            onPressed: () {},
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
