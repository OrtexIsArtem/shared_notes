import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:shared_notes/constant/common.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/notes/add_task_screen.dart';
import 'package:shared_notes/screens/notes/bloc/notes_bloc.dart';
import 'package:shared_notes/screens/notes/widgets/widgets.dart';
import 'package:shared_notes/widgets/widgets.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final _formKey = GlobalKey<FormState>();

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
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MainInput(
                        labelText: 'Title',
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
                        Get.to(AddTaskScreen());
                      },
                      child: const Text('Add task'),
                    ),
                  ],
                ),
                const Spacer(),
                MainButton(
                  title: 'Create',
                  onPressed: () {
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
