import 'package:dellyshop/screens/App/components/Signup.dart';
import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/app_builder.dart';

import 'package:dellyshop/widgets/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';

class App extends StatelessWidget {
  static const String routeName = "/splash_screen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()..add(IsLoginEvent()),
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is IsLoginState) {
            if (state.islogin == true) {
              if (state.isenglish == false) {
                Utils.appLocale = Locale("ar", " ");
                AppBuilder.of(context).rebuild();
              }
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => CustomBottomNavigationBar(),
              ));
            } else
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Signup()));
          }
        },
        child: Scaffold(body: Container()),
      ),
    );
  }
}
