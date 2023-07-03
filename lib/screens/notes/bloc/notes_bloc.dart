import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:uuid/uuid.dart';

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
    on<NotesToggleGroupTypeEvent>(_onToggleGroupType);
    on<NotesToggleNoteStatusEvent>(_onToggleNoteStatus);
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
    final myNotes = event.notes.where((element) => !element.groupTask).toList();
    final groupNotes =
        event.notes.where((element) => element.groupTask).toList();
    emit(state.copyWith(
      myNotes: myNotes,
      groupNotes: groupNotes,
    ));
  }

  void _onCreateNote(
    NotesCreateNoteEvent event,
    Emitter<NotesState> emit,
  ) async {
    final note = NoteModel(
      title: state.title,
      description: state.description,
      tasks: state.tasks,
      priority: state.priority,
      groupTask: state.groupTask,
      groupId: state.groupTask ? const Uuid().v4() : '',
    );
    try {
      await _notesRepository.createNote(note);
      // clear state
      emit(NotesState(
        myNotes: state.myNotes,
        groupNotes: state.groupNotes,
        status: NotesStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: NotesStatus.failure,
      ));
      print(e);
    }
  }

  void _onToggleNoteStatus(
    NotesToggleNoteStatusEvent event,
    Emitter<NotesState> emit,
  ) async {
    try {
      await _notesRepository.updateNoteStatus(
        noteId: event.note.id,
        isCompleted: !event.note.isCompleted,
      );
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

  void _onToggleGroupType(
    NotesToggleGroupTypeEvent event,
    Emitter<NotesState> emit,
  ) {
    emit(state.copyWith(groupTask: !state.groupTask));
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
