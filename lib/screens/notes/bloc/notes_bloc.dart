import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_repository/notes_repository.dart';

part 'notes_event.dart';

part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc({
    required NotesRepository notesRepository,
  })  : _notesRepository = notesRepository,
        super(const NotesState()) {
    on<NotesChangeNotesEvent>(_onChangeNotes);
    on<NotesCreateNoteEvent>(_onCreateNote);
    on<NotesChangeTitleEvent>(_onChangeTitle);
    on<NotesChangDescriptionEvent>(_onChaneDescription);
    on<NotesChangPriorityEvent>(_onChanePriority);
    on<NotesAddTasksEvent>(_onAddTasks);
    _notesStream = _notesRepository.notesStream().listen((notesList) {
      add(NotesChangeNotesEvent(notesList));
    });
  }

  final NotesRepository _notesRepository;
  StreamSubscription<List<NoteModel>>? _notesStream;

  void _onChangeNotes(
    NotesChangeNotesEvent event,
    Emitter<NotesState> emit,
  ) async {
    emit(state.copyWith(myNotes: event.notes));
  }

  void _onCreateNote(
    NotesCreateNoteEvent event,
    Emitter<NotesState> emit,
  ) async {
    final note = NoteModel.create(
      title: state.title,
      description: state.description,
      tasks: state.tasks,
    );
    try {
      await _notesRepository.createNote(note);

    } catch (e) {
      print(e);
    }
  }

  void _onChangeTitle(
    NotesChangeTitleEvent event,
    Emitter<NotesState> emit,
  ) {
    emit(state.copyWith(title: event.value));
  }

  void _onChaneDescription(
    NotesChangDescriptionEvent event,
    Emitter<NotesState> emit,
  ) {
    emit(state.copyWith(description: event.value));
  }

  void _onChanePriority(
    NotesChangPriorityEvent event,
    Emitter<NotesState> emit,
  ) {
    emit(state.copyWith(priority: event.value));
  }

  void _onAddTasks(
    NotesAddTasksEvent event,
    Emitter<NotesState> emit,
  ) {
    emit(state.copyWith(
      tasks: event.tasks,
    ));
  }

  @override
  Future<void> close() {
    _notesStream?.cancel();
    return super.close();
  }
}
