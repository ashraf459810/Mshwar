import 'package:dellyshop/constant.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  @override
  String txt;
  Color bacgroudColor;
  Color textColor;
  Color borderColor;
  double witdh;
  double height;
  GestureTapCallback ontap;
  ButtonCustom(
      {this.txt,
      this.ontap,
      this.bacgroudColor,
      this.textColor,
      this.height = 50,
      this.borderColor = Colors.white,
      this.witdh = 300});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      splashColor: Colors.white,
      child: LayoutBuilder(builder: (context, constraint) {
        return ButtonTheme(
          height: height,
          minWidth: witdh,
          child: RaisedButton(
              color: bacgroudColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: borderColor)),
              onPressed: ontap,
              child: Text(
                txt,
                style: TextStyle(color: textColor, fontSize: kSubTitleFontSize),
              )),
        );
      }),
    );
  }
}
