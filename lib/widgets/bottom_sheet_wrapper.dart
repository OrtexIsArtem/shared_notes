import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

const double _kTopRadius = 26.0;
const Color _kBGColor = Colors.white;

class BottomSheetWrapper extends StatelessWidget {
  const BottomSheetWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.65,
        builder: (context, controller) {
          return Container(
            decoration: BoxDecoration(
              color: _kBGColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(_kTopRadius),
                topRight: Radius.circular(_kTopRadius),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: child,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
