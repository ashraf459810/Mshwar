import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';

import 'package:dellyshop/screens/search/search_screen.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:flutter/material.dart';


import '../../util.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home_screen";
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: SafeArea(
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor:
                  Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
              centerTitle: false,
              title: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mshwar",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: kAppColor,
                              fontWeight: FontWeight.w600,
                              fontSize: kLargeFontSize),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0,bottom: 1),
                          // child: Text(
                          //   ApplicationLocalizations.of(context)
                          //       .translate("delly_shop_desc"),
                          //   textAlign: TextAlign.start,
                          //   style: TextStyle(
                          //       color: kLightBlackTextColor,
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: kMicroFontSize),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(preferredSize: Size.fromHeight(30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SearchScreen.routeName);
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        shape: BoxShape.rectangle),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black38,
                          ),
                        ),
                        NormalTextWidget(
                            ApplicationLocalizations.of(context)
                                .translate("search"),
                            Utils.isDarkMode
                                ? kDarkTextColorColor
                                : kLightBlackTextColor,
                            kSmallFontSize)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: HomeBody());
  }
}
