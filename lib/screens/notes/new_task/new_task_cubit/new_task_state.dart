part of 'new_task_cubit.dart';



class NewTaskState extends Equatable {
  final List<Task> tasks;
  final String name;

  const NewTaskState({
    this.tasks = const [],
    this.name = '',
  });

  NewTaskState copyWith({
    List<Task>? tasks,
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
