import 'package:dellyshop/app_localizations.dart';

import 'package:dellyshop/models/CategoyShopsModel/CategoryShopsModel.dart'
    as s;

import 'package:dellyshop/screens/ShopItems/ShopItems.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class CategoryShopsBuilder extends StatefulWidget {
  final bool isCustomorder;
  final s.Shop shop;
  CategoryShopsBuilder({this.shop, this.isCustomorder});

  @override
  _CategoryShopsBuilderState createState() => _CategoryShopsBuilderState();
}

class _CategoryShopsBuilderState extends State<CategoryShopsBuilder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.shop.active == 1
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShopItems(
                        shop: widget.shop,
                        shopid: widget.shop.id,
                        shopimage: "${widget.shop.images}",
                        shopname: widget.shop.nameEn,
                        isCustomorder: widget.isCustomorder,
                      )))
              : Toast.show(
                  "work hours ${widget.shop.workingTime.split(widget.shop.workingTime.split("-").first).last.substring(1)}"
                  "\n"
                  "work days : ${widget.shop.workingTime.toString().split(",").first} to ${widget.shop.workingTime.toString().split(",").first} ",
                  context,
                  duration: 5,
                  backgroundColor: Colors.orange[700]);
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: h(140),
                width: w(200),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: (Image.network(
                    '${widget.shop.images}',
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    ApplicationLocalizations.of(context)
                                .appLocale
                                .languageCode ==
                            "en"
                        ? "${widget.shop.nameEn}"
                        : "${widget.shop.name}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
