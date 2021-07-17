
import 'package:dellyshop/screens/home/home_screen.dart';
import 'package:dellyshop/screens/login/login_screen.dart';
import 'package:dellyshop/screens/register/register_screen.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app_localizations.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  AnimationController animationController;
  var tapLogin = 0;
  var tapSignup = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // Container(
          //   color: Colors.white,
          //   child: new Carousel(
          //     boxFit: BoxFit.cover,
          //     autoplay: true,
          //     animationDuration: Duration(milliseconds: 300),
          //     dotSize: 0.0,
          //     dotSpacing: 16.0,
          //     dotBgColor: Colors.transparent,
          //     showIndicator: false,
          //     overlayShadow: false,
          //     images: [
          //       AssetImage('assets/images/shopper1.jpg'),
          //       AssetImage("assets/images/shopper2.jpg"),
          //       AssetImage('assets/images/shopper3.jpg'),
          //     ],
          //   ),
          // ),

          Container(
            alignment: Alignment.center,

            /// Set gradient color in image (Click to open code)
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.orange[900]],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)),

            /// Set component layout
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: h(110),
                    width: w(300),
                    child: Image.asset(
                      "assets/images/MshwarLogo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 150.0)),
                  ButtonCustom(
                    txt: ApplicationLocalizations.of(context)
                        .translate('sign_up'),
                    bacgroudColor: Colors.white,
                    textColor: Colors.orange[900],
                    ontap: () {
                      Navigator.of(context)
                          .pushNamed((RegisterScreen.routeName));
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /// To set white line (Click to open code)
                      Container(
                        color: Colors.white,
                        height: h(2),
                        width: w(90),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),

                          /// navigation to home screen if user click "OR SKIP" (Click to open code)
                          child: Text(
                            ApplicationLocalizations.of(context)
                                .translate('or_skip'),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 15.0.sp),
                          ),
                        ),
                      ),

                      /// To set white line (Click to open code)
                      Container(
                        color: Colors.white,
                        height:h(2),
                        width: w(90),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  ButtonCustom(
                    borderColor: Colors.orange[900],
                    txt: ApplicationLocalizations.of(context)
                        .translate('sign_in'),
                    bacgroudColor: Colors.white,
                    textColor: Colors.orange[900],
                    
                    ontap: () {
                      Navigator.of(context).pushNamed((LoginScreen.routeName));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tapLogin = 0;
                tapSignup = 0;
              });
            }
          });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  /// Playanimation set forward reverse
  // ignore: unused_element
  // ignore: non_constant_identifier_names
  Future<Null> Playanimation() async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
