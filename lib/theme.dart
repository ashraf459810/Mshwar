import 'package:dellyshop/util.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kDefaultBgColor,
    fontFamily: "Poppins",
    canvasColor: Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
    appBarTheme: appBarTheme(),
    primaryColor: Utils.isDarkMode ? kDarkPrimaryColor : kPrimaryColor,
    primaryColorLight:
        Utils.isDarkMode ? kDarkBlackTextColor : kPrimaryLightColor,
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Colors.transparent),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kWhiteColor),
    bodyText2: TextStyle(color: kWhiteColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kPrimaryColor,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: kWhiteColor, fontSize: 18),
    ),
  );
}
