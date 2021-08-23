import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/models/DiscountItems/DiscountItems.dart';

import 'package:dellyshop/screens/cart/components/cart_screen.dart';
import 'package:dellyshop/screens/cart/components/bloc/cart_bloc.dart';
import 'package:dellyshop/screens/home/components/DiscountItemsDetails.dart';
import 'package:dellyshop/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import '../../../constant.dart';

class DiscountDetails extends StatefulWidget {
  final ItemsWithDiscount datum;
  DiscountDetails({Key key, this.datum}) : super(key: key);

  @override
  _DiscountDetailsState createState() => _DiscountDetailsState();
}

class _DiscountDetailsState extends State<DiscountDetails> {
  bool islogin = false;
  int cartcount;

  get kDarkDefaultBgColor => null;

  @override
  void initState() {
    context.read<CartBloc>().add(CartCountEvent());
    context.read<CartBloc>().add(GetIsLoginEvent());
    super.initState();
  }

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
            actions: islogin
                ? <Widget>[
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
                          BlocConsumer<CartBloc, CartState>(
                              listener: (context, state) {
                            if (state is GetIsLoginState) {
                              islogin = state.islogin;
                            }
                            if (state is CartInitial) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.orange,
                                ),
                              );
                            }
                            if (state is AddItemToCartState) {
                              Toast.show("Added to cart Successfully", context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.TOP,
                                  backgroundColor: Colors.orange[900]);
                            }
                          }, builder: (context, state) {
                            if (state is CartCountState) {
                              print("here from state of vcount");
                              cartcount = state.count;
                            }
                            return cartcount != null
                                ? CircleAvatar(
                                    radius: 10.0,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      cartcount.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  )
                                : Container();
                          }),
                        ],
                      ),
                    ),
                  ]
                : <Widget>[]),
        body: DiscountItemDetails(
            itemsWithDiscount: widget.datum, islogin: islogin));
  }
}
