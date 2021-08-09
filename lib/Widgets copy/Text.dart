import 'package:flutter/material.dart';

Widget text(
    {String text,
    Color color,
    double fontsize,
    FontWeight fontWeight,
    String fontfamily}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: "font",
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight ?? FontWeight.normal),
  );
}
