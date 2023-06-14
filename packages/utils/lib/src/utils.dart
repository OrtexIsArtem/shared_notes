class Utils {
  static String firebaseDecode(String str) => str.replaceAll(".", "_D");

  static String firebaseEncode(String str) => str.replaceAll("_D", ".");

  static List<String> modelToStringList(List<dynamic> array) {
    List<String> list = array.map((item) => item as String).toList();
    return list;
  }

  static List<int> modelToIntList(List<dynamic> array) {
    List<int> list = array.map((item) => item as int).toList();
    return list;
  }

}
