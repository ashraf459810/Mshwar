import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/screens/category_detail/components/category_detail_body.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = "/category_detail_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: ApplicationLocalizations.of(context).translate("categories"),
      body: CategoryDetailBody(),
    );
  }
}
