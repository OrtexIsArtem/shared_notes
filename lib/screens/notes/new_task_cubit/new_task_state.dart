part of 'new_task_cubit.dart';



class NewTaskState extends Equatable {
  final List<TaskModel> tasks;
  final String name;

  const NewTaskState({
    this.tasks = const [],
    this.name = '',
  });

  NewTaskState copyWith({
    List<TaskModel>? tasks,
    String? name,
  }) {
    return NewTaskState(
      tasks: tasks ?? this.tasks,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [tasks, name];
}
