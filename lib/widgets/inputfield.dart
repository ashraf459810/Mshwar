import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regexpattern/regexpattern.dart';

class ReusableWidget {
  Widget container(TextEditingController editingController, String inputtext,
      String label, String type,
      [double height]) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: ScreenUtil().setWidth(25.1),
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(3),
        ),
        Container(
          height: height == null ? ScreenUtil().setHeight(47) : height,
          width: ScreenUtil().setWidth(327),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: TextFormField(
            obscureText: type == "password" ? true : false,
            validator: type == "name"
                ? (value) => value.isEmpty
                    ? 'Enter Your Name'
                    : !RegexValidation.hasMatch(
                            value, RegexPattern.alphabetOnly)
                        ? "Enter a valid name"
                        : null
                : type == "email"
                    ? (value) {
                        if (value.isEmpty) {
                          return 'Enter Your Email';
                        }

                        bool emailValid = EmailValidator.validate(value);
                        print(emailValid);
                        if (emailValid == true) {
                          return null;
                        } else {
                          return "Enter a valid email";
                        }
                      }
                    : type == "password"
                        ? (value) {
                            if (value.isEmpty) {
                              return "enter your password";
                            }
                            String pattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                            RegExp regExp = new RegExp(pattern);
                            bool validpassword = regExp.hasMatch(value);
                            if (validpassword == true) {
                              return null;
                            } else {
                              return "passwrod lenght 8 contains numbers capital and small letters";
                            }
                          }
                        : null,
            keyboardType: type == "name"
                ? TextInputType.name
                : type == "password"
                    ? TextInputType.visiblePassword
                    : type == "number"
                        ? TextInputType.number
                        : TextInputType.emailAddress,
            controller: editingController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: ScreenUtil().setWidth(20), bottom: 7),
              border: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
            onChanged: (value) => inputtext = value,
          ),
        ),
      ],
    );
  }
}
