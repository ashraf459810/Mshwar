
import 'package:flutter/material.dart';

//Listh Colors
const kPrimaryColor = Color(0xFFFFFFFF);
const kPrimaryLightColor = Color(0xFFEB793A);
const kWhiteColor = Color(0xFFFFFFFF);
const kButtonColor = Color(0xFF7292E5);
const kLightBlackTextColor = Color(0xFF727272);
const kDefaultBgColor = Color(0xFFFAFAFA);
const kAppColor = Color(0xFFEB793A);
const kGrayColor = Colors.grey;
const kDarkItemColor = Color(0xFF383E47);
const kFacebookColor = Color(0xFF5B7BAF);
const kBlackFontColor = Color(0xFF212832);
const kCardColorColor = Color(0xFFFFFFFF);
const kBottomIconColor = Color(0xFFC6C6C6);
const kTextColorColor = Color(0xFF727272);
const kLightCardColorColor = Color(0xFFFAFAFA);
//DarkColors
const kDarkPrimaryColor = Color(0xFF343434);
const kDarkPrimaryLightColor = Color(0xFF343434);
const kDarkColor = Color(0xFF343434);
const kDarkButtonColor = Color(0xFF7292E5);
const kDarkBlackTextColor = Color(0xFFFFFFFF);
const kDarkDefaultBgColor = Color(0xFF343434);
const kDarkAppColor = Color(0xFFEB793A);
const kDarkGrayColor = Color(0xFF727272);
const kDarkDarkItemColor = Color(0xFF383E47);
const kDarkFacebookColor = Color(0xFF5B7BAF);
const kDarkCardColorColor = kDarkColor;
const kDarkBottomIconColor = Colors.grey;
const kDarkBlackFontColor = kAppColor;
const kDarkTextColorColor = Color(0xFFC6C6C6);
const kDarkLightCardColorColor = Color(0xFF5B5B5B);
const kDarkBLackBgColor = Color(0xFF47495B);

//FontSizes
const kNormalFontSize = 20.0;
const kTitleFontSize = 18.0;
const kSmallFontSize = 15.0;
const kMicroFontSize = 10.0;
const kSubTitleFontSize = 16.0;
const kLargeFontSize = 30.0;
const kPriceFontSize = 25.0;
//
const kiPhoneImg = "assets/images/iphone11.jpeg";
//Strings

const kLoginButton = "Giriş";
const kFaceLoginButton = "Login With Facebook";
const kGoogleLoginButton = "Login With Google";
//
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kLightBlackTextColor),
  );
}
