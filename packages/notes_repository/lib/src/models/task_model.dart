import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  const TaskModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory TaskModel.create({
    required String id,
    required String name,
  }) {
    return TaskModel(
      id: id,
      name: name,
    );
  }

  static TaskModel fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
