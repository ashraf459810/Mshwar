import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';

import 'package:flutter/material.dart';

import '../../../util.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
