import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const SettingsState()) {
    // on<SettingsCreateGroupEvent>(_onCreateGroup);
    // on<SettingsEditGroupEvent>(_onEditGroup);
    on<SettingsChangeGroupEvent>(_onChangeGroup);
    _streamSubscription = _userRepository.userGroupsStream().listen((event) {
      add(SettingsChangeGroupEvent(event));
    });
  }

  final UserRepository _userRepository;
  StreamSubscription<List<Group>>? _streamSubscription;


  void _onChangeGroup(
    SettingsChangeGroupEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(userGroups: event.groups));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
