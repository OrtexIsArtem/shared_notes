class APIPath {
  const APIPath._();

  // User
  static String users() => 'users';

  static String user(String userId) => '${users()}/$userId';

  // Notes
  static String notes() => 'notes';

  static String note(String noteId) => '${notes()}/$noteId';

  // Group
  static String groups() => 'groups';

  static String group(String groupId) => '${groups()}/$groupId';
}
