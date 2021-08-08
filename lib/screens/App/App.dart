import 'package:dellyshop/screens/App/components/Signup.dart';

import 'package:dellyshop/widgets/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';

class App extends StatelessWidget {
  static const String routeName = "/splash_screen";
  @override
  Widget build(BuildContext context) {
    print("here splash");
    return BlocProvider(
      create: (context) => AppBloc()..add(IsLoginEvent()),
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is IsLoginState) {
            if (state.islogin == true) {
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
