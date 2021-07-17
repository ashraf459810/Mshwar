import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/widgets/page_title.dart';
import 'package:flutter/material.dart';

import '../../util.dart';
import 'components/cart_body.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart_screen";
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
              ApplicationLocalizations.of(context).translate("my_cart")),
        ),
        body: CartBody());
  }
}
