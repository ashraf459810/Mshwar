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
    final hero = Hero(
      tag: 'hero-tag-${widget.shopid}',
      child: Material(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://image.shutterstock.com/z/stock-photo-sunset-at-coast-of-the-lake-nature-landscape-nature-in-northern-europe-reflection-blue-sky-and-1960131820.jpg"),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Container(
            margin: EdgeInsets.only(top: 130.0),
            decoration: BoxDecoration(),
          ),
        ),
      ),
    );
    return BlocProvider(
      create: (context) => ShopitemsBloc()..add(GetItemsEvent(widget.shopid)),
      child: Scaffold(
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        key: _key,
        body: BlocBuilder<ShopitemsBloc, ShopitemsState>(
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
            items = state.shopItem.items.data;
          }
          return CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: <Widget>[
              /// Appbar Custom using a SliverAppBar
              SliverAppBar(
                centerTitle: true,
                backgroundColor:
                    Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
                iconTheme: IconThemeData(color: kAppColor),
                expandedHeight: h(300),
                elevation: 0.1,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      widget.shopname,
                      style: TextStyle(
                          color: kAppColor,
                          fontSize: 17.0,
                          fontFamily: "Popins",
                          fontWeight: FontWeight.w700),
                    ),
                    background: Material(
                      child: hero,
                    )),
              ),

              /// Container for description to Sort and Refine
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
                          child: Container(
                            height: h(79),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, left: 20.0, right: 20.0),
                                  child: Text(
                                    "shop1 provide  the best goods for you ...",
                                    style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 18),
                                    // ApplicationLocalizations.of(context)
                                    //     .translate("lorem"),
                                    // style: TextStyle(
                                    //     fontWeight: FontWeight.w400,
                                    //     fontSize: 15.0,
                                    //     color: Utils.isDarkMode
                                    //         ? kDarkTextColorColor
                                    //         : Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Create Grid Item
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ItemDetails(
                              datum: items[index],
                            ),
                          ));
                        },
                        child: Container(
                          color: Colors.white,
                          height: h(150),
                          width: w(200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: h(200),
                                  width: w(200),
                                  child: Image.network(
                                    "${items[index].images}",
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                height: h(10),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "${items[index].titleEn}",
                                    style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: h(10),
                                  ),
                                  Text(
                                    "Price  :${items[index].price}",
                                    style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  // Text(
                                  //   items[index].discount.toString(),
                                  //   style: TextStyle(
                                  //       color: Colors.orange[900],
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w800),
                                  // ),
                                ],
                              )
                            ],
                          ),
                        ));
                  },
                  childCount: items.length,
                ),

                /// Setting Size for Grid Item
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250.0,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 9.0,
                  childAspectRatio: 3 / 3.5,
                ),
              ),
            ],
          );
        }),
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
