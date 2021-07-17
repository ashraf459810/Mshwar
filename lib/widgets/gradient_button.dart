import 'package:dellyshop/constant.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  String title;
  GestureTapCallback onTap;

  GradientButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Container(
          height: 55.0,
          width: 600.0,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.2,
                fontFamily: "Sans",
                fontSize: 18.0,
                fontWeight: FontWeight.w800),
          ),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                  colors: <Color>[Color(0xFF222831), kAppColor])),
        ),
      ),
    );
  }
}
