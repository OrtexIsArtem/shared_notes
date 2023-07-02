class Task {
  const Task({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Task.create({
    required String id,
    required String name,
  }) {
    return Task(
      id: id,
      name: name,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
