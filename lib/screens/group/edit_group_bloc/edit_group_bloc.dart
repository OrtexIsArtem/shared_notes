import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'edit_group_event.dart';

part 'edit_group_state.dart';

class EditGroupBloc extends Bloc<EditGroupEvent, EditGroupState> {
  EditGroupBloc({
    required UserRepository userRepository,
    required Group? initialGroup,
  })  : _userRepository = userRepository,
        super(
          EditGroupState(
            group: initialGroup,
          ),
        ) {
    on<EditGroupNameEvent>(_onChangeName);
    on<EditGroupSubmittedEvent>(_onSubmitted);
    on<EditChangeMembersListEvent>(_onChangeMembersList);
  }

  final UserRepository _userRepository;

  void _onChangeName(
    EditGroupNameEvent event,
    Emitter<EditGroupState> emit,
  ) {
    emit(state.copyWith(groupName: event.name));
  }

  Future<void> _onSubmitted(
    EditGroupSubmittedEvent event,
    Emitter<EditGroupState> emit,
  ) async {
    final group = (state.group ?? Group()).copyWith(
      name: state.groupName,
    );
    await _userRepository.setGroup(group);
  }

  void _onChangeMembersList(
    EditChangeMembersListEvent event,
    Emitter<EditGroupState> emit,
  ) {
    emit(state.copyWith(members: event.members));
  }
}
