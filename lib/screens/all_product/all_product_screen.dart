import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/all_product_body.dart';

class AllProductItemScreen extends StatefulWidget {
  final bool islogin;
  AllProductItemScreen({Key key, this.islogin}) : super(key: key);

  @override
  _AllProductItemScreenState createState() => _AllProductItemScreenState();
}

class _AllProductItemScreenState extends State<AllProductItemScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "All Product",
      body: AllProductScreenBody(
        islogin: widget.islogin,
      ),
    );
  }
}
