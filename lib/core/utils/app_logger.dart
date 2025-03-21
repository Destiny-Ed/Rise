import 'dart:developer';

import 'package:flutter/foundation.dart';

appLogger(dynamic data, {bool isBlue = false, StackTrace? stacktrace}) {
  if (kDebugMode) {
    if (isBlue) {
      print("Debug Log : $data :: stacktrace : $stacktrace");
    } else {
      log("Debug Log : $data :: stacktrace : $stacktrace");
    }
  }
}
