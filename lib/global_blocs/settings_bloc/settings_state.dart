part of 'settings_bloc.dart';

class SettingsState {
  const SettingsState({
    this.userGroups = const [],
  });

  final List<Group> userGroups;

  SettingsState copyWith({
    List<Group>? userGroups,
  }) {
    return SettingsState(
      userGroups: userGroups ?? this.userGroups,
    );
  }
}
