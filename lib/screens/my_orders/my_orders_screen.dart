import 'package:dellyshop/screens/my_orders/components/my_orders_body.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../app_localizations.dart';

class MyOdersScreen extends StatelessWidget {
  static const routeName = "/my_orders_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: MyOrdersBody(),
      title: ApplicationLocalizations.of(context).translate("my_orders"),
    );
  }
}
