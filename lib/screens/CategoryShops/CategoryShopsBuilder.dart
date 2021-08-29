import 'package:dellyshop/models/CategoyShopsModel/CategoryShopsModel.dart'
    as s;

import 'package:dellyshop/screens/ShopItems/ShopItems.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryShopsBuilder extends StatefulWidget {
  final s.Shop shop;
  CategoryShopsBuilder({this.shop});

  @override
  _CategoryShopsBuilderState createState() => _CategoryShopsBuilderState();
}

class _CategoryShopsBuilderState extends State<CategoryShopsBuilder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ShopItems(
                shopid: widget.shop.id,
                shopimage:
                    "https://image.shutterstock.com/z/stock-photo-sunset-at-coast-of-the-lake-nature-landscape-nature-in-northern-europe-reflection-blue-sky-and-1960131820.jpg",
                shopname: widget.shop.nameEn)));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: (Image.network(
                  'https://image.shutterstock.com/z/stock-photo-sunset-at-coast-of-the-lake-nature-landscape-nature-in-northern-europe-reflection-blue-sky-and-1960131820.jpg',
                  fit: BoxFit.fitWidth,
                )),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  "${widget.shop.nameEn}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
