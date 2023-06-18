import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/notes/bloc/notes_bloc.dart';
import 'package:shared_notes/screens/notes_details.dart';
import 'package:shared_notes/widgets/widgets.dart';

class MyNotesScreen extends StatelessWidget {
  const MyNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NotesBloc>().state;

    return MainLayout(
      children: [
        const MainHeader('My Notes'),
        const SizedBox(height: 15),
        ...state.myNotes.map(
          (note) => NotesCard(
            note: note,
            onPress: () {
              NotesDetails.to(note: note);
            },
            onSwitch: (val) {},
          ),
        ),
      ],
    );
  }
}
