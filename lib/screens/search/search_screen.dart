import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/search_body.dart';

class SearchScreen extends StatelessWidget {
  final bool islogin;
  static const routeName = "/search_screen";

  const SearchScreen({Key key, this.islogin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Search",
      body: SearchBody(
        islogin: islogin,
      ),
    );
  }
}
