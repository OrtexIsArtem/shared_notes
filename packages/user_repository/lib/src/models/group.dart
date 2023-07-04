import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'group.g.dart';

@JsonSerializable(explicitToJson: true)
class Group {
  Group({
    String? id,
    this.name = '',
    this.members = const [],
    this.owner = '',
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final List<String> members;
  final String owner;

  Group copyWith({
    String? id,
    String? name,
    List<String>? members,
    String? owner,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      members: members ?? this.members,
      owner: owner ?? this.owner,
    );
  }

  static Group fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
