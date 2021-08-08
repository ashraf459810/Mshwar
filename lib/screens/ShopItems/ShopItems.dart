import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/ShopItem.dart';
import 'package:dellyshop/screens/ItemDetails/ItemDetails.dart';
import 'package:dellyshop/screens/ShopItems/bloc/shopitems_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_localizations.dart';
import '../../util.dart';

class ShopItems extends StatefulWidget {
  final int shopid;
  final String shopimage;
  final shopname;

  ShopItems({Key key, this.shopid, this.shopimage, this.shopname})
      : super(key: key);

  @override
  _ShopItemsState createState() => _ShopItemsState();
}

class _ShopItemsState extends State<ShopItems> {
  ScrollController controller = ScrollController();
  int pages = 0;
  int ssize = 12;
  List<Datum> items = [];
  final _fontCostumSheetBotomHeader = TextStyle(
      color: Utils.isDarkMode ? kDarkTextColorColor : kLightBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: kSubTitleFontSize);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  /// Custom text for bottomSheet
  final _fontCostumSheetBotom = TextStyle(
      color: Utils.isDarkMode ? kDarkBlackTextColor : Colors.black45,
      fontWeight: FontWeight.w400,
      fontSize: kSubTitleFontSize);

  /// Create Modal BottomSheet (SortBy)
  void modalBottomSheetSort() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 340.0,
              color: Utils.isDarkMode ? kDarkDefaultBgColor : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                      ApplicationLocalizations.of(context).translate("sort_by"),
                      style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        ApplicationLocalizations.of(context)
                            .translate("popularity"),
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context).translate("new"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context).translate("discount"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context).translate("high_low"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context).translate("low_high"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                ],
              ),
            ),
          );
        });
  }

  /// Create Modal BottomSheet (RefineBy)
  void modalBottomSheetRefine() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 340.0,
              color: Utils.isDarkMode ? kDarkDefaultBgColor : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                      ApplicationLocalizations.of(context)
                          .translate("refine_by"),
                      style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        ApplicationLocalizations.of(context)
                            .translate("popularity"),
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context).translate("new"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context).translate("discount"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context).translate("high_low"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context).translate("low_high"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        key: _key,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: h(10),
              ),
              BlocBuilder<ShopitemsBloc, ShopitemsState>(
                  builder: (context, state) {
                // if (state is Loading) {
                //   return Container(
                //     child: Center(
                //       child: CircularProgressIndicator(
                //         color: Colors.orange,
                //       ),
                //     ),
                //   );
                // }
                if (state is Error) {
                  return Center(
                      child: Text(
                    state.error,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ));
                }
                if (state is GetItemsState) {
                  items = state.shopItem;
                }
                return NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification &&
                          controller.position.extentAfter == 0) {
                        print("here from listener");
                        pages++;
                        print(pages);
                        context
                            .read<ShopitemsBloc>()
                            .add(GetItemsEvent(widget.shopid, pages, ssize));
                      }

                      return false;
                    },
                    child: Container(
                      height: h(650),
                      child: GridView.builder(
                          physics: ScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          controller: controller,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 3.8,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: items.length,
                          // ignore: missing_return
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ItemDetails(
                                      datum: items[index],
                                    ),
                                  ));
                                },
                                child: Card(
                                  child: Container(
                                    color: Colors.white,
                                    height: h(150),
                                    width: w(200),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: h(150),
                                            width: w(200),
                                            child: Image.network(
                                              "${items[index].images}",
                                              fit: BoxFit.cover,
                                            )),
                                        SizedBox(
                                          height: h(10),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "${items[index].titleEn}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: h(10),
                                            ),
                                            Text(
                                              "Price : ${items[index].price}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
