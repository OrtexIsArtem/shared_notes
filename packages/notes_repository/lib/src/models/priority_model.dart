enum PriorityModel {
  noPriority(0),
  low(1),
  medium(2),
  high(3);

  const PriorityModel(this.value);

  final int value;

  String get name {
    return toString().split('.').last;
  }

  static PriorityModel? getByIndex(int? index) {
    if (index == null) return null;
    const values = PriorityModel.values;
    if (index >= 0 && index < values.length) {
      return values[index];
    }
    return null;
  }

  static String getName(PriorityModel priorityModel) {
    switch (priorityModel) {
      case PriorityModel.noPriority:
        return 'No Priority';
      case PriorityModel.low:
        return 'Low';
      case PriorityModel.medium:
        return 'Medium';
      case PriorityModel.high:
        return 'High';
    }
  }
}
