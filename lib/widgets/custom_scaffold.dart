import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/page_title.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CustomScaffold extends StatelessWidget {
  Widget body;
  String title;
  CustomScaffold({this.body, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        appBar: AppBar(
          backgroundColor:
              Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
          iconTheme: IconThemeData(color: kAppColor),
          centerTitle: true,
          title: PageTitle(title),
        ),
        body: body);
  }
}
