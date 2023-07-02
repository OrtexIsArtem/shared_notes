import 'package:notes_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

class NoteModel {
  NoteModel({
    String? id,
    this.title = '',
    this.description = '',
    this.priority = PriorityModel.noPriority,
    this.isCompleted = false,
    this.tasks = const [],
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String title;
  final String description;
  final PriorityModel priority;
  final bool isCompleted;
  final List<Task> tasks;

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> tasksJson = json['tasks'] ?? [];
    final List<Task> tasks = tasksJson.map((taskJson) {
      return Task.fromJson(taskJson);
    }).toList();

    return NoteModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      tasks: tasks,
      priority: PriorityModel.getByIndex(json['priority']) ??
          PriorityModel.noPriority,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'tasks': tasks.map((e) => e.toJson()).toList(),
      'priority': priority.value,
    };
  }

  factory NoteModel.create({
    String? id,
    bool? isCompleted,
    required String title,
    required String description,
    List<Task>? tasks,
    PriorityModel? priority,
  }) {
    return NoteModel(
      id: id ?? const Uuid().v4(),
      title: title,
      description: description,
      isCompleted: isCompleted ?? false,
      tasks: tasks ?? [],
      priority: priority ?? PriorityModel.noPriority,
    );
  }
}
