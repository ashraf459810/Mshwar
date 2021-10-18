import 'dart:collection';

import 'package:dellyshop/Widgets%20copy/Container.dart';
import 'package:dellyshop/Widgets%20copy/Dropdown.dart';
import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/ShopCategories/ShopCategories.dart' as item;

import 'package:dellyshop/screens/App/components/Signup.dart';

import 'package:dellyshop/screens/cart/components/bloc/cart_bloc.dart';

import 'package:dellyshop/util.dart';

import 'package:dellyshop/widgets/carousel_pro.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/normal_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';

import 'package:multi_select_flutter/util/multi_select_item.dart';

class ItemDetailsBody extends StatefulWidget {
  final item.Item datum;
  final bool islogin;
  ItemDetailsBody({Key key, this.datum, this.islogin}) : super(key: key);

  @override
  _ItemDetailsBodyState createState() => _ItemDetailsBodyState();
}

class _ItemDetailsBodyState extends State<ItemDetailsBody> {
  List<int> multiSelectMatrix = [];
  List<int> attributesNumber = [];
  String attributesvalues;

  ScrollController scrollController = ScrollController();
  ScrollController scrollController2 = ScrollController();
  List<dynamic> attributsValus = [];

  int count = 1;
  @override
  void initState() {
    context.read<CartBloc>().add(CartCountEvent());
    initilizeAttributesNumberMatrix();
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
              Container(child: header(context)),
              SizedBox(
                height: h(30),
              ),
              Container(width: w(310), child: colorAndAmount(size)),
              SizedBox(
                height: h(30),
              ),
              listOfAttributes(),
              SizedBox(
                height: h(50),
              ),
              description(size),
              SizedBox(
                height: h(40),
              ),
              widget.islogin
                  ? addToCart(size)
                  : InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Signup(),
                        ));
                      },
                      child: container(
                          hight: h(50),
                          width: w(300),
                          child: Text(
                            "Register first to create your cart",
                            style: TextStyle(fontSize: 16),
                          ),
                          color: Colors.orange[900],
                          borderRadius: 30),
                    ),
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
            attributesvalues = "";
            print(attributesNumber);
            attributesNumber.addAll(multiSelectMatrix);

            attributesNumber =
                LinkedHashSet<int>.from(attributesNumber).toList();
            attributesNumber.remove(-1);
            for (var i = 0; i < attributesNumber.length; i++) {
              // for the reapated numbers

              // this condition for delete the last ,
              if (i == attributesNumber.length - 1) {
                attributesvalues = attributesvalues + "${attributesNumber[i]}";
              } else
                attributesvalues = attributesvalues + "${attributesNumber[i]},";
            }

            print("${attributesvalues} here the attr");

            context.read<CartBloc>().add(AddItemToCartEvent(
                count, widget.datum.id, attributesvalues ?? ""));
            setState(() {
              initilizeAttributesNumberMatrix();
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // SizedBox(
        //   width: w(100),
        // ),

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
          width: MediaQuery.of(context).size.width / 2.3,
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
            Row(
              children: [
                Text(
                  "${widget.datum.price}",
                  style: TextStyle(
                      color: Utils.isDarkMode
                          ? kDarkBlackTextColor
                          : Colors.orange[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(" :"),
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
    );
  }

  Widget multiselectattributesValus(List<dynamic> valus, int i) {
    return Container(
      width: w(50),
      height: h(200),
      child: MultiSelectChipField(
        chipWidth: w(50),
        textStyle: TextStyle(color: Colors.black, fontSize: 15),
        chipColor: Colors.white,
        selectedChipColor: Colors.orange,
        items: valus,
        onTap: (results) {
          multiSelectMatrix = [];
          for (int loop = 0; loop < results.length; loop++) {
            multiSelectMatrix.add(results[loop].id);
          }
          print(multiSelectMatrix);
        },
      ),
    );
  }

  Widget listOfAttributes() {
    return Container(
      height: h(50),
      child: ListView.builder(
        physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        itemCount: widget.datum.attribs.length,
        itemBuilder: (
          context,
          index,
        ) {
          if (widget.datum.attribs[index].multi == 1) {
            print("${attributesNumber} gabs main ");
          }
          return InkWell(
            onTap: () {
              if (widget.datum.attribs[index].multi == 1)
                showButtomSheetForMultiSelect(
                    widget.datum.attribs[index].values
                        .map((value) =>
                            MultiSelectItem<item.Value>(value, value.name))
                        .toList(),
                    index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: widget.datum.attribs[index].multi == 1
                    ? Text(
                        "${widget.datum.attribs[index].name}",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.orange[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    : Container(
                        height: h(50),
                        width: w(100),
                        child: DropDown(
                          list: widget.datum.attribs[index].values,
                          hint: widget.datum.attribs[index].name,
                          getindex: (val) {},
                          onchanged: (val) {
                            attributesNumber[index] = val.id;
                          },
                        ),
                      ),
              ),
            ),
          );
        },
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

  Widget oneSelect(
      item.Attrib list, int index, List<int> selecction, List<int> gabs) {
    return container(
        hight: h(300),
        width: w(300),
        child: ListView.builder(
          controller: scrollController,
          itemCount: 1,
          itemBuilder: (context, indexx) {
            return Column(
              children: [
                container(
                  width: w(100),
                  child: Text(
                    "${list.name}",
                    style: TextStyle(color: Colors.orange[900], fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: h(20),
                ),
                DropDown(
                  list: list.values,
                  hint: ApplicationLocalizations.of(context)
                      .translate("please select"),
                  getindex: (val) {},
                  onchanged: (val) {
                    gabs[index] = val.id;
                    print("${gabs} here the gabs");
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        ));
  }

  void initilizeAttributesNumberMatrix() {
    attributesNumber = [];
    for (var i = 0; i < widget.datum.attribs.length; i++) {
      if (widget.datum.attribs[i].multi == 0) {
        attributesNumber.add(-1);
      } else {
        attributesNumber.add(-1);
      }
    }
  }

  void showButtomSheetForMultiSelect(List<dynamic> values, int i) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return multiselectattributesValus(values, i);
        });
  }
}
