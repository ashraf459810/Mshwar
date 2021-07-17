import 'package:dellyshop/constant.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';

class AddCreditCartBody extends StatefulWidget {
  @override
  _AddCreditCartBodyState createState() => _AddCreditCartBodyState();
}

String cardName = "";
String cardNumber = "";
String expiration = "";

class _AddCreditCartBodyState extends State<AddCreditCartBody> {
  @override
  void initState() {
    
    super.initState();
    cardName = "";
    cardNumber = "";
    expiration = "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/creditCardVisa.png"))),
              child: Center(
                child: Container(
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            ApplicationLocalizations.of(context)
                                .translate("card_number"),
                            style: TextStyle(fontSize: kMicroFontSize)),
                        Text(
                          cardNumber,
                          style: TextStyle(fontSize: kNormalFontSize),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    ApplicationLocalizations.of(context)
                                        .translate("expiration"),
                                    style: TextStyle(fontSize: kMicroFontSize)),
                                Text(expiration,
                                    style:
                                        TextStyle(fontSize: kSubTitleFontSize)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    ApplicationLocalizations.of(context)
                                        .translate("card_name"),
                                    style: TextStyle(fontSize: kMicroFontSize)),
                                Text(cardName,
                                    overflow: TextOverflow.clip,
                                    style:
                                        TextStyle(fontSize: kSubTitleFontSize)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomTextFromField(
              onChanged: (value) {
                setState(
                  () {
                    cardName = value;
                  },
                );
              },
              placeHolder:
                  ApplicationLocalizations.of(context).translate("card_name"),
              icon: Icons.person,
              height: 60.0,
              inputType: TextInputType.text,
              ispassword: false),
          SizedBox(height: 20),
          CustomTextFromField(
              onChanged: (value) {
                setState(
                  () {
                    cardNumber = value;
                  },
                );
              },
              placeHolder:
                  ApplicationLocalizations.of(context).translate("card_number"),
              icon: Icons.credit_card,
              height: 60.0,
              inputType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              ispassword: false),
          SizedBox(height: 20),
          CustomTextFromField(
              onChanged: (value) {
                setState(
                  () {
                    expiration = value;
                  },
                );
              },
              placeHolder:
                  ApplicationLocalizations.of(context).translate("expiration"),
              icon: Icons.access_time,
              height: 60.0,
              inputType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              ispassword: false),
          SizedBox(
            height: 20,
          ),
          ButtonCustom(
            txt: ApplicationLocalizations.of(context).translate("save"),
            ontap: () {
              Navigator.of(context).pop();
            },
            bacgroudColor: kAppColor,
            textColor: kWhiteColor,
          ),
        ],
      ),
    );
  }
}
