import 'package:dellyshop/Widgets%20copy/Text.dart';
import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';

import 'package:dellyshop/models/DiscountItems/DiscountItems.dart';

import 'package:dellyshop/screens/cart/components/bloc/cart_bloc.dart';

import 'package:dellyshop/screens/home/components/category_list_builder.dart';

import 'package:dellyshop/util.dart';

import 'package:dellyshop/widgets/carousel_pro.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/normal_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class DiscountItemDetails extends StatefulWidget {
  final ItemsWithDiscount itemsWithDiscount;

  final bool islogin;
  DiscountItemDetails({Key key, this.itemsWithDiscount, this.islogin})
      : super(key: key);

  @override
  _DiscountItemDetailsState createState() => _DiscountItemDetailsState();
}

class _DiscountItemDetailsState extends State<DiscountItemDetails> {
  int count = 1;
  @override
  void initState() {
    context.read<CartBloc>().add(CartCountEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        productImages(),
        Container(
          width: size.width,
          decoration: BoxDecoration(
              color: Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF656565).withOpacity(0.15),
                  blurRadius: 1.0,
                  spreadRadius: 0.2,
                )
              ]),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h(10),
              ),
              header(context),
              SizedBox(
                height: h(2),
              ),
              SizedBox(
                height: h(10),
              ),
              // colorAndAmount(size),
              SizedBox(
                height: h(10),
              ),
              description(size),
              SizedBox(
                height: h(40),
              ),
              BlocConsumer<CartBloc, CartState>(listener: (context, state) {
                if (state is AddItemToCartState) {
                  Toast.show(
                      ApplicationLocalizations.of(context)
                          .translate("Added to cart Successfully"),
                      context,
                      backgroundColor: Colors.orange[900],
                      gravity: 2);
                }
              }, builder: (context, state) {
                if (state is Error) {
                  return Center(child: text(text: "${state.error}"));
                }
                return widget.islogin ? addToCart(size) : Container();
              }),
            ],
          ),
        ),
      ],
    ));
  }

  Center addToCart(Size size) {
    return Center(child: Builder(
      builder: (context) {
        return ButtonCustom(
          txt: ApplicationLocalizations.of(context).translate("add_to_cart"),
          witdh: size.width * 0.9,
          ontap: () {
            context.read<CartBloc>().add(
                AddItemToCartEvent(count, widget.itemsWithDiscount.id, ""));
            setState(() {});
          },
          bacgroudColor: kAppColor,
          textColor: kWhiteColor,
        );
      },
    ));
  }

  Container description(Size size) {
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                ApplicationLocalizations.of(context).translate("Description"),
                style: TextStyle(
                    color: kAppColor,
                    fontWeight: FontWeight.w700,
                    fontSize: kTitleFontSize),
              ),
              Text(
                " : ",
                style: TextStyle(
                    color: Utils.isDarkMode
                        ? kDarkBlackTextColor
                        : Colors.orange[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ApplicationLocalizations.of(context).appLocale.languageCode ==
                        "en"
                    ? "${widget.itemsWithDiscount.descriptionEn}"
                    : "${widget.itemsWithDiscount.description}" ??
                        "${widget.itemsWithDiscount.descriptionEn}",
                style: TextStyle(
                    color: Utils.isDarkMode
                        ? kDarkBlackTextColor
                        : Colors.orange[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: h(10),
          ),
          SizedBox(
            height: h(30),
          ),
          // Center(
          //   child: InkWell(
          //     onTap: () {
          //       // _bottomSheet();
          //     },
          //     child: Text(
          //       ApplicationLocalizations.of(context).translate("view_more"),
          //       style: TextStyle(
          //         color: kAppColor,
          //         fontSize: 15.0,
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Row colorAndAmount(Size size) {
    return Row(
      children: [
        SizedBox(
            // width: w(230),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// Decrease of value item
            InkWell(
              onTap: () {
                if (count != 1) {
                  count--;
                  setState(() {});
                }
              },
              child: Container(
                height: h(40),
                width: h(40),
                decoration: BoxDecoration(
                  color: kAppColor.withOpacity(0.7),
                  border: Border(
                      right: BorderSide(
                        color: Colors.black12.withOpacity(0.1),
                      ),
                      left: BorderSide(
                        color: Colors.black12.withOpacity(0.1),
                      )),
                ),
                child: Center(
                    child: Text(
                  "-",
                  style:
                      TextStyle(color: kWhiteColor, fontSize: kLargeFontSize),
                )),
              ),
            ),
            Container(
              width: w(40),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),

            /// Increasing value of items
            InkWell(
              onTap: () {
                count++;
                setState(() {});
              },
              child: Container(
                height: h(40),
                width: h(40.0),
                decoration: BoxDecoration(
                    color: kAppColor.withOpacity(0.7),
                    border: Border(
                        left: BorderSide(
                            color: Colors.black12.withOpacity(0.1)))),
                child: Center(
                    child: Text(
                  "+",
                  style:
                      TextStyle(color: kWhiteColor, fontSize: kNormalFontSize),
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.9,
          child: NormalTextWidget(
              ApplicationLocalizations.of(context).appLocale.languageCode ==
                      "en"
                  ? widget.itemsWithDiscount.titleEn
                  : widget.itemsWithDiscount.title,
              Utils.isDarkMode ? kDarkBlackTextColor : kLightBlackTextColor,
              kNormalFontSize),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  ApplicationLocalizations.of(context).translate("sale"),
                  style: TextStyle(
                      color: Utils.isDarkMode
                          ? kDarkBlackTextColor
                          : Colors.orange[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  " : ",
                  style: TextStyle(
                      color: Utils.isDarkMode
                          ? kDarkBlackTextColor
                          : Colors.orange[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ApplicationLocalizations.of(context).appLocale.languageCode ==
                          "en"
                      ? "${widget.itemsWithDiscount.discount}%"
                      : "${widget.itemsWithDiscount.discount}%",
                  style: TextStyle(
                      color: Utils.isDarkMode
                          ? kDarkBlackTextColor
                          : Colors.orange[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: h(10),
            ),
            Row(
              children: [
                Text(
                  ApplicationLocalizations.of(context).translate("Price"),
                  style: TextStyle(
                      color: Utils.isDarkMode
                          ? kDarkBlackTextColor
                          : Colors.orange[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ": ",
                  style: TextStyle(
                      color: Utils.isDarkMode
                          ? kDarkBlackTextColor
                          : Colors.orange[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "${widget.itemsWithDiscount.price}",
                      style: TextStyle(
                          color: Utils.isDarkMode
                              ? kDarkBlackTextColor
                              : Colors.orange[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(' :'),
                    Text(
                      ApplicationLocalizations.of(context).translate("JOD"),
                      style: TextStyle(
                          color: Utils.isDarkMode
                              ? kDarkBlackTextColor
                              : Colors.orange[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: h(20),
            ),
          ],
        ),
      ],
    );
  }

  Container productImages() {
    return Container(
      height: h(300),
      child: Hero(
        tag: "hero-Item-${widget.itemsWithDiscount.id}",
        child: new Carousel(
          dotColor: Colors.black26,
          dotIncreaseSize: 1.7,
          dotBgColor: Colors.transparent,
          autoplay: false,
          boxFit: BoxFit.fitHeight,
          images: [
            Image.network('${widget.itemsWithDiscount.images}'),
            // Image.network(widget.itemsWithDiscount.images),
          ],
        ),
      ),
    );
  }
}
