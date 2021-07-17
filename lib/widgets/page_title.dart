import 'package:flutter/material.dart';

import '../constant.dart';

class PageTitle extends StatefulWidget {
  String title;

  PageTitle(this.title);

  @override
  _PageTitleState createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
          color: kAppColor,
          fontSize: kNormalFontSize,
          fontWeight: FontWeight.w500),
    );
  }
}
