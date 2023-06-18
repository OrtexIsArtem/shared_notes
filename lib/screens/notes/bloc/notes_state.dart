part of 'notes_bloc.dart';

class NotesState {
  const NotesState({
    this.title = '',
    this.description = '',
    this.myNotes = const [],
  });

  final String title;
  final String description;
  final List<NoteModel> myNotes;

  NotesState copyWith({
    String? title,
    String? description,
    List<NoteModel>? myNotes,
  }) {
    return NotesState(
      title: title ?? this.title,
      description: description ?? this.description,
      myNotes: myNotes ?? this.myNotes,
    );
  }
}
