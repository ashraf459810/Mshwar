import 'package:dellyshop/Core/Consts.dart';
import 'package:dellyshop/Widgets%20copy/Container.dart';
import 'package:dellyshop/Widgets%20copy/Text.dart';
import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/CategoyShopsModel/CategoryShopsModel.dart'
    as s;

import 'package:dellyshop/models/ShopCategories/ShopCategories.dart';
import 'package:dellyshop/screens/ItemDetails/ItemDetails.dart';

import 'package:dellyshop/screens/ShopItems/bloc/shopitems_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../util.dart';

class ShopItems extends StatefulWidget {
  final s.Shop shop;
  final int shopid;
  final String shopimage;
  final shopname;

  ShopItems({Key key, this.shopid, this.shopimage, this.shopname, this.shop})
      : super(key: key);

  @override
  _ShopItemsState createState() => _ShopItemsState();
}

class _ShopItemsState extends State<ShopItems> {
  List<int> indexs = [];
  AutoScrollController controller;
  int pages = 0;
  int ssize = 12;
  List<Item> items = [];
  List<ShopCategory> shopcategoreies = [];

  /// Custom text for bottomSheet
  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /// Hero animation for image
    return BlocProvider(
      create: (context) =>
          ShopitemsBloc()..add(GetItemsEvent(widget.shopid, pages, ssize)),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              height: h(20),
            ),
            Row(
              children: [
                Text(
                  "Products",
                  style: TextStyle(fontSize: 30, color: Colors.orange[900]),
                ),
              ],
            ),
            SizedBox(
              width: w(200),
            ),
          ],
        ),
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width,
                  child: Stack(
                    children: [
                      Image.network(widget.shopimage,
                          fit: BoxFit.fitWidth, width: size.width),
                      Positioned(
                        left: 10,
                        top: 20,
                        child: container(
                          color: AppColor.gradient3,
                          borderRadius: 30,
                          hight: h(30),
                          width: w(40),
                          child: Center(
                            child: Text(
                              widget.shop.active.toString() == "1"
                                  ? ApplicationLocalizations.of(context)
                                      .translate("open")
                                  : ApplicationLocalizations.of(context)
                                      .translate("closed"),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 55,
                        child: Text(
                          widget.shop.workingTime
                              .split(widget.shop.workingTime.split("-").first)
                              .last
                              .substring(1),
                          style: TextStyle(color: Colors.orange[900]),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: h(40),
                  child: Text(
                    "from ${widget.shop.workingTime.toString().split(",").first} to ${widget.shop.workingTime.toString().split(",").first} ",
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                ),
                BlocBuilder<ShopitemsBloc, ShopitemsState>(
                    builder: (context, state) {
                  if (state is Loading) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        ),
                      ),
                    );
                  }
                  if (state is Error) {
                    return Center(
                        child: Text(
                      state.error,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ));
                  }
                  if (state is GetItemsState) {
                    shopcategoreies = state.shopItem;
                    items = totalcount(state.shopItem, indexs);
                    print(indexs);
                  }

                  return items.isNotEmpty
                      ? Container(
                          child: Column(children: [
                          SizedBox(
                            height: h(10),
                          ),
                          Container(
                              height: h(30),
                              child: ListView.builder(
                                itemCount: shopcategoreies.length,
                                physics: ScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    int theindex = chosenindex(index);
                                    print(theindex);
                                    scrollToIndex(theindex);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: container(
                                        hight: h(100),
                                        width: w(120),
                                        borderRadius: 5,
                                        color: kAppColor,
                                        child: Center(
                                          child: text(
                                              color: Colors.white,
                                              text: ApplicationLocalizations.of(
                                                              context)
                                                          .appLocale
                                                          .languageCode ==
                                                      "en"
                                                  ? "${shopcategoreies[index].titleEn}"
                                                  : "${shopcategoreies[index].title}",
                                              fontsize: 12,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: h(20),
                          ),
                          Container(
                            height: h(600),
                            width: w(340),
                            child: ListView.builder(
                                physics: ScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                scrollDirection: Axis.vertical,
                                controller: controller,
                                itemCount: items.length,
                                // ignore: missing_return
                                itemBuilder: (BuildContext ctx, index) {
                                  return AutoScrollTag(
                                      key: ValueKey(index),
                                      controller: controller,
                                      index: index,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => ItemDetails(
                                              datum: items[index],
                                            ),
                                          ));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: container(
                                            borderRadius: 16,
                                            hight: h(120),
                                            width: w(180),
                                            bordercolor: kAppColor,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: Container(
                                                      height: h(100),
                                                      width: w(120),
                                                      color: Colors.grey,
                                                      child: Image.network(
                                                        "${items[index].images.toString().split(",").first}",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: w(40),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    // SizedBox(
                                                    //   height: h(10),
                                                    // ),
                                                    text(
                                                        text: ApplicationLocalizations.of(
                                                                        context)
                                                                    .appLocale
                                                                    .languageCode ==
                                                                "en"
                                                            ? "${items[index].titleEn},"
                                                            : "${items[index].title},",
                                                        color:
                                                            Colors.grey[900]),
                                                    Container(
                                                        constraints:
                                                            BoxConstraints(
                                                                maxWidth:
                                                                    w(150),
                                                                minHeight:
                                                                    h(10),
                                                                maxHeight:
                                                                    h(30)),
                                                        child: text(
                                                            text: ApplicationLocalizations.of(
                                                                            context)
                                                                        .appLocale
                                                                        .languageCode ==
                                                                    "en"
                                                                ? "${items[index].descriptionEn},"
                                                                : "${items[index].description},",
                                                            color: Colors
                                                                .grey[900])),
                                                    Row(
                                                      children: [
                                                        text(
                                                          text: ApplicationLocalizations
                                                                  .of(context)
                                                              .translate(
                                                                  "Price"),
                                                          color: Colors
                                                              .orange[900],
                                                        ),
                                                        Text(" : "),
                                                        Text(
                                                          "${items[index].price}",
                                                          style: TextStyle(
                                                              color: kAppColor,
                                                              fontSize: 17.0,
                                                              fontFamily:
                                                                  "Popins",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                }),
                          )
                        ]))
                      : Container(
                          height: h(400),
                          child: Center(
                            child: Text(
                              "No products found in this store",
                              style: TextStyle(color: Colors.orange[900]),
                            ),
                          ),
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Item> totalcount(List<ShopCategory> list, List<int> indexs) {
    List<Item> items = [];

    for (var i = 0; i < list.length; i++) {
      items.addAll(list[i].items);
      indexs.add(list[i].items.length);
    }
    return items;
  }

  int chosenindex(int index) {
    int wantedindex = 0;

    for (var i = 0; i < index; i++) {
      wantedindex = index + indexs[i];
    }

    return wantedindex;
  }

  Future scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(10);
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
