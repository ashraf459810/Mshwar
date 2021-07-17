import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';

import 'package:flutter/material.dart';

import 'components/select_credit_cart_body.dart';

class SelectCreditCartScreen extends StatelessWidget {
  static const String routeName = "/select_credit_cart_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: ApplicationLocalizations.of(context)
            .translate("select_credit_card"),
        body: SelectCreditCardBody());
  }
}
