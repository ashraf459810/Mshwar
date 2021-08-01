import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final Color bgcolor;
  final String image;
  final Color textColor;
  SocialButton(this.title, this.bgcolor, this.image, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      // ignore: deprecated_member_use
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
