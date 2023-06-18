import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:shared_notes/theme/theme.dart';

const double _kCardRadius = 24.0;

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
    required this.onPress,
    required this.onSwitch,
    required this.note,
  });

  final VoidCallback onPress;
  final void Function(bool) onSwitch;
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(_kCardRadius + 2),
          border: Border.all(
            color: AppColors.border,
            width: 2,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(_kCardRadius),
            onTap: onPress,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            note.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 20,
                                ),
                          ),
                          CupertinoSwitch(
                            value: false,
                            onChanged: onSwitch,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Priority:',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.grayText,
                                    ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Low',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.border,
                ),
                const ListTile(
                  horizontalTitleGap: 0,
                  title: Text(
                    'Edit',
                    style: TextStyle(
                      color: Color.fromRGBO(120, 116, 163, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromRGBO(120, 116, 163, 1),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
