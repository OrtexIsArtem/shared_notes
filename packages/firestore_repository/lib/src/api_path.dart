class APIPath {
  const APIPath._();

  static String setMyTodo({required String userId, required String docId}) =>
      'users/$userId/myTodo/$docId';

  static String myTodos({required String userId}) => 'users/$userId/myTodo';
}
