import 'package:dellyshop/constant.dart';
import 'package:dellyshop/screens/splash/splash_screen.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class AppIntroScreen extends StatefulWidget {
  static const routeName = "app_intro_screen";
  @override
  _AppIntroScreenState createState() => _AppIntroScreenState();
}

class _AppIntroScreenState extends State<AppIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      [page, page1, page2],
      onTapDoneButton: () {
        Navigator.of(context).pushReplacementNamed(SplashScreen.routeName);
      },
      showSkipButton: true,
      pageButtonTextStyles: new TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }

  var page = new PageViewModel(
    pageColor: kAppColor,
    iconColor: null,
    bubbleBackgroundColor: Colors.white,
    body: Text(
      'Choose from thousands of products!',
    ),
    title:
        NormalTextWidget('Thousands of Products!', kWhiteColor, kPriceFontSize),
    mainImage: Image.asset(
      'assets/images/select_prod.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    bodyTextStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
  );
  var page1 = new PageViewModel(
    pageColor: Colors.teal,
    iconColor: null,
    bubbleBackgroundColor: Colors.white,
    body: Text(
      'Review the products you selected in the basket!',
    ),
    title: NormalTextWidget('Check Products!', kWhiteColor, kPriceFontSize),
    mainImage: Image.asset(
      'assets/images/check_prod.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    bodyTextStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
  );
  var page2 = new PageViewModel(
    pageColor: Colors.green,
    iconColor: null,
    bubbleBackgroundColor: Colors.white,
    body: Text(
      'Order the products you want now!',
    ),
    title:
        NormalTextWidget('Complete Your Order!', kWhiteColor, kPriceFontSize),
    mainImage: Image.asset(
      'assets/images/pay.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    bodyTextStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
  );
}
