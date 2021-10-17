import 'dart:io';

import 'package:dellyshop/Data/Prefs_Helper/IPrefs_Helper.dart';
import 'package:flutter/material.dart';

class Utils {
  static double totalPrice;

  static double gridHeight() {
    if (Platform.isIOS)
      return 260;
    else if (Platform.isAndroid) return 250;
    return null;
  }

  static bool isDarkMode = false;
  static Locale appLocale = Locale("en", "US");
  static bool textisRTL(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    return currentDirection == TextDirection.rtl;
  }
}
