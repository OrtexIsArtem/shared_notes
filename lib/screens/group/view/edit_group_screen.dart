import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:shared_notes/constant/common.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/group/group.dart';
import 'package:shared_notes/widgets/main_button.dart';
import 'package:shared_notes/widgets/main_input.dart';
import 'package:user_repository/user_repository.dart';

class EditGroupScreen extends StatefulWidget {
  const EditGroupScreen({
    super.key,
    this.group,
  });

  final Group? group;

  static void to(BuildContext context, [Group? group]) {
    Get.to(() => BlocProvider<EditGroupBloc>(
          create: (_) => EditGroupBloc(
            userRepository: context.read<UserRepository>(),
            initialGroup: group,
          ),
          child: EditGroupScreen(group: group),
        ));
  }

  @override
  State<EditGroupScreen> createState() => _EditGroupScreenState();
}

class _EditGroupScreenState extends State<EditGroupScreen> {
  final TextEditingController nameController = TextEditingController();
  late final Group? group;

  void _onSubmit(BuildContext context, String groupName) async {
    final bloc = context.read<EditGroupBloc>();
    bloc.add(EditGroupSubmittedEvent());
    Get.back();
  }

  @override
  void initState() {
    super.initState();
    group = widget.group;
    if (group != null) {
      nameController.text = group!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final groupName =
        context.select((EditGroupBloc bloc) => bloc.state.groupName);
    return BackLayout(
      topText: group == null ? 'Create Group' : 'Edit Group',
      child: Column(
        children: [
          const SizedBox(height: kBottomMargin),
          MainInput(
            controller: nameController,
            labelText: 'Group name',
            onChanged: (value) =>
                context.read<EditGroupBloc>().add(EditGroupNameEvent(value)),
          ),
          const SizedBox(height: kBottomMargin),
          MainInput(
            labelText: 'Add Members',
            onChanged: (value) {},
          ),
          const Expanded(child: SizedBox()),
          MainButton(
            title: group == null ? 'Add' : 'Save',
            onPressed: () {
              _onSubmit(context, groupName);
            },
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
