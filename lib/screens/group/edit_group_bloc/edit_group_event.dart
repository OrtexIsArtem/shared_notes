part of 'edit_group_bloc.dart';

class EditGroupEvent {
  const EditGroupEvent();
}

class EditGroupNameEvent extends EditGroupEvent {
  EditGroupNameEvent(this.name);

  final String name;
}

class EditGroupSubmittedEvent extends EditGroupEvent {}

class EditChangeMembersListEvent extends EditGroupEvent {
  EditChangeMembersListEvent(this.members);

  final List<String> members;
}
