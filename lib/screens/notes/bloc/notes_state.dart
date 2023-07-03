part of 'notes_bloc.dart';

enum NotesStatus { initial, success, failure }

class NotesState {
  const NotesState({
    this.title = '',
    this.description = '',
    this.myNotes = const [],
    this.groupNotes = const [],
    this.priority,
    this.tasks = const [],
    this.groupTask = false,
    this.status = NotesStatus.initial,
  });

  final String title;
  final String description;
  final List<NoteModel> myNotes;
  final List<NoteModel> groupNotes;
  final PriorityModel? priority;
  final List<TaskModel> tasks;
  final bool groupTask;
  final NotesStatus status;

  NotesState copyWith({
    String? title,
    String? description,
    List<NoteModel>? myNotes,
    List<NoteModel>? groupNotes,
    PriorityModel? priority,
    List<TaskModel>? tasks,
    bool? groupTask,
    NotesStatus? status,
  }) {
    return NotesState(
      title: title ?? this.title,
      description: description ?? this.description,
      myNotes: myNotes ?? this.myNotes,
      groupNotes: groupNotes ?? this.groupNotes,
      priority: priority ?? this.priority,
      tasks: tasks ?? this.tasks,
      groupTask: groupTask ?? this.groupTask,
      status: status ?? this.status,
    );
  }
}
