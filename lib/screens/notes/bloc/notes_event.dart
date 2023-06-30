part of 'notes_bloc.dart';

abstract class NotesEvent {
  const NotesEvent();
}

class NotesCreateNoteEvent extends NotesEvent {}

class NotesChangeNotesEvent extends NotesEvent {
  NotesChangeNotesEvent(this.notes);

  final List<NoteModel> notes;
}

class NotesChangeTitleEvent extends NotesEvent {
  const NotesChangeTitleEvent(this.value);

  final String value;
}

class NotesChangDescriptionEvent extends NotesEvent {
  const NotesChangDescriptionEvent(this.value);

  final String value;
}

class NotesChangPriorityEvent extends NotesEvent {
  const NotesChangPriorityEvent(this.value);

  final PriorityModel value;
}
