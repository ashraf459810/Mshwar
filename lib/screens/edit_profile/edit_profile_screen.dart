import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = "edit_profile_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: ApplicationLocalizations.of(context).translate("edit_profile"),
      body: EditProfileBody(),
    );
  }
}
