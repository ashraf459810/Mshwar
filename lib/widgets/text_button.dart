import 'package:flutter/material.dart';

class CutomTextButton extends StatelessWidget {
  String text;
  GestureTapCallback onTap;

  CutomTextButton(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 20.0),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins"),
      ),
    );
  }
}
