import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:uuid/uuid.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit() : super(const NewTaskState());

  void onChangeName(String name) => emit(state.copyWith(
        name: name,
      ));

  void onAddTask(String name) => emit(state.copyWith(
        tasks: [
          ...state.tasks,
          TaskModel.create(
            id: const Uuid().v4(),
            name: name,
          ),
        ],
        name: '',
      ));

  void onAddTasks(List<TaskModel> tasks) => emit(state.copyWith(
        tasks: tasks,
      ));

  void onDeleteTask(TaskModel task) => emit(state.copyWith(
        tasks: [
          ...state.tasks.where((item) => task != item),
        ],
      ));
}
