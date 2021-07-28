import 'dart:ui';

import 'package:dellyshop/constant.dart';
import 'package:dellyshop/screens/cart/components/bloc/cart_bloc.dart';
import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import '../../../app_localizations.dart';

class PaymentBody extends StatefulWidget {
  final int addressid;
  PaymentBody([this.addressid]);
  @override
  _PaymentBodyState createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  var select1 = true;
  var select2 = false;

  /// Custom Text
  var _customStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Utils.isDarkMode ? kDarkTextColorColor : kLightBlackTextColor,
      fontSize: kSubTitleFontSize);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: h(70),
                  ),
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
                              'Visa on Delivery',
                              style: TextStyle(
                                  color: kTextColorColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
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

                  Padding(padding: EdgeInsets.only(top: 15.0)),

                  Padding(padding: EdgeInsets.only(top: 60.0)),
                  BlocListener<CartBloc, CartState>(
                    listener: (context, state) {
                      if (state is Loading) {
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.orange,
                        ));
                      }
                      if (state is Error) {
                        return Center(
                          child: Text(
                            state.error,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }
                      if (state is PlaceOrderState) {
                        Toast.show('Order Places Successfully', context,
                            duration: Toast.LENGTH_LONG,
                            backgroundColor: Colors.orange[900],
                            gravity: Toast.TOP);
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustomBottomNavigationBar(),
                      ));
                    },
                    child: Builder(
                      builder: (context) => ButtonCustom(
                        txt: 'Place Order',
                        ontap: () {
                          context
                              .read<CartBloc>()
                              .add(PlaceOrderEvent(widget.addressid, select1));
                        },
                        bacgroudColor: kAppColor,
                        textColor: kWhiteColor,
                      ),
                    ),
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
        ),
      ),
    );
  }

  void navigator() {
    Navigator.of(context)
        .pushReplacementNamed(CustomBottomNavigationBar.routeName);
  }

  /// Custom Text Header for Dialog after user succes payment

}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
