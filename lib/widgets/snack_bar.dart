import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_notes/theme/theme.dart';

enum SnackBarType { error, successful, info}

class SnackBarSettings {
  final String title;
  final String message;
  final Color? backgroundColor;
  final Color? colorText;

  SnackBarSettings({
    required this.title,
    required this.message,
    this.backgroundColor,
    this.colorText,
  });
}

void showInfoSnackBar({
  String? title,
  String? message,
  required SnackBarType type,
}) {
  SnackBarSettings settings;

  switch (type) {
    case SnackBarType.error:
      settings = SnackBarSettings(
        title: title ?? 'Failure',
        message: message ?? '',
        backgroundColor: AppColors.error.withOpacity(0.7),
        colorText: AppColors.primaryText,
      );
      break;
    case SnackBarType.successful:
      settings = SnackBarSettings(
        title: title ?? 'Successful',
        message: message ?? '',
        backgroundColor: AppColors.success,
        colorText: AppColors.primaryText,
      );
      break;
    case SnackBarType.info:
      settings = SnackBarSettings(
        title: title ?? 'Successful',
        message: message ?? '',
      );
      break;
  }

  Get.snackbar(
    settings.title,
    settings.message,
    backgroundColor: settings.backgroundColor,
    colorText: settings.colorText,
    duration: const Duration(seconds: 5),
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    animationDuration: const Duration(milliseconds: 350),
  );
}
