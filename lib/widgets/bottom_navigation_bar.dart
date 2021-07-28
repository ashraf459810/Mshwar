import 'package:dellyshop/constant.dart';

import 'package:dellyshop/screens/cart/components/cart_screen.dart';
import 'package:dellyshop/screens/home/home_screen.dart';
import 'package:dellyshop/screens/progfile/porile_screen.dart';

import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../util.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  static const String routeName = "/bottom_nav_bar";
  @override
  _customBottomNavigationBarState createState() =>
      _customBottomNavigationBarState();
}

class _customBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new HomeScreen();
      case 1:
        return new CartScreen();
      case 2:
        return new ProfileScreen();
        break;
      default:
        return HomeScreen();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(currentIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor:
                Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.black26.withOpacity(0.15)))),
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: kAppColor),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          fixedColor: Color(0xFF6991C7),
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: kAppColor,
              ),
              icon: Icon(
                Icons.home,
                size: 23.0,
                color:
                    Utils.isDarkMode ? kDarkBottomIconColor : kBottomIconColor,
              ),
              // ignore: deprecated_member_use
              title: Text(
                ApplicationLocalizations.of(context).translate("home"),
                style: TextStyle(
                  fontSize: kSmallFontSize,
                  letterSpacing: 0.5,
                  color: this.currentIndex == 0
                      ? kAppColor
                      : Colors.grey.withOpacity(0.4),
                ),
              ),
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: kAppColor,
                ),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Utils.isDarkMode
                      ? kDarkBottomIconColor
                      : kBottomIconColor,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  ApplicationLocalizations.of(context).translate("cart"),
                  style: TextStyle(
                    fontSize: kSmallFontSize,
                    letterSpacing: 0.5,
                    color: this.currentIndex == 1
                        ? kAppColor
                        : Colors.grey.withOpacity(0.4),
                  ),
                )),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: kAppColor,
              ),
              icon: Icon(
                Icons.person,
                size: 24.0,
                color:
                    Utils.isDarkMode ? kDarkBottomIconColor : kBottomIconColor,
              ),
              // ignore: deprecated_member_use
              title: Text(
                ApplicationLocalizations.of(context).translate("profile"),
                style: TextStyle(
                  fontSize: kSmallFontSize,
                  letterSpacing: 0.5,
                  color: this.currentIndex == 2
                      ? kAppColor
                      : Colors.grey.withOpacity(0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
