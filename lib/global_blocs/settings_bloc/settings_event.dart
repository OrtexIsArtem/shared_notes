part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

// class SettingsCreateGroupEvent extends SettingsEvent {
//   SettingsCreateGroupEvent(this.groupName);
//
//   final String groupName;
// }

// class SettingsEditGroupEvent extends SettingsEvent {
//   SettingsEditGroupEvent(this.groupName);
//
//   final String groupName;
// }

class SettingsChangeGroupEvent extends SettingsEvent {
  SettingsChangeGroupEvent(this.groups);

  final List<Group> groups;
}
