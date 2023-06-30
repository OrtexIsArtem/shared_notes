part of 'notes_bloc.dart';

class NotesState {
  const NotesState({
    this.title = '',
    this.description = '',
    this.myNotes = const [],
    this.priority,
  });

  final String title;
  final String description;
  final List<NoteModel> myNotes;
  final PriorityModel? priority;

  NotesState copyWith({
    String? title,
    String? description,
    List<NoteModel>? myNotes,
    PriorityModel? priority,
  }) {
    return NotesState(
      title: title ?? this.title,
      description: description ?? this.description,
      myNotes: myNotes ?? this.myNotes,
      priority: priority ?? this.priority,
    );
  }
}
