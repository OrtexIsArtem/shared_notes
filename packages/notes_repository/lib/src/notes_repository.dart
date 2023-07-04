import 'package:auth_repository/auth_repository.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:notes_repository/notes_repository.dart';

class NotesRepository {
  final FirestoreRepository _storeService = FirestoreRepository();
  final AuthRepository _authRepository = AuthRepository();

  Future<void> createNote(NoteModel note) async {
    try {
      final data = note.copyWith(owner: _authRepository.currentUser.id).toJson();
      await _storeService.setData(
        path: APIPath.note(note.id),
        data: data,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateNoteStatus({
    required String noteId,
    required bool isCompleted,
  }) async {
    await _storeService.updateData(
      path: APIPath.note(noteId),
      data: {'isCompleted': isCompleted},
    );
  }

  Stream<List<NoteModel>> notesStream() {
    return _storeService.collectionStream(
      path: APIPath.notes(),
      builder: (data) => NoteModel.fromJson(data),
      queryBuilder: (query) {
        return query.where(
          'owner',
          isEqualTo: _authRepository.currentUser.id,
        );
      },
    );
  }
}
