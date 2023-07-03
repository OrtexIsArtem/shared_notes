import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:shared_notes/layouts/layouts.dart';
import 'package:shared_notes/screens/notes/bloc/notes_bloc.dart';
import 'package:shared_notes/screens/notes/view/notes_details.dart';
import 'package:shared_notes/widgets/widgets.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({
    super.key,
    required this.isGroup,
  });

  final bool isGroup;

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<NoteModel> notes = [];
  late final bool isGroup;

  @override
  void initState() {
    isGroup = widget.isGroup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isGroup) {
      notes = context.select((NotesBloc bloc) => bloc.state.groupNotes);
    } else {
      notes = context.select((NotesBloc bloc) => bloc.state.myNotes);
    }
    return MainLayout(
      children: [
        MainHeader(isGroup ? 'Group Notes' : 'My Notes'),
        const SizedBox(height: 15),
        ...notes.map(
          (note) => NotesCard(
            note: note,
            onPress: () {
              NotesDetails.to(note: note);
            },
            onSwitch: (val) {
              context.read<NotesBloc>().add(NotesToggleNoteStatusEvent(note));
            },
          ),
        ),
      ],
    );
  }
}
