import 'package:dellyshop/routes.dart';
import 'package:dellyshop/screens/cart/components/bloc/cart_bloc.dart';
import 'package:dellyshop/screens/splash/splash_screen.dart';

import 'package:dellyshop/theme.dart';
import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/app_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'delegates/app_localizations_delegate.dart';
import 'injection.dart';

Future<void> main() async {
  await iniGetIt();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    print("here from main");
    return AppBuilder(
      builder: (context) {
        return ScreenUtilInit(
            designSize: Size(375, 812),
            builder: () => BlocProvider(
                  create: (context) => CartBloc(),
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    routes: routes,
                    theme: theme(),
                    supportedLocales: [
                      Locale('en', 'US'),
                      Locale('ar', ''),
                    ],
                    locale: Utils.appLocale,
                    localizationsDelegates: [
                      const AppLocalizationsDelegate(),
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocaleLanguage in supportedLocales) {
                        print(supportedLocaleLanguage.languageCode);
                        if (supportedLocaleLanguage.languageCode ==
                                locale.languageCode &&
                            supportedLocaleLanguage.countryCode ==
                                locale.countryCode) {
                          return supportedLocaleLanguage;
                        }
                      }
                      // If device not support with locale to get language code then default get first on from the list
                      return supportedLocales.first;
                    },
                    title: 'Mshwar',
                    initialRoute: SplashScreen.routeName,
                    builder: (context, widget) {
                      return MediaQuery(
                        //Setting font does not change with system font size
                        data: MediaQuery.of(context)
                            .copyWith(textScaleFactor: 1.0),
                        child: widget,
                      );
                    },
                  ),
                ));
      },
    );
  }
}
