import 'package:auth_repository/auth_repository.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:user_repository/src/models/group.dart';

import 'models/user.dart';

class UserRepository {
  final FirestoreRepository _storeService = FirestoreRepository();
  final AuthRepository _authRepository = AuthRepository();

  Future<void> createUser(User user) async {
    await _storeService.setData(
      path: APIPath.user(user.id),
      data: user.toJson(),
    );
  }

  Future<void> setGroup(Group group) async {
    final data = group.copyWith(owner: _authRepository.currentUser.id).toJson();
    await _storeService.setData(
      path: APIPath.group(group.id),
      data: data,
      merge: true,
    );
  }

  Stream<List<Group>> userGroupsStream() {
    return _storeService.collectionStream(
      path: APIPath.groups(),
      builder: (Map<String, dynamic> data) => Group.fromJson(data),
      queryBuilder: (query) => query.where(
        'owner',
        isEqualTo: _authRepository.currentUser.id,
      ),
    );
  }
}
