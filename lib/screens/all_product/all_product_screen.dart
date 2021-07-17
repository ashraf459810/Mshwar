import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/all_product_body.dart';

class AllProductItemScreen extends StatelessWidget {
  static const routeName = "/all_product_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "All Product",
      body: AllProductScreenBody(),
    );
  }
}
