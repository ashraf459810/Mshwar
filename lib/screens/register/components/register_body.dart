import 'package:dellyshop/app_localizations.dart';

import 'package:dellyshop/models/CitiesModel/cities.dart';

import 'package:dellyshop/screens/register/components/bloc/register_bloc.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';

import 'package:dellyshop/widgets/inputfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  FocusNode myFocusNode = new FocusNode();
  TextEditingController namec = TextEditingController();
  String name;
  TextEditingController mobilec = TextEditingController();
  String mobile;
  TextEditingController emailc = TextEditingController();
  String email;
  TextEditingController passwordc = TextEditingController();
  String password;

  List<City> cityfromstate = [];
  int cityid;
  String cityhint = "Select your city";
  ReusableWidget reusableWidget = ReusableWidget();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unnecessary_statements
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return BlocProvider(
      create: (context) => RegisterBloc()..add(CitiesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterS) {
                  Toast.show("Registered Successfully", context,
                      duration: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.orange,
                      gravity: Toast.TOP);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CustomBottomNavigationBar(),
                  ));
                }
              },
              builder: (context, state) {
                if (state is Loading) {
                  return Container(
                    height: h(300),
                    width: w(400),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  );
                }
                if (state is Error) {
                  print("here from error ");
                  return Container(
                      height: (300),
                      width: w(400),
                      child: Center(
                          child: Text(
                        state.error,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )));
                }
                if (state is CitiesState) {
                  cityfromstate = state.cities;
                }

                return Container(
                  height: h(812),

                  /// Set gradient color in image (Click to open code)
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.orange[900]],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                    ),
                  ),

                  /// Set component layout
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: h(50),
                        ),
                        Image.asset(
                          "assets/images/MshwarLogo.png",
                          height: h(200),
                          width: w(250),
                          fit: BoxFit.cover,
                        ),
                        reusableWidget.container(
                            namec,
                            name,
                            ApplicationLocalizations.of(context)
                                .translate("Name"),
                            "name"),
                        SizedBox(
                          height: h(14),
                        ),
                        reusableWidget.container(
                            emailc,
                            email,
                            ApplicationLocalizations.of(context)
                                .translate("Email"),
                            "email"),
                        SizedBox(
                          height: h(14),
                        ),
                        reusableWidget.container(
                            passwordc,
                            password,
                            ApplicationLocalizations.of(context)
                                .translate("password"),
                            "password"),
                        SizedBox(
                          height: h(14),
                        ),
                        reusableWidget.container(
                            mobilec,
                            mobile,
                            ApplicationLocalizations.of(context)
                                .translate("Mobile"),
                            "number"),
                        SizedBox(
                          height: h(14),
                        ),
                        SizedBox(
                          height: h(14),
                        ),
                        Container(
                          height: h(47),
                          width: w(327),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: DropdownButton<City>(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(cityhint == "select your city"
                                  ? ApplicationLocalizations.of(context)
                                      .translate(cityhint)
                                  : cityhint),
                            ),
                            isExpanded: true,
                            underline: SizedBox(),
                            items: cityfromstate.map((value) {
                              return DropdownMenuItem<City>(
                                value: value,
                                child: new Text(value.title),
                              );
                            }).toList(),
                            onChanged: (value) {
                              cityhint = value.title;
                              cityid = value.id;

                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: h(50),
                        ),
                        InkWell(
                            onTap: () {
                              if (formKey.currentState.validate()) {
                                if (mobilec.text != null && cityid != null) {
                                  context.read<RegisterBloc>().add(RegisterE(
                                      namec.text,
                                      passwordc.text,
                                      cityid,
                                      emailc.text,
                                      int.parse(mobilec.text)));
                                } else {
                                  Toast.show("Please fill the fields", context,
                                      duration: Toast.LENGTH_SHORT,
                                      backgroundColor: Colors.orange,
                                      gravity: Toast.TOP);
                                }
                              }
                            },
                            child: Container(
                              height: h(50),
                              width: w(200),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Center(
                                child: Text(
                                  ApplicationLocalizations.of(context)
                                      .translate("sign_up"),
                                  style: TextStyle(
                                      color: Colors.orange[900],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              },
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
