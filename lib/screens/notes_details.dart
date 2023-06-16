import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_notes/layouts/back_layout.dart';
import 'package:shared_notes/widgets/main_header.dart';

class NotesDetails extends StatelessWidget {
  const NotesDetails({super.key});

  static Future<void> to() async {
    Get.to(
      () => const NotesDetails(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackLayout(
      topText: 'Notes Name',
      rightIcon: const Icon(Icons.settings, color: Colors.black,),
      onRightButtonPressed: () {
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MainHeader('Notes tasks'),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'task',
                  ),
                  value: false,
                  onChanged: (newValue) {
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
