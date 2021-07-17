import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constant.dart';
import '../util.dart';

class ShimmerWidget extends StatefulWidget {
  Widget child;

  ShimmerWidget({this.child});

  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: widget.child,
      baseColor:
          Utils.isDarkMode ? kDarkBLackBgColor : Colors.grey.withOpacity(0.7),
      highlightColor:
          Utils.isDarkMode ? kDarkItemColor : Colors.grey.withOpacity(0.4),
    );
  }
}
