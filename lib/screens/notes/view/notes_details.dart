import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:shared_notes/layouts/back_layout.dart';
import 'package:shared_notes/widgets/main_header.dart';

class NotesDetails extends StatelessWidget {
  const NotesDetails({
    super.key,
    required this.note,
  });

  final NoteModel note;

  static Future<void> to({required note}) async {
    Get.to(
      () => NotesDetails(note: note),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackLayout(
      topText: 'Notes Name',
      rightIcon: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
      onRightButtonPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MainHeader('Note description'),
              Text(note.description),
            ],
          ),
          if (note.tasks.isNotEmpty) const MainHeader('Notes tasks'),
          Expanded(
            child: ListView.builder(
              itemCount: note.tasks.length,
              itemBuilder: (_, index) {
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    note.tasks[index].name,
                  ),
                  value: false,
                  onChanged: (newValue) {},
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
