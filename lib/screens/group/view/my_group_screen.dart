import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:shared_notes/constant/common.dart';
import 'package:shared_notes/global_blocs/settings_bloc/settings_bloc.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/group/view/edit_group_screen.dart';
import 'package:shared_notes/theme/theme.dart';
import 'package:user_repository/user_repository.dart';

class MyGroupScreen extends StatelessWidget {
  const MyGroupScreen({super.key});

  static void to() => Get.to(() => const MyGroupScreen());

  @override
  Widget build(BuildContext context) {
    final userGroups =
        context.select((SettingsBloc bloc) => bloc.state.userGroups);
    return BackLayout(
      topText: 'My Groups',
      rightButtonText: 'Create Group',
      onRightButtonPressed: () {
        EditGroupScreen.to(context);
      },
      child: ScreenScrollLayout(
        children: [
          const SizedBox(height: 10),
          ...userGroups.map(
            (group) => _Card(group: group),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.group,
  });

  final Group group;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kBottomMargin),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.border,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(group.name),
        subtitle: const Text('Artem, Valik, Dima...'),
        leading: const Icon(Icons.group),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          EditGroupScreen.to(context, group);
        },
      ),
    );
  }
}
