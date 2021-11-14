import 'package:dellyshop/constant.dart';

import 'package:dellyshop/models/category_models.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_localizations.dart';

// ignore: must_be_immutable
class CategoryListItemBuilder extends StatefulWidget {
  final Category category;

  CategoryListItemBuilder(this.category);

  @override
  _CategoryListItemBuilderState createState() =>
      _CategoryListItemBuilderState();
}

class _CategoryListItemBuilderState extends State<CategoryListItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: w(150),
        height: h(300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Image.network(
                    widget.category.image,
                    fit: BoxFit.cover,
                    height: h(100),
                    width: w(150),
                  )),
            ),
            Center(
              child: Text(
                ApplicationLocalizations.of(context).appLocale.languageCode ==
                        "en"
                    ? widget.category.titleEn
                    : widget.category.title,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kTitleFontSize,
                    fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
            ),
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
