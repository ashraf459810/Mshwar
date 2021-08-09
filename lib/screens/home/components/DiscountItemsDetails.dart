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

class DiscountItemDetails extends StatefulWidget {
  final ItemsWithDiscount itemsWithDiscount;
  DiscountItemDetails({Key key, this.itemsWithDiscount}) : super(key: key);

  @override
  _DiscountItemDetailsState createState() => _DiscountItemDetailsState();
}

class _DiscountItemDetailsState extends State<DiscountItemDetails> {
  int count = 0;

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
              rating(),
              SizedBox(
                height: h(10),
              ),
              header(context),
              SizedBox(
                height: h(2),
              ),
              // NormalTextWidget(
              //     widget.itemsWithDiscount.title,
              //     Utils.isDarkMode ? kDarkTextColorColor : kTextColorColor,
              //     kTitleFontSize),
              SizedBox(
                height: h(10),
              ),
              colorAndAmount(size),
              SizedBox(
                height: h(10),
              ),
              description(size),
              SizedBox(
                height: h(40),
              ),
              addToCart(size),
              // HeaderTitle(
              //     ApplicationLocalizations.of(context).translate("comments"),
              //     ApplicationLocalizations.of(context).translate("view_all"),
              //     kAppColor, () {
              //   _commentBottomSheet();
              // }),
              SizedBox(
                height: h(10),
              ),
              // SizedBox(
              //   height: myCommentList.take(2).length * 160.0,
              //   child: ListView.builder(
              //     physics: NeverScrollableScrollPhysics(),
              //     itemBuilder: (c, i) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CardWidget(
              //           height: h(140),
              //           childWidget: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Padding(
              //                 padding:
              //                     const EdgeInsets.symmetric(vertical: 10.0),
              //                 child: widget
              //                         .itemsWithDiscount.comments.isNotEmpty
              //                     ? StarDisplay(
              //                         value:
              //                             widget.itemsWithDiscount.comments[i])
              //                     : Text(""),
              //               ),
              //               // Row(
              //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               //   children: [
              //               //     NormalTextWidget(myCommentList[i].userName,
              //               //         kAppColor, kTitleFontSize),
              //               //     NormalTextWidget(
              //               //         Jiffy(myCommentList[i].commentDate).yMMMd,
              //               //         Utils.isDarkMode
              //               //             ? kDarkTextColorColor
              //               //             : kGrayColor,
              //               //         kSmallFontSize),
              //               //   ],
              //               // ),
              //               SizedBox(
              //                 height: h(10),
              //               ),
              //               Text(
              //                 myCommentList[i].userComment,
              //                 overflow: TextOverflow.ellipsis,
              //                 maxLines: 2,
              //                 style: TextStyle(
              //                     color: Utils.isDarkMode
              //                         ? kDarkBlackTextColor
              //                         : kLightBlackTextColor,
              //                     fontSize: kSubTitleFontSize),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //     itemCount: myCommentList.take(2).length,
              //   ),
              // )
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
          witdh: size.width,
          ontap: () {
            context.read<CartBloc>().add(AddItemToCartEvent(
                  count,
                  widget.itemsWithDiscount.id,
                ));
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
          Text(
            "Description :${widget.itemsWithDiscount.descriptionEn}",
            style: TextStyle(
                color: kAppColor,
                fontWeight: FontWeight.w700,
                fontSize: kTitleFontSize),
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
          width: MediaQuery.of(context).size.width / 1.5,
          child: NormalTextWidget(
              widget.itemsWithDiscount.titleEn,
              Utils.isDarkMode ? kDarkBlackTextColor : kLightBlackTextColor,
              kNormalFontSize),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "sold     : ${widget.itemsWithDiscount.discount}",
              style: TextStyle(
                  color: Utils.isDarkMode
                      ? kDarkBlackTextColor
                      : Colors.orange[900],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h(10),
            ),
            Text(
              "Price    : ${widget.itemsWithDiscount.price}",
              style: TextStyle(
                  color: Utils.isDarkMode
                      ? kDarkBlackTextColor
                      : Colors.orange[900],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h(20),
            ),
            Text(
              "Count    : ${count.toString()}",
              style: TextStyle(
                  color: kBlackFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  rating() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                      widget.itemsWithDiscount.ratesAvg.toString(),
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
          // Text(
          //   "optoinal",
          //   style: TextStyle(
          //       color: Utils.isDarkMode ? kDarkTextColorColor : kTextColorColor,
          //       fontSize: kTitleFontSize,
          //       fontWeight: FontWeight.w500),
          // ),
        ],
      ),
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
            Image.asset('assets/images/apple.jpg'),
            // Image.network(widget.itemsWithDiscount.images),
          ],
        ),
      ),
    );
  }

  // void _bottomSheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return SingleChildScrollView(
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 color: Utils.isDarkMode ? kDarkDefaultBgColor : kWhiteColor,
  //                 borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(0.0),
  //                     topRight: Radius.circular(0.0))),
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 2.0),
  //               child: Container(
  //                 child: new Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Padding(padding: EdgeInsets.only(top: 20.0)),
  //                     Padding(
  //                       padding: const EdgeInsets.only(left: 20.0),
  //                       child: Text(
  //                         "description : ${widget.itemsWithDiscount.descriptionEn}",
  //                         style: TextStyle(
  //                             color: kAppColor, fontSize: kTitleFontSize),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
  //                       child: Text(widget.itemsWithDiscount.description,
  //                           style: TextStyle(
  //                               color: Utils.isDarkMode
  //                                   ? kDarkBlackTextColor
  //                                   : kLightBlackTextColor)),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(top: 10.0),
  //                       child: Container(
  //                         height: h(205),
  //                         width: w(650.0),
  //                         child: Padding(
  //                           padding: EdgeInsets.only(top: 20.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: <Widget>[
  //                               Padding(
  //                                 padding: const EdgeInsets.only(left: 20.0),
  //                                 child: Text(
  //                                   ApplicationLocalizations.of(context)
  //                                       .translate("product_detail"),
  //                                   style: TextStyle(
  //                                       color: kAppColor,
  //                                       fontSize: kTitleFontSize),
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(
  //                                     top: 10.0,
  //                                     right: 20.0,
  //                                     bottom: 10.0,
  //                                     left: 20.0),
  //                                 child: Text(
  //                                   widget.itemsWithDiscount.description,
  //                                   style: TextStyle(
  //                                       color: Utils.isDarkMode
  //                                           ? kDarkBlackTextColor
  //                                           : kLightBlackTextColor),
  //                                   textDirection: TextDirection.ltr,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }

  // void _commentBottomSheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return SingleChildScrollView(
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 color:
  //                     Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
  //                 borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(0.0),
  //                     topRight: Radius.circular(0.0))),
  //             child: Padding(
  //                 padding: const EdgeInsets.only(top: 2.0),
  //                 child: SizedBox(
  //                   height: myCommentList.length * 160.0,
  //                   child: ListView.builder(
  //                     physics: NeverScrollableScrollPhysics(),
  //                     itemBuilder: (c, i) {
  //                       return Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: CardWidget(
  //                           height: h(140),
  //                           childWidget: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.symmetric(
  //                                     vertical: 10.0),
  //                                 child: StarDisplay(
  //                                     value: myCommentList[i].range),
  //                               ),
  //                               Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   NormalTextWidget(myCommentList[i].userName,
  //                                       kAppColor, kTitleFontSize),
  //                                   NormalTextWidget(
  //                                       Jiffy(myCommentList[i].commentDate)
  //                                           .yMMMd,
  //                                       Utils.isDarkMode
  //                                           ? kDarkTextColorColor
  //                                           : kGrayColor,
  //                                       kSmallFontSize),
  //                                 ],
  //                               ),
  //                               SizedBox(
  //                                 height: h(10),
  //                               ),
  //                               Text(
  //                                 myCommentList[i].userComment,
  //                                 overflow: TextOverflow.ellipsis,
  //                                 maxLines: 2,
  //                                 style: TextStyle(
  //                                     color: Utils.isDarkMode
  //                                         ? kDarkBlackTextColor
  //                                         : kLightBlackTextColor,
  //                                     fontSize: kSubTitleFontSize),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                     itemCount: myCommentList.length,
  //                   ),
  //                 )),
  //           ),
  //         );
  //       });
  // }

}
