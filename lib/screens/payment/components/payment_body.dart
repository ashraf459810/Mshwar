

import 'package:dellyshop/constant.dart';
import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';

class PaymentBody extends StatefulWidget {
  @override
  _PaymentBodyState createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  var select1 = true;
  var select2 = false;
  var select3 = false;
  var select4 = false;

  /// Custom Text
  var _customStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Utils.isDarkMode ? kDarkTextColorColor : kLightBlackTextColor,
      fontSize: kSubTitleFontSize);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Text(
                ApplicationLocalizations.of(context)
                    .translate("choose_your_payment"),
                style: TextStyle(
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w600,
                  fontSize: kLargeFontSize,
                  color: Utils.isDarkMode
                      ? kDarkTextColorColor
                      : kLightBlackTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 60.0)),

              /// For RadioButton if selected or not selected
              GestureDetector(
                onTap: () {
                  setState(() {
                    select1 = true;
                    select2 = false;
                    select3 = false;
                    select4 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: Utils.isDarkMode
                          ? kDarkLightCardColorColor
                          : kCardColorColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: select1 ? kAppColor : Colors.white)
                      ]),
                  child: CardWidget(
                    childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            ApplicationLocalizations.of(context)
                                .translate("cash"),
                            style: _customStyle),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            "assets/images/cash.png",
                            height: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0)),

              GestureDetector(
                onTap: () {
                  setState(() {
                    select1 = false;
                    select2 = true;
                    select3 = false;
                    select4 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: Utils.isDarkMode
                          ? kDarkLightCardColorColor
                          : kCardColorColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: select2 ? kAppColor : Colors.white)
                      ]),
                  child: CardWidget(
                    childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            ApplicationLocalizations.of(context)
                                .translate("credit_card"),
                            style: _customStyle),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            "assets/images/creditCart.png",
                            height: 25.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0)),

              GestureDetector(
                onTap: () {
                  setState(() {
                    select1 = false;
                    select2 = false;
                    select3 = true;
                    select4 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: Utils.isDarkMode
                          ? kDarkLightCardColorColor
                          : kCardColorColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: select3 ? kAppColor : Colors.white)
                      ]),
                  child: CardWidget(
                    childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            ApplicationLocalizations.of(context)
                                .translate("paypal"),
                            style: _customStyle),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            "assets/images/paypal.png",
                            height: 25.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0)),

              GestureDetector(
                onTap: () {
                  setState(() {
                    select1 = false;
                    select2 = false;
                    select3 = false;
                    select4 = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: Utils.isDarkMode
                          ? kDarkLightCardColorColor
                          : kCardColorColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: select4 ? kAppColor : Colors.white)
                      ]),
                  child: CardWidget(
                    childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            ApplicationLocalizations.of(context)
                                .translate("google_wallet"),
                            style: _customStyle),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            "assets/images/googleWallet.png",
                            height: 25.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 60.0)),
              ButtonCustom(
                txt: ApplicationLocalizations.of(context).translate("payment"),
                ontap: () {
                  _showDialog(context);
                
                },
                bacgroudColor: kAppColor,
                textColor: kWhiteColor,
              ),

              /// Button pay
              ///

              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigator() {
    Navigator.of(context)
        .pushReplacementNamed(CustomBottomNavigationBar.routeName);
  }

 

  /// Custom Text Header for Dialog after user succes payment
  var _txtCustomHead = TextStyle(
    color: Utils.isDarkMode ? kDarkTextColorColor : Colors.black54,
    fontSize: kPriceFontSize,
    fontWeight: FontWeight.w600,
  );

  /// Custom Text Description for Dialog after user succes payment
  var _txtCustomSub = TextStyle(
    color: Utils.isDarkMode ? kLightBlackTextColor : Colors.black38,
    fontSize: kSmallFontSize,
    fontWeight: FontWeight.w500,
  );

  _showDialog(BuildContext ctx) {
    showDialog(builder: (context) =>   SimpleDialog(
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 30.0, right: 60.0, left: 60.0),
              child: Icon(
                Icons.check_circle,
                color: kAppColor,
              )),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              ApplicationLocalizations.of(context).translate("success"),
              style: _txtCustomHead,
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 40.0),
            child: Text(
              ApplicationLocalizations.of(context).translate("success_message"),
              style: _txtCustomSub,
            ),
          )),
        ],
      ),
    
      context: ctx,
      barrierDismissible: true,
  
    );
  }
}
