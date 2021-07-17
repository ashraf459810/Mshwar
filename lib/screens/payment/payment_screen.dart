import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/payment_body.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = "/payment_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: ApplicationLocalizations.of(context).translate("payment"),
      body: PaymentBody(),
    );
  }
}
