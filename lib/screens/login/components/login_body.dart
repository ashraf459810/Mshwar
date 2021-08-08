import 'package:dellyshop/screens/login/components/bloc/login_bloc.dart';
import 'package:dellyshop/screens/register/register_screen.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';

import 'package:dellyshop/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:regexpattern/regexpattern.dart';
import 'package:toast/toast.dart';

import '../../../app_localizations.dart';
import '../../../constant.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  FocusNode myFocusNode = new FocusNode();
  TextEditingController controller = TextEditingController();
  String userormobile;
  String password;
  final _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = MediaQuery.of(context).size;
    // ignore: unnecessary_statements
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.orange[900]],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                  ),
                ),

                /// Set component layout
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: h(812),
                      width: w(300),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          Container(
                            alignment: AlignmentDirectional.topCenter,
                            child: Column(
                              children: <Widget>[
                                /// padding logo
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            mediaQueryData.padding.top + 40.0)),
                                Image.asset(
                                  ("assets/images/MshwarLogo.png"),
                                  height: h(300),
                                  width: w(300),
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: h(10),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0)),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Container(
                                      height: h(55),
                                      width: w(327),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(13))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: w(10)),
                                          Icon(
                                            Icons.email,
                                            color: Colors.orange[800],
                                          ),
                                          Container(
                                            height: h(100),
                                            width: w(200),
                                            child: Center(
                                              child: Form(
                                                key: _formKey2,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return "enter your name or number";
                                                    }

                                                    bool isvalidname =
                                                        RegexValidation
                                                            .hasMatch(
                                                                value,
                                                                RegexPattern
                                                                    .email);
                                                    bool isvalidnumber =
                                                        RegexValidation.hasMatch(
                                                            value,
                                                            RegexPattern
                                                                .numericOnly);
                                                    //  ||       RegExp(r'[!@#<>?":_`~;[\]\|=+)(*&^%0-9-]')
                                                    //     .hasMatch(value)  ;

                                                    if (isvalidname ||
                                                        isvalidnumber) {
                                                      return null;
                                                    } else {
                                                      return "please enter a valid name or number ";
                                                    }
                                                  },
                                                  cursorColor: Colors.orange,
                                                  decoration: InputDecoration(
                                                      labelStyle: TextStyle(
                                                          color: myFocusNode
                                                                  .hasFocus
                                                              ? Colors.grey[600]
                                                              : Colors
                                                                  .grey[600],
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      labelText: ApplicationLocalizations.of(
                                                              context)
                                                          .translate(
                                                              "email or mobile number"),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .auto,
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10)),
                                                  controller: controller,
                                                  onChanged: (value) {
                                                    userormobile = value;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0)),
                                SizedBox(
                                  height: h(20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Container(
                                    height: h(55),
                                    width: w(327),
                                    child: CustomTextFromField(
                                      icon: Icons.lock,
                                      ispassword: true,
                                      placeHolder:
                                          ApplicationLocalizations.of(context)
                                              .translate("password"),
                                      inputType: TextInputType.visiblePassword,
                                      onChanged: (value) {
                                        password = value;
                                      },
                                    ),
                                  ),
                                ),
                                CutomTextButton(
                                    ApplicationLocalizations.of(context)
                                        .translate("not_have_account"), () {
                                  Navigator.of(context)
                                      .pushNamed((RegisterScreen.routeName));
                                }),
                                SizedBox(
                                  height: h(40),
                                ),
                                BlocConsumer<LoginBloc, LoginState>(
                                  listener: (context, state) {
                                    if (state is Error) {
                                      Toast.show(state.error, context,
                                          duration: Toast.LENGTH_SHORT,
                                          backgroundColor: Colors.orange,
                                          gravity: Toast.TOP);
                                    }
                                    if (state is LoginS) {
                                      Toast.show("Login Successfully", context,
                                          duration: Toast.LENGTH_SHORT,
                                          gravity: Toast.TOP,
                                          backgroundColor: Colors.orange[900]);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            CustomBottomNavigationBar(),
                                      ));
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is Loading) {
                                      return CircularProgressIndicator(
                                          color: Colors.orange[900]);
                                    }
                                    return ButtonCustom(
                                      txt: ApplicationLocalizations.of(context)
                                          .translate(
                                        "sign_in",
                                      ),
                                      ontap: () {
                                        if (_formKey2.currentState.validate() &&
                                            password != null) {
                                          context.read<LoginBloc>().add(
                                              LoginE(userormobile, password));
                                        } else {
                                          Toast.show(
                                              "Please fill all the fields",
                                              context,
                                              duration: Toast.LENGTH_SHORT,
                                              gravity: Toast.TOP,
                                              backgroundColor:
                                                  Colors.orange[900]);
                                        }
                                      },
                                      bacgroudColor: kWhiteColor,
                                      textColor: kAppColor,
                                    );
                                  },
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0)),
                              ],
                            ),
                          ),

                          /// Set Animaion after user click buttonLogin
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
