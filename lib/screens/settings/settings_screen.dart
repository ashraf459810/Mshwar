import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../app_localizations.dart';
import 'components/settings_body.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = "/settings_page";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: ApplicationLocalizations.of(context).translate("settings"),
      body: SettingsBody(),
    );
  }
}
