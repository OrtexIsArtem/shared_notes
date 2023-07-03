import 'package:firestore_repository/firestore_repository.dart';

import 'models/user.dart';


class UserRepository {
  final FirestoreRepository _storeService = FirestoreRepository();

  Future<void> onCreateUser(User user) async {
    _storeService.setData(
      path: APIPath.user(user.id),
      data: user.toJson(),
    );
  }
}

