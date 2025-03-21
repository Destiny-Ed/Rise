import 'package:flutter/material.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/theme/app_colors.dart';

void successDialog({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message.cap), backgroundColor: AppColors.secondaryColor));
}

void errorDialog({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.cap), backgroundColor: AppColors.red));
}
