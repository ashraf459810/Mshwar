import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/product_item_model.dart';
import 'package:dellyshop/screens/cart/cart_screen.dart';
import 'package:dellyshop/screens/product_detail/components/product_detail_body.dart';

import 'package:flutter/material.dart';

import '../../app_localizations.dart';
import '../../util.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product_detail_screen";
  final ProductItemModel productItemModel;
  ProductDetailScreen(this.productItemModel);

  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        iconTheme: IconThemeData(color: kAppColor),
        title: Text(
          ApplicationLocalizations.of(context).translate("product_detail"),
          style: TextStyle(color: kAppColor),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed((CartScreen.routeName));
            },
            child: Stack(
              alignment: AlignmentDirectional(-1.0, -0.8),
              children: <Widget>[
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Utils.isDarkMode
                          ? kDarkBottomIconColor
                          : kBottomIconColor,
                    )),
                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                  child: Text(
                    "0",
                    style: TextStyle(color: Colors.white, fontSize: 13.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ProductDetailBody(productItemModel),
    );
  }
}
