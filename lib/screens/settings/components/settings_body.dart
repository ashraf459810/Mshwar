import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/address_model.dart';
import 'package:dellyshop/models/language.dart';
import 'package:dellyshop/screens/add_adress/components/DeliverLocation.dart';
import 'package:dellyshop/screens/edit_address/edit_address_screen.dart';

import 'package:dellyshop/screens/splash/splash_screen.dart';
import 'package:dellyshop/widgets/app_builder.dart';

import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../util.dart';

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  static var _txtCustomHead = TextStyle(
    color: Colors.redAccent,
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            setting(
              head: ApplicationLocalizations.of(context).translate("account"),
              sub1: ApplicationLocalizations.of(context).translate("addresses"),
              sub2: ApplicationLocalizations.of(context).translate("telephone"),
              sub3: ApplicationLocalizations.of(context).translate("email"),
              sub1Tap: () {
                addressBottomSheet();
              },
              sub2Tap: () {
                telephoneBottomSheet();
              },
              sub3Tap: () {
                emailBottomSheet();
              },
            ),
            setting(
              head: ApplicationLocalizations.of(context).translate("settings"),
              sub1: ApplicationLocalizations.of(context)
                  .translate("notifications"),
              sub2: ApplicationLocalizations.of(context).translate("dark_mode"),
              sub3: ApplicationLocalizations.of(context).translate("languages"),
              sub1Tap: () {
                notificationBottomSheet();
              },
              sub2Tap: () {
                darkModeBottomSheet();
              },
              sub3Tap: () {
                languageBottomSheet();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Utils.isDarkMode
                              ? kDarkDefaultBgColor
                              : kDefaultBgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0)), //this right here
                          child: Container(
                            height: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                NormalTextWidget(
                                    ApplicationLocalizations.of(context)
                                        .translate("log_out_message"),
                                    Utils.isDarkMode
                                        ? kDarkBlackTextColor
                                        : kTextColorColor,
                                    kTitleFontSize),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ButtonCustom(
                                        txt:
                                            ApplicationLocalizations.of(context)
                                                .translate("cancel"),
                                        ontap: () {
                                          Navigator.of(context).pop();
                                        },
                                        witdh: 100,
                                        height: 40,
                                        borderColor: kAppColor,
                                        bacgroudColor: kAppColor,
                                        textColor: kWhiteColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ButtonCustom(
                                        txt:
                                            ApplicationLocalizations.of(context)
                                                .translate("logout"),
                                        ontap: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  SplashScreen.routeName);
                                        },
                                        witdh: 100,
                                        height: 40,
                                        borderColor: Colors.redAccent,
                                        bacgroudColor: Colors.redAccent,
                                        textColor: kWhiteColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  color:
                      Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 13.0, left: 20.0, bottom: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ApplicationLocalizations.of(context)
                              .translate("logout"),
                          style: _txtCustomHead,
                        ),
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.redAccent,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void languageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 500,
            child: Container(
              height: 240,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ApplicationLocalizations.of(context).appLocale =
                              new Locale(languages[index].lanCode,
                                  languages[index].lanCountry);
                          ApplicationLocalizations.of(context).load();
                          Utils.appLocale = new Locale(languages[index].lanCode,
                              languages[index].lanCountry);
                          AppBuilder.of(context).rebuild();
                          Navigator.pop(context);
                        });
                      },
                      child: CardWidget(
                        childWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalTextWidget(
                                languages[index].langName,
                                Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor,
                                kTitleFontSize),
                            Text(
                              languages[index].emoji,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: languages.length,
              ),
            ),
          );
        });
  }

  void addressBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 300,
            child: Column(
              children: [
                Container(
                  height: 240,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardWidget(
                          childWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NormalTextWidget(
                                  addressList[index].addressName,
                                  Utils.isDarkMode
                                      ? kDarkTextColorColor
                                      : kLightBlackTextColor,
                                  kTitleFontSize),
                              ButtonCustom(
                                txt: ApplicationLocalizations.of(context)
                                    .translate("edit"),
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditAddressScreen(
                                                  addressList[index])));
                                },
                                witdh: 100,
                                height: 40,
                                borderColor: kAppColor,
                                bacgroudColor: kAppColor,
                                textColor: kWhiteColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: addressList.length,
                  ),
                ),
                ButtonCustom(
                  txt: ApplicationLocalizations.of(context)
                      .translate("add_address"),
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DelieverLocation(),
                    ));
                  },
                  witdh: 100,
                  height: 40,
                  borderColor: kAppColor,
                  bacgroudColor: kAppColor,
                  textColor: kWhiteColor,
                ),
              ],
            ),
          );
        });
  }

  void telephoneBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 130,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: CustomTextFromField(
                      icon: Icons.phone,
                      ispassword: false,
                      placeHolder: "+09 123 123 12 12",
                      inputType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                ButtonCustom(
                  txt: ApplicationLocalizations.of(context).translate("save"),
                  ontap: () {
                    Navigator.of(context).pop();
                  },
                  witdh: 100,
                  height: 40,
                  borderColor: kAppColor,
                  bacgroudColor: kAppColor,
                  textColor: kWhiteColor,
                ),
              ],
            ),
          );
        });
  }

  void emailBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 130,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: CustomTextFromField(
                      icon: Icons.email,
                      ispassword: false,
                      placeHolder: "xamappdesign@gmail.com",
                      inputType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                ButtonCustom(
                  txt: ApplicationLocalizations.of(context).translate("save"),
                  ontap: () {
                    Navigator.of(context).pop();
                  },
                  witdh: 100,
                  height: 40,
                  borderColor: kAppColor,
                  bacgroudColor: kAppColor,
                  textColor: kWhiteColor,
                ),
              ],
            ),
          );
        });
  }

  void notificationBottomSheet() {
    bool _switchValue = false;
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 180,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CardWidget(
                        childWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalTextWidget(
                                ApplicationLocalizations.of(context)
                                    .translate("order_notif"),
                                Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor,
                                kSubTitleFontSize),
                            BottomSheetSwitch(
                              switchValue: _switchValue,
                              valueChanged: (value) {
                                _switchValue = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardWidget(
                        childWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalTextWidget(
                                ApplicationLocalizations.of(context)
                                    .translate("discount_notif"),
                                Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor,
                                kSubTitleFontSize),
                            BottomSheetSwitch(
                              switchValue: _switchValue,
                              valueChanged: (value) {
                                _switchValue = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void darkModeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CardWidget(
                        childWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalTextWidget(
                                ApplicationLocalizations.of(context)
                                    .translate("dark_mode"),
                                Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor,
                                kSubTitleFontSize),
                            BottomSheetSwitch(
                              switchValue: Utils.isDarkMode,
                              valueChanged: (value) {
                                Utils.isDarkMode = value;
                                Navigator.of(context).pop();
                                AppBuilder.of(context).rebuild();
                                //CustomBottomNavigationBar.routeName);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

class BottomSheetSwitch extends StatefulWidget {
  BottomSheetSwitch({@required this.switchValue, @required this.valueChanged});

  final bool switchValue;
  final ValueChanged valueChanged;

  @override
  _BottomSheetSwitch createState() => _BottomSheetSwitch();
}

class _BottomSheetSwitch extends State<BottomSheetSwitch> {
  bool _switchValue;

  @override
  void initState() {
    _switchValue = widget.switchValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
          inactiveTrackColor: Colors.redAccent.withOpacity(0.5),
          inactiveThumbColor: kAppColor,
          activeTrackColor: Colors.green.withOpacity(0.5),
          activeColor: kAppColor,
          value: _switchValue,
          onChanged: (bool value) {
            setState(() {
              _switchValue = value;
              widget.valueChanged(value);
            });
          }),
    );
  }
}

class DarkModeBottomSheet extends StatefulWidget {
  DarkModeBottomSheet(
      {@required this.switchValue, @required this.valueChanged});

  final bool switchValue;
  final ValueChanged valueChanged;
  @override
  _DarkModeBottomSheetState createState() => _DarkModeBottomSheetState();
}

class _DarkModeBottomSheetState extends State<DarkModeBottomSheet> {
  bool _switchValue;
  @override
  void initState() {
    _switchValue = widget.switchValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
          inactiveTrackColor: Colors.redAccent.withOpacity(0.5),
          inactiveThumbColor: kAppColor,
          activeTrackColor: Colors.green.withOpacity(0.5),
          activeColor: kAppColor,
          value: _switchValue,
          onChanged: (bool value) {
            setState(() {
              _switchValue = value;
              widget.valueChanged(value);
            });
          }),
    );
  }
}

// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
class setting extends StatelessWidget {
  static var _txtCustomHead = TextStyle(
    color: kAppColor,
    fontSize: kTitleFontSize,
    fontWeight: FontWeight.w600,
  );

  String head, sub1, sub2, sub3;
  GestureTapCallback sub1Tap;
  GestureTapCallback sub2Tap;
  GestureTapCallback sub3Tap;
  setting(
      {this.head,
      this.sub1,
      this.sub2,
      this.sub3,
      this.sub1Tap,
      this.sub2Tap,
      this.sub3Tap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, top: 15.0),
              child: Text(
                head,
                style: _txtCustomHead,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Divider(
                color: Utils.isDarkMode
                    ? kDarkLightCardColorColor
                    : Colors.black12,
                height: 0.5,
              ),
            ),
            GestureDetector(
              onTap: sub1Tap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardWidget(
                  childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sub1,
                          style: TextStyle(
                            color: Utils.isDarkMode
                                ? kDarkTextColorColor
                                : kLightBlackTextColor,
                            fontSize: kSubTitleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Utils.textisRTL(context)
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                          color: Utils.isDarkMode
                              ? kDarkTextColorColor
                              : Colors.black38,
                        )
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: Utils.isDarkMode
                    ? kDarkLightCardColorColor
                    : Colors.black12,
                height: 0.5,
              ),
            ),
            GestureDetector(
              onTap: sub2Tap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardWidget(
                  childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sub2,
                          style: TextStyle(
                            color: Utils.isDarkMode
                                ? kDarkTextColorColor
                                : kLightBlackTextColor,
                            fontSize: kSubTitleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Utils.textisRTL(context)
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                          color: Utils.isDarkMode
                              ? kDarkTextColorColor
                              : Colors.black38,
                        )
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: Utils.isDarkMode
                    ? kDarkLightCardColorColor
                    : Colors.black12,
                height: 0.5,
              ),
            ),
            GestureDetector(
              onTap: sub3Tap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardWidget(
                  childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Language",
                          style: TextStyle(
                            color: Utils.isDarkMode
                                ? kDarkTextColorColor
                                : kLightBlackTextColor,
                            fontSize: kSubTitleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Utils.textisRTL(context)
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                          color: Utils.isDarkMode
                              ? kDarkTextColorColor
                              : Colors.black38,
                        )
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: Utils.isDarkMode
                    ? kDarkLightCardColorColor
                    : Colors.black12,
                height: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
