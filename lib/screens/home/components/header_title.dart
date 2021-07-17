import 'package:flutter/material.dart';

import '../../../constant.dart';

// ignore: must_be_immutable
class HeaderTitle extends StatefulWidget {
 final String bigTitle;
 final String subTitle;
  Color color = kBlackFontColor;
  final GestureTapCallback onTap;

  HeaderTitle(this.bigTitle, this.subTitle, this.color, this.onTap);

  @override
  _HeaderTitleState createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.bigTitle,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: widget.color,
                fontWeight: FontWeight.w700,
                fontSize: kTitleFontSize),
          ),
        ),
        InkWell(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.subTitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: kGrayColor.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: kSmallFontSize),
            ),
          ),
        ),
      ],
    );
  }
}
