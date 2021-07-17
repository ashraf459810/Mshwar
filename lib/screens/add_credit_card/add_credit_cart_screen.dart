import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../app_localizations.dart';
import 'components/add_credit_card_body.dart';

class AddCreditCardScreen extends StatelessWidget {
  static const routeName = "/add_credit_card_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title:
            ApplicationLocalizations.of(context).translate("add_credit_card"),
        body: AddCreditCartBody());
  }
}
