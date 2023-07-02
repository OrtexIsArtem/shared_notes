import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_notes/constant/common.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:notes_repository/src/models/task.dart';
import 'package:shared_notes/screens/notes/new_task/add_task_screen.dart';
import 'package:shared_notes/screens/notes/bloc/notes_bloc.dart';
import 'package:shared_notes/screens/notes/widgets/widgets.dart';
import 'package:shared_notes/theme/theme.dart';
import 'package:shared_notes/widgets/widgets.dart';
import 'package:utils/utils.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final _formKey = GlobalKey<FormState>();

  void _onSaveTask(List<Task> tasks) {
    context.read<NotesBloc>().add(NotesAddTasksEvent(tasks));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NotesBloc>();
    final state = context.watch<NotesBloc>().state;

    return MainLayout(
      isScrollable: false,
      children: [
        const MainHeader('Create Note'),
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MainInput(
                        labelText: 'Title',
                        validator: Utils.nameValidator,
                        initialValue: state.title,
                        onChanged: (value) {
                          bloc.add(NotesChangeTitleEvent(value));
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    PriorityButton(
                      onConfirm: (priority) {
                        bloc.add(NotesChangPriorityEvent(priority));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: kBottomMargin),
                MainTextArea(
                  labelText: 'Description',
                  initialValue: state.description,
                  onChanged: (value) {
                    bloc.add(NotesChangDescriptionEvent(value));
                  },
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        AddTaskScreen.to(
                          onSave: _onSaveTask,
                          tasks: state.tasks,
                        );
                      },
                      child: const Text('Add task'),
                    ),
                  ],
                ),
                if (state.tasks.isNotEmpty)
                  const Text('Tasks', textAlign: TextAlign.start),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (_, index) => Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: AppColors.border, width: 1.0),
                        ),
                      ),
                      child: ListTile(
                        title: Text(state.tasks[index].name),
                      ),
                    ),
                  ),
                ),
                MainButton(
                  title: 'Create',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    bloc.add(NotesCreateNoteEvent());
                  },
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        )
      ],
    );
  }
}
