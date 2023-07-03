part of 'settings_bloc.dart';

class SettingsEvent {
  const SettingsEvent();
}

class SettingsCrateGroupEvent extends SettingsEvent {
  const SettingsCrateGroupEvent({
    required this.name,
  });

  final String name;
}
