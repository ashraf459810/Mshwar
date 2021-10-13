import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';

import 'package:dellyshop/screens/cart/components/bloc/cart_bloc.dart';

import 'package:dellyshop/screens/home/components/category_list_builder.dart';

import 'package:dellyshop/util.dart';

import 'package:dellyshop/widgets/carousel_pro.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/normal_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsBody extends StatefulWidget {
  final datum;
  final bool islogin;
  ItemDetailsBody({Key key, this.datum, this.islogin}) : super(key: key);

  @override
  _ItemDetailsBodyState createState() => _ItemDetailsBodyState();
}

class _ItemDetailsBodyState extends State<ItemDetailsBody> {
  int count = 1;
  @override
  void initState() {
    context.read<CartBloc>().add(CartCountEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
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
          child: Column(
            children: [
              // rating(),
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
              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: colorAndAmount(size),
              ),
              SizedBox(
                height: h(50),
              ),
              description(size),
              SizedBox(
                height: h(40),
              ),
              widget.islogin ? addToCart(size) : Container(),
              SizedBox(
                height: h(10),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Center addToCart(Size size) {
    return Center(child: Builder(
      builder: (context) {
        return ButtonCustom(
          txt: ApplicationLocalizations.of(context).translate("add_to_cart"),
          witdh: size.width * 0.9,
          ontap: () {
            context.read<CartBloc>().add(AddItemToCartEvent(
                  count,
                  widget.datum.id,
                ));
            setState(() {
              print(count);
            });
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
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ? "${widget.datum.descriptionEn}"
                      : "${widget.datum.description}" ??
                          "${widget.datum.descriptionEn}",
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
          ],
        ),
      ),
    );
  }

  Row colorAndAmount(Size size) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: w(196),
        ),

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
              style: TextStyle(color: kWhiteColor, fontSize: kLargeFontSize),
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
                    left: BorderSide(color: Colors.black12.withOpacity(0.1)))),
            child: Center(
                child: Text(
              "+",
              style: TextStyle(color: kWhiteColor, fontSize: kNormalFontSize),
            )),
          ),
        ),
      ],
    );
  }

  Row header(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: w(10),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: NormalTextWidget(
              ApplicationLocalizations.of(context).appLocale.languageCode ==
                      "en"
                  ? "${widget.datum.titleEn}"
                  : "${widget.datum.title}",
              Utils.isDarkMode ? kDarkBlackTextColor : kLightBlackTextColor,
              kNormalFontSize),
        ),
        SizedBox(
          width: w(65),
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
            Text(
              "${widget.datum.price} JOD",
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
          height: h(20),
        ),
      ],
    );
  }

  rating() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: h(30),
                width: w(75.0),
                decoration: BoxDecoration(
                  color: kAppColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.datum.ratesAvg.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8.0)),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 19.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container productImages() {
    return Container(
      height: h(300),
      child: Hero(
        tag: "hero-Item-${widget.datum.id}",
        child: new Carousel(
          dotColor: Colors.black26,
          dotIncreaseSize: 1.7,
          dotBgColor: Colors.transparent,
          autoplay: false,
          boxFit: BoxFit.fitHeight,
          images: [
            Image.network(widget.datum.images.toString().split(",").first),
            Image.network(widget.datum.images.toString().split(",").last),
          ],
        ),
      ),
    );
  }
}
