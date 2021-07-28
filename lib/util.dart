import 'dart:io';

import 'package:flutter/material.dart';

class Utils {
  static double totalPrice;

  static double GridHeight() {
    if (Platform.isIOS)
      return 260;
    else if (Platform.isAndroid) return 250;
  }

  static bool isDarkMode = false;
  static Locale appLocale = new Locale("en", "US");
  static bool textisRTL(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    return currentDirection == TextDirection.rtl;
  }
}
