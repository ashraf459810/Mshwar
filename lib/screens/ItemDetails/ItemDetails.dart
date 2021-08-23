import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/models/ShopItem.dart';
import 'package:dellyshop/screens/ItemDetails/ItemDetailsBody.dart';

import 'package:dellyshop/screens/cart/components/cart_screen.dart';
import 'package:dellyshop/screens/cart/components/bloc/cart_bloc.dart';
import 'package:dellyshop/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import '../../constant.dart';

class ItemDetails extends StatefulWidget {
  final Datum datum;
  final data;
  final islogin;
  ItemDetails({Key key, this.datum, this.data, this.islogin}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool islogin = true;
  int cartcount;

  @override
  void initState() {
    context.read<CartBloc>().add(CartCountEvent());
    context.read<CartBloc>().add(GetIsLoginEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is GetIsLoginState) {
          print("here from state");
          print(state.islogin);
          islogin = state.islogin;
          print(islogin);
        }
        return Scaffold(
            backgroundColor:
                Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor:
                  Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
              iconTheme: IconThemeData(color: kAppColor),
              title: Text(
                ApplicationLocalizations.of(context)
                    .translate("product_detail"),
                style: TextStyle(color: kAppColor),
              ),
              actions: islogin
                  ? <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed((CartScreen.routeName));
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
                              if (state is CartInitial) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.orange,
                                  ),
                                );
                              }
                              if (state is AddItemToCartState) {
                                Toast.show(
                                    "Added to cart Successfully", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.TOP,
                                    backgroundColor: Colors.orange[900]);
                              }
                            }, builder: (context, state) {
                              if (state is CartCountState) {
                                cartcount = state.count;
                              }
                              return cartcount != null
                                  ? CircleAvatar(
                                      radius: 10.0,
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        cartcount.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    )
                                  : Container();
                            }),
                          ],
                        ),
                      ),
                    ]
                  : <Widget>[],
            ),
            body: widget.data == null
                ? ItemDetailsBody(
                    datum: widget.datum,
                    islogin: islogin,
                  )
                : ItemDetailsBody(
                    datum: widget.data,
                    islogin: islogin,
                  ));
      },
    );
  }
}
