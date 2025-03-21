
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntSizedBoxExtension on num {
  SizedBox height() {
    return SizedBox(height: toDouble());
  }

  SizedBox width() {
    return SizedBox(width: toDouble());
  }
}

extension EllipsisExtension on String {
  String ellipsis({int? max}) {
    if (max == 0) return this;
    print("lenght : $length ---- $max ---- ");
    if (length > (max ?? 19)) {
      final getFirst14String = substring(0, (max ?? 19));
      return '$getFirst14String...';
    }
    return this;
  }
}

extension UpdateExtension on dynamic {
  void silentUpdate() {
    Future.delayed(const Duration(milliseconds: 200), () => this());
  }
}

extension StringExtension on String {
  //to capitalize first letter of the string/sentence.
  String get capitalize => (isNotEmpty) ? "${this[0].toUpperCase()}${substring(1)}" : "";

  //to capitalize every first letter of each word in string/sentence.
  String get cap => split(" ").map((str) => (str.isNotEmpty) ? str.capitalize : "").join(" ");
}

///Number formatter to string
extension NumberFormater on num {
  String intFormatter() {
    NumberFormat formatter = NumberFormat('#,##,##0', 'en');

    return formatter.format(this);
  }

  // String decimalFormatter() {
  //   NumberFormat formatter = NumberFormat.simpleCurrency(name: 'NGN');

  //   return formatter.format(this);
  // }

  String currencyFormatter() {
    NumberFormat formatter = NumberFormat.simpleCurrency(name: 'NGN');

    return formatter.format(this);
  }
}

///DateTime to string
extension DateFormatterExtension on DateTime {
  String yearMonthDayFormatter() {
    final DateFormat yearMonthDayFormatter = DateFormat('yyyy-MM-dd');

    return yearMonthDayFormatter.format(this);
  }

  String formatTime() {
    final timeFormat = DateFormat.jm();

    return timeFormat.format(this);
  }
}
