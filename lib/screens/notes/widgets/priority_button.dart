import 'package:flutter/material.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:shared_notes/constant/constant.dart';
import 'package:shared_notes/theme/theme.dart';
import 'package:shared_notes/utils/utils.dart';

class PriorityButton extends StatefulWidget {
  const PriorityButton({
    super.key,
    required this.onConfirm,
  });

  final void Function(PriorityModel) onConfirm;

  @override
  State<PriorityButton> createState() => _PriorityButtonState();
}

class _PriorityButtonState extends State<PriorityButton> {
  PriorityModel? priority;

  Color getColorForPriority(PriorityModel priority) {
    switch (priority) {
      case PriorityModel.low:
        return Colors.green;
      case PriorityModel.medium:
        return Colors.orange;
      case PriorityModel.high:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(kInputBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(kInputBorderRadius),
        onTap: () {
          showWheel(
            context: context,
            onConfirm: () {
              setState(() {
                priority = priority ?? PriorityModel.getByIndex(0);
              });
              widget.onConfirm(priority!);
            },
            child: Scaffold(
              body: CupertinoWheelPicker(
                onSelectedItemChanged: (int index) {
                  setState(() {
                    priority = PriorityModel.getByIndex(index);
                  });
                  widget.onConfirm(priority!);
                },
                children: PriorityModel.values
                    .map(
                      (priority) => Center(
                        child: Text(priority.name),
                      ),
                    )
                    .toList(),
              ),
            ),
            onCancel: () {},
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: 90,
          height: 57,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.border,
            ),
            borderRadius: BorderRadius.circular(kInputBorderRadius),
          ),
          child: Text(
            priority?.name ?? 'Priority',
            style: priority == null
                ? textTheme.bodySmall!.copyWith(
                    color: AppColors.grayText,
                  )
                : textTheme.bodySmall!.copyWith(
                    color: getColorForPriority(priority!),
                  ),
          ),
        ),
      ),
    );
  }
}
