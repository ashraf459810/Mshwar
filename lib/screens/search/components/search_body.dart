import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/product_item_model.dart';

import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:flutter/material.dart';

import '../../../util.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    List<String> keys = [
      ApplicationLocalizations.of(context).translate("iphonex"),
      ApplicationLocalizations.of(context).translate("iphone11"),
      ApplicationLocalizations.of(context).translate("books"),
      ApplicationLocalizations.of(context).translate("macbooks"),
      ApplicationLocalizations.of(context).translate("apple"),
      ApplicationLocalizations.of(context).translate("samsung"),
      ApplicationLocalizations.of(context).translate("cannon"),
      ApplicationLocalizations.of(context).translate("navada"),
      ApplicationLocalizations.of(context).translate("watch"),
      ApplicationLocalizations.of(context).translate("note_nine"),
      ApplicationLocalizations.of(context).translate("pc"),
    ];
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, right: 10.0, left: 10.0, bottom: 20.0),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                  color: Utils.isDarkMode
                      ? kDarkLightCardColorColor
                      : kCardColorColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15.0,
                        spreadRadius: 0.0)
                  ]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Theme(
                    data: ThemeData(hintColor: Colors.transparent),
                    child: TextFormField(
                      style: TextStyle(
                          color: Utils.isDarkMode
                              ? kDarkTextColorColor
                              : kLightBlackTextColor),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: kAppColor,
                            size: 28.0,
                          ),
                          hintText: ApplicationLocalizations.of(context)
                              .translate("search"),
                          hintStyle: TextStyle(
                              color: Utils.isDarkMode
                                  ? kDarkTextColorColor
                                  : kTextColorColor,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              ApplicationLocalizations.of(context)
                  .translate("popular_keywords"),
              style: TextStyle(color: kGrayColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              child: GridView.count(
                childAspectRatio: (0.3),
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                children: keys.map(
                  (value) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, top: 5.0, bottom: 5.0),
                      child: CardWidget(
                        childWidget: Center(
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Utils.isDarkMode
                                    ? kAppColor
                                    : kTextColorColor),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              ApplicationLocalizations.of(context).translate("favorite_items"),
              style: TextStyle(color: kGrayColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (140 / Utils.GridHeight()),
              controller: new ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: newestLit.take(3).map(
                (value) {
                  return Hero(
                    tag: "hero-Item-${value.id}",
                    child: Material(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(value)));
                        },
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
