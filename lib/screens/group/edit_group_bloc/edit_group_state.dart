part of 'edit_group_bloc.dart';

class EditGroupState {
  const EditGroupState({
    this.group,
    this.groupName = '',
    this.members = const [],
  });

  final Group? group;
  final String groupName;
  final List<String> members;

  EditGroupState copyWith({
    Group? group,
    String? groupName,
    List<String>? members,
  }) {
    return EditGroupState(
      group: group ?? this.group,
      groupName: groupName ?? this.groupName,
      members: members ?? this.members,
    );
  }
}
