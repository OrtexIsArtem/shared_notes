import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_notes/widgets/widgets.dart';

import '../constant/constant.dart';

class BackLayout extends StatelessWidget {
  final Widget child;
  final void Function()? onRightButtonPressed;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String? topText;
  final bool isEmptyData;
  final String? emptyDataText;
  final EdgeInsets? padding;

  const BackLayout({
    super.key,
    required this.child,
    this.onRightButtonPressed,
    this.leftIcon,
    this.rightIcon,
    this.topText,
    this.isEmptyData = false,
    this.emptyDataText,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HeaderBack(
                onLeftButtonPressed: () {
                  Get.back();
                },
                onRightButtonPressed: isEmptyData ? null : onRightButtonPressed,
                leftIcon: leftIcon,
                rightIcon: rightIcon,
                topText: topText,
              ),
              Expanded(
                child: isEmptyData
                    ? Center(
                        child: Text(
                          emptyDataText ?? '',
                        ),
                      )
                    : Padding(
                        padding: padding ??
                            const EdgeInsets.symmetric(
                              horizontal: kHorizontalPadding,
                            ),
                        child: child,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
