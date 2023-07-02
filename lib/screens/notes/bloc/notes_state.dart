part of 'notes_bloc.dart';

class NotesState {
  const NotesState({
    this.title = '',
    this.description = '',
    this.myNotes = const [],
    this.priority,
    this.tasks = const [],
  });

  final String title;
  final String description;
  final List<NoteModel> myNotes;
  final PriorityModel? priority;
  final List<Task> tasks;

  NotesState copyWith({
    String? title,
    String? description,
    List<NoteModel>? myNotes,
    PriorityModel? priority,
    List<Task>? tasks,
  }) {
    return NotesState(
      title: title ?? this.title,
      description: description ?? this.description,
      myNotes: myNotes ?? this.myNotes,
      priority: priority ?? this.priority,
      tasks: tasks ?? this.tasks,
    );
  }
}
