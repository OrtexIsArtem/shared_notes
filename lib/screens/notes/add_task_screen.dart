import 'package:flutter/material.dart';
import 'package:shared_notes/layouts/back_layout.dart';
import 'package:shared_notes/widgets/main_input.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackLayout(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            MainInput(labelText: 'Add new task'),
            const SizedBox(height: 15),
            Text('Task 1'),
            Text('Task 2'),
            Text('Task 3'),
          ],
        ),
      ),
    );
  }
}
