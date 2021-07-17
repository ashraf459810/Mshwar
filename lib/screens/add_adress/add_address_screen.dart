import 'package:dellyshop/app_localizations.dart';

import 'package:dellyshop/widgets/custom_scaffold.dart';

import 'package:flutter/material.dart';

import 'components/add_address_body.dart';

class AddAddressScreen extends StatelessWidget {
  static const routeName = "/add_address_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: ApplicationLocalizations.of(context).translate("add_address"),
      body: AddAddressBody(),
    );
  }
}
