// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => NoteModel(
      id: json['id'] as String?,
      priority: $enumDecodeNullable(_$PriorityModelEnumMap, json['priority']),
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      groupTask: json['groupTask'] as bool? ?? false,
      groupId: json['groupId'] as String? ?? '',
      owner: json['owner'] as String? ?? '',
    );

Map<String, dynamic> _$NoteModelToJson(NoteModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'priority': _$PriorityModelEnumMap[instance.priority]!,
      'isCompleted': instance.isCompleted,
      'tasks': instance.tasks.map((e) => e.toJson()).toList(),
      'groupTask': instance.groupTask,
      'groupId': instance.groupId,
      'owner': instance.owner,
    };

const _$PriorityModelEnumMap = {
  PriorityModel.noPriority: 'noPriority',
  PriorityModel.low: 'low',
  PriorityModel.medium: 'medium',
  PriorityModel.high: 'high',
};
