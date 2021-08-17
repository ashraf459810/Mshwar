import 'package:dellyshop/models/category_models.dart';
import 'package:dellyshop/screens/CategoryShops/CategoryShops.dart';

import 'package:dellyshop/screens/home/components/category_item_builder.dart';
import 'package:dellyshop/widgets/shimmer_widger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';
import '../../../util.dart';

class CateogryListBuilder extends StatefulWidget {
  final CategoriesModel categories;

  CateogryListBuilder(this.categories);

  @override
  _CateogryListBuilderState createState() => _CateogryListBuilderState();
}

class _CateogryListBuilderState extends State<CateogryListBuilder> {
  CategoriesModel brandData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h(100),
      child: widget.categories != null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Hero(
                  tag: 'hero-tag-${widget.categories.categories[index].id}',
                  child: Material(
                    color: Utils.isDarkMode
                        ? kDarkDefaultBgColor
                        : kDefaultBgColor,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryShops(
                                      category: widget
                                          .categories.categories[index])));
                        },
                        child: CategoryListItemBuilder(
                            widget.categories.categories[index])),
                  ),
                );
              },
              itemCount: widget.categories.categories.length,
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShimmerWidget(
                    child: Container(
                      width: w(100),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.categories.categories.length,
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
