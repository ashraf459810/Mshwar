import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/DiscountItems/DiscountItems.dart';

import 'package:dellyshop/models/Sliders.dart/Sliders.dart';
import 'package:dellyshop/models/category_models.dart';
import 'package:dellyshop/screens/all_product/all_product_screen.dart';

import 'package:dellyshop/screens/category_detail/category_detail_screen.dart';
import 'package:dellyshop/screens/home/components/DiscountItemsDetails.dart';
import 'package:dellyshop/screens/home/components/bloc/home_bloc.dart';
import 'package:dellyshop/screens/home/components/carousel_view_builder.dart';
import 'package:dellyshop/screens/home/components/category_list_builder.dart';
import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/shimmer_widger.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'header_title.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Sliders sliders;
  CategoriesModel categories;
  List<ItemsWithDiscount> discountitems = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetCategoriesEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is Loading) {
            return CircularProgressIndicator(
              color: Colors.orange,
            );
          }
          if (state is Error) {
            return Center(
                child: Text(
              state.error,
              style: TextStyle(color: Colors.black),
            ));
          }

          if (state is GetCategoriesState) {
            categories = state.categoriesModel;
          }
          if (state is GetSlidersState) {
            sliders = state.sliders;
          }
          if (state is GetDiscountItemsState) {
            discountitems = state.discountItems;
          }

          return Container(
            color: Utils.isDarkMode ? kDarkColor : kWhiteColor,
            child: ListView(
              shrinkWrap: true,
              children: [
                HeaderTitle(
                    ApplicationLocalizations.of(context)
                        .translate("categories"),
                    ApplicationLocalizations.of(context).translate("view_all"),
                    Utils.isDarkMode
                        ? kDarkBlackFontColor
                        : kLightBlackTextColor, () {
                  Navigator.of(context)
                      .pushNamed(CategoryDetailScreen.routeName);
                }),
                categories != null
                    ? CateogryListBuilder(categories)
                    : ShimmerWidget(
                        child: Container(
                          height: h(100),
                          color: Colors.grey,
                        ),
                      ),
                sliders != null ? CarouselViewBuilder(sliders) : Container(),
                HeaderTitle(
                    'Discount',
                    ApplicationLocalizations.of(context).translate("view_all"),
                    Utils.isDarkMode
                        ? kDarkBlackFontColor
                        : kLightBlackTextColor, () {
                  Navigator.of(context)
                      .pushNamed(AllProductItemScreen.routeName);
                }),
                state is GetDiscountItemsState
                    ? discountitems.isNotEmpty
                        ? Container(
                            height: h(240),
                            child: ListView.builder(
                              physics: ScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              scrollDirection: Axis.horizontal,
                              itemCount: discountitems.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            DiscountItemDetails(
                                          itemsWithDiscount:
                                              discountitems[index],
                                        ),
                                      ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height: h(100),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: h(170),
                                                width: w(150),
                                                child: Image.asset(
                                                  "assets/images/apple.jpg",
                                                  fit: BoxFit.cover,
                                                )),
                                            Container(
                                              color: Colors.grey[100],
                                              width: w(150),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${discountitems[index].titleEn}",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.orange[900]),
                                                  ),
                                                  Text(
                                                    "Price : ${discountitems[index].price}",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.orange[900]),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            ),
                          )

                        // GridListBuilder(),
                        : Container()
                    : ShimmerWidget(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: h(200),
                            color: Colors.grey,
                          ),
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
