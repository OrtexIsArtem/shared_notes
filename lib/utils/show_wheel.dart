import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

void showWheel({
  required BuildContext context,
  required Widget child,
  required void Function()? onCancel,
  required void Function()? onConfirm,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
            border: Border(
              bottom: BorderSide(
                color: Color(0xff999999),
                width: 0.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                onPressed: () {
                  if (onCancel != null) {
                    onCancel();
                  }
                  Get.back();
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: const Text('Cancel'),
              ),
              CupertinoButton(
                onPressed: () {
                  if (onConfirm != null) {
                    onConfirm();
                  }
                  Get.back();
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: const Text('confirm'),
              )
            ],
          ),
        ),
        Container(
          height: 220.0,
          color: const Color(0xfff7f7f7),
          child: child,
        )
      ],
    ),
  );
}

class CupertinoWheelPicker extends StatelessWidget {
  final void Function(int)? onSelectedItemChanged;
  final List<Widget> children;

  const CupertinoWheelPicker({
    super.key,
    required this.onSelectedItemChanged,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: 32.0,
      onSelectedItemChanged: onSelectedItemChanged,
      children: children,
    );
  }
}
