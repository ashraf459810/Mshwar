import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/search_body.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = "/search_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Search",
      body: SearchBody(),
    );
  }
}
