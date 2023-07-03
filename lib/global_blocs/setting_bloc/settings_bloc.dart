import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:uuid/uuid.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(SettingsState()) {
    on<SettingsCrateGroupEvent>(_onCreateGroup);
  }

  final SettingsRepository _settingsRepository;

  void _onCreateGroup(
    SettingsCrateGroupEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _settingsRepository.onCreateGroup(GroupModel(
      id: const Uuid().v4(),
      name: event.name,
    ));
  }
}
