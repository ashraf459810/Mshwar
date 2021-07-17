
import 'package:dellyshop/app_localizations.dart';

import 'package:dellyshop/screens/add_credit_card/add_credit_cart_screen.dart';
import 'package:dellyshop/screens/payment/payment_screen.dart';
import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/card_widget.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';

import 'package:dellyshop/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'carousel_slider.dart';

class SelectCreditCardBody extends StatefulWidget {
  @override
  _SelectCreditCardBodyState createState() => _SelectCreditCardBodyState();
}

class _SelectCreditCardBodyState extends State<SelectCreditCardBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          CustomCarouselSlider(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomTextFromField(
                    placeHolder: "Cvv",
                    icon: Icons.credit_card,
                    height: 60.0,
                    inputType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    ispassword: false),
              ),
              SizedBox(width: 20),
              CardWidget(
                childWidget: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AddCreditCardScreen.routeName);
                  },
                  child: Row(
                    children: [
                      TextWidget(
                          ApplicationLocalizations.of(context)
                              .translate("add_credit_card"),
                          Utils.isDarkMode
                              ? kDarkTextColorColor
                              : kLightBlackTextColor),
                      Icon(
                        Icons.add,
                        color: kAppColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ButtonCustom(
            txt: ApplicationLocalizations.of(context).translate("choose_pay"),
            ontap: () {
              Navigator.of(context).pushNamed(PaymentScreen.routeName);
            },
            bacgroudColor: kAppColor,
            textColor: kWhiteColor,
          ),
          Center(
            child: Image.asset(
              "assets/images/payment_img.png",
              fit: BoxFit.fitWidth,
              height: 250,
              width: 250,
            ),
          )
        ],
      ),
    );
  }
}
