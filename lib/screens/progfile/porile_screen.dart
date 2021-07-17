import 'package:dellyshop/app_localizations.dart';

import 'package:dellyshop/widgets/page_title.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../util.dart';
import 'components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:
              Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
          centerTitle: true,
          title: PageTitle(
              ApplicationLocalizations.of(context).translate("my_profile")),
        ),
        body: ProfileBody());
  }
}
