

import 'package:dellyshop/models/product_item_model.dart';
import 'package:dellyshop/screens/home/components/product_item_builder.dart';
import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';
import 'package:dellyshop/util.dart';

import 'package:flutter/material.dart';



// ignore: must_be_immutable
class GridListBuilder extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Widget Item;
  @override
  _GridListBuilderState createState() => _GridListBuilderState();
}

class _GridListBuilderState extends State<GridListBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (140 / Utils.GridHeight()),
      controller: new ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: newestLit.map(
        (value) {
          return Hero(
            tag: "hero-Item-${value.id}",
            child: Material(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(value)));
                  },
                  child: FittedBox(
                    child: ProductItemBuilder(
                        isDiscount: false, ),
                  )),
            ),
          );
        },
      ).toList(),
    );
  }
}

// ignore: unused_element
void _onTileClicked(int index) {
  debugPrint("You tapped on item $index");
}
