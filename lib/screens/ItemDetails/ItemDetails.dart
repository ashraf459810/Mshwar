import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/models/ShopItem.dart';
import 'package:dellyshop/screens/ItemDetails/ItemDetailsBody.dart';
import 'package:dellyshop/screens/cart/cart_screen.dart';
import 'package:dellyshop/util.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class ItemDetails extends StatefulWidget {
  final Datum datum;
  ItemDetails({Key key, this.datum}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
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
        body: ItemDetailsBody(datum: widget.datum));
  }
}
