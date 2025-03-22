import 'package:flutter/material.dart';
import 'package:rise/core/theme/app_colors.dart';

Future<DateTime?> pickDate(BuildContext context, {required DateTime firstDate, required DateTime secondDate}) async {
  final date = await showDatePicker(
    context: context,
    firstDate: firstDate,
    lastDate: secondDate,
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
          buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
  );

  return date;
}

Future<TimeOfDay?> pickTime(BuildContext context) async {
  TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
  return pickedTime;
}
