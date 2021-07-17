import 'package:dellyshop/screens/my_favorites/components/my_favorites_body.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../app_localizations.dart';

class MyFavoriteScreen extends StatelessWidget {
  static const routeName = "my_favorite_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: MyFavoritesBody(),
      title: ApplicationLocalizations.of(context).translate("my_favorite"),
    );
  }
}
