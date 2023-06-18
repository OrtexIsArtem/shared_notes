import 'package:notes_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

class NoteModel {
  NoteModel({
    String? id,
    this.title = '',
    this.description = '',
    // this.priority = PriorityModel.low,
    this.isCompleted = false,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String title;
  final String description;
  // final PriorityModel priority;
  final bool isCompleted;

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      // priority: json['priority'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      // 'priority': priority.name,
    };
  }

  NoteModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    PriorityModel? priority,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      // priority: priority ?? this.priority,
    );
  }
}
