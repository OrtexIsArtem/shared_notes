import 'package:json_annotation/json_annotation.dart';
import 'package:notes_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';
import 'package:meta/meta.dart';

part 'note_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class NoteModel {
  NoteModel({
    String? id,
    PriorityModel? priority,
    this.title = '',
    this.description = '',
    this.isCompleted = false,
    this.tasks = const [],
    this.groupTask = false,
    this.groupId = '',
    this.owner = '',
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4(),
        priority = priority ?? PriorityModel.noPriority;

  final String id;
  final String title;
  final String description;
  final PriorityModel priority;
  final bool isCompleted;
  final List<TaskModel> tasks;
  final bool groupTask;
  final String groupId;
  final String owner;

  NoteModel copyWith({
    String? id,
    String? title,
    String? description,
    PriorityModel? priority,
    bool? isCompleted,
    List<TaskModel>? tasks,
    bool? groupTask,
    String? groupId,
    String? owner,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      tasks: tasks ?? this.tasks,
      groupTask: groupTask ?? this.groupTask,
      groupId: groupId ?? this.groupId,
      owner: owner ?? this.owner,
    );
  }

  static NoteModel fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);
}
