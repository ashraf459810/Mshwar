import 'package:flutter/material.dart';

class socialButton extends StatelessWidget {
  String title;
  Color bgcolor;
  String image;
  Color textColor;
  socialButton(this.title, this.bgcolor, this.image, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: FlatButton(
        color: bgcolor,
        onPressed: () {},
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0)),
        child: Image.asset(
          image,
          height: 25.0,
        ),
      ),
    );
  }
}
