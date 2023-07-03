import 'package:firestore_repository/firestore_repository.dart';

import 'models/group_model.dart';

class SettingsRepository {
  final FirestoreRepository _storeService = FirestoreRepository();

  Future<void> onCreateGroup(GroupModel group) async {
    // _storeService.setData(
    //   path: APIPath.myGroup(userId: _currentUser!.uid, docId: group.id),
    //   data: group.toJson(),
    // );
  }
}

