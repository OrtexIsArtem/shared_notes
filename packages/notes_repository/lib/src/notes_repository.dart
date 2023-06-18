import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:notes_repository/notes_repository.dart';

class NotesRepository {
  final FirestoreRepository _storeService = FirestoreRepository();
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  Future<void> createNote(NoteModel note) async {
    await _storeService.setData(
      path: APIPath.setMyTodo(
        userId: _currentUser!.uid,
        docId: note.id,
      ),
      data: note.toJson(),
    );
  }

  Stream<List<NoteModel>> notesStream() {
    return _storeService.collectionStream(
      path: APIPath.myTodos(userId: _currentUser!.uid),
      builder: (data, documentId) => NoteModel.fromJson(data),
    );
  }
}
