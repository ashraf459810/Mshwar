import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../app_localizations.dart';
import 'components/my_components_body.dart';

class MyCommentScreen extends StatelessWidget {
  static const routeName = "/my_comment_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: MyCommentsBody(),
      title: ApplicationLocalizations.of(context).translate("my_comments"),
    );
  }
}
