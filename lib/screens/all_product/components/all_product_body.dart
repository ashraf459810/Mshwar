import 'package:dellyshop/models/product_item_model.dart';
import 'package:dellyshop/screens/home/components/product_item_builder.dart';
import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';
import 'package:dellyshop/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../util.dart';

class AllProductScreenBody extends StatefulWidget {
  @override
  _AllProductScreenBody createState() => _AllProductScreenBody();
}

class _AllProductScreenBody extends State<AllProductScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PreferredSize(preferredSize: Size.fromHeight(20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SearchScreen.routeName);
            },
            child: Container(
              height: 40,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  shape: BoxShape.rectangle),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GridView.count(
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
                                builder: (context) =>
                                    ProductDetailScreen(value)));
                      },
                      child: FittedBox(
                        child: ProductItemBuilder(
                            isDiscount: false, ),
                      )),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
