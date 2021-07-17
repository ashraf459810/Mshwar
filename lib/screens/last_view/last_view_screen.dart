import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/last_view_body.dart';

class LastViewScreen extends StatelessWidget {
  static const routeName = "/last_view_body";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: LastViewBody(),
      title: ApplicationLocalizations.of(context).translate("last_view"),
    );
  }
}
