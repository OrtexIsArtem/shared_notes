import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:shared_notes/constant/common.dart';
import 'package:shared_notes/layouts/back_layout.dart';
import 'package:shared_notes/screens/notes/new_task_cubit/new_task_cubit.dart';
import 'package:shared_notes/theme/theme.dart';
import 'package:shared_notes/widgets/main_button.dart';
import 'package:shared_notes/widgets/main_input.dart';
import 'package:utils/utils.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
    required this.onSave,
    required this.tasks,
  });

  static void to({
    required void Function(List<TaskModel>) onSave,
    List<TaskModel> tasks = const [],
  }) {
    Get.to(
      () => BlocProvider<NewTaskCubit>(
        create: (context) => NewTaskCubit(),
        child: AddTaskScreen(
          onSave: onSave,
          tasks: tasks,
        ),
      ),
    );
  }

  final void Function(List<TaskModel>) onSave;
  final List<TaskModel> tasks;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onAdd(String name) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context.read<NewTaskCubit>().onAddTask(name);
    _controller.clear();
  }

  @override
  void initState() {
    super.initState();
    context.read<NewTaskCubit>().onAddTasks(widget.tasks);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewTaskCubit>().state;
    final cubit = context.read<NewTaskCubit>();
    return BackLayout(
      topText: 'Create new task',
      onRightButtonPressed: () {
        widget.onSave(state.tasks);
        Get.back();
      },
      rightButtonText: 'Save',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: kBottomMargin),
            MainInput(
              controller: _controller,
              validator: Utils.nameValidator,
              labelText: 'Add new task',
              onChanged: cubit.onChangeName,
            ),
            const SizedBox(height: kBottomMargin),
            Expanded(
              child: ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (_, index) => Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.border, width: 1.0),
                    ),
                  ),
                  child: ListTile(
                    title: Text(state.tasks[index].name),
                    trailing: IconButton(
                      splashRadius: 22,
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        cubit.onDeleteTask(state.tasks[index]);
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: kBottomMargin),
            MainButton(
              title: 'Add',
              onPressed: () => _onAdd(state.name),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
