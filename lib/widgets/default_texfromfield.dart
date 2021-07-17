import 'package:dellyshop/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util.dart';
import 'card_widget.dart';

// ignore: must_be_immutable
class CustomTextFromField extends StatelessWidget {
  bool ispassword;
  String placeHolder;
  IconData icon;
  TextInputType inputType;
  double height;
  bool isMasked = false;
  Function onChanged;
  CustomTextFromField(
      {this.placeHolder,
      this.icon,
      this.inputType,
      this.ispassword,
      this.onChanged,
      this.isMasked,
      this.height = 50.0});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      height: height,
      childWidget: Theme(
        data: ThemeData(
          hintColor: Colors.transparent,
        ),
        child: TextFormField(
          onChanged: onChanged,
          textInputAction: TextInputAction.done,
          obscureText: ispassword,
          style: TextStyle(
              color: Utils.isDarkMode
                  ? kDarkTextColorColor
                  : kLightBlackTextColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: placeHolder,
            icon: Icon(
              icon,
              color: kAppColor,
            ),
            labelStyle: TextStyle(
                fontSize: 15.0,
                letterSpacing: 0.3,
                color: Utils.isDarkMode ? kDarkTextColorColor : kTextColorColor,
                fontWeight: FontWeight.w600),
          ),
          keyboardType: inputType,
        ),
      ),
    );
  }
}
