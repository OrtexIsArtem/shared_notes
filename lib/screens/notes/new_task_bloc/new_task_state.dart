part of 'new_task_cubit.dart';

class Task {
  Task({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;
}

class NewTaskState {
  final List<Task> tasks;

  NewTaskState({
    this.tasks = const [],
  });

  NewTaskState copyWith({
    List<Task>? tasks,
  }) {
    return NewTaskState(
      tasks: tasks ?? this.tasks,
    );
  }
}
