
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit() : super(NewTaskState());
}
