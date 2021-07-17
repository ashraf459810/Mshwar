import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/Sliders.dart/Sliders.dart';
import 'package:dellyshop/models/category_models.dart';
import 'package:dellyshop/screens/all_product/all_product_screen.dart';

import 'package:dellyshop/screens/category_detail/category_detail_screen.dart';
import 'package:dellyshop/screens/home/components/bloc/home_bloc.dart';
import 'package:dellyshop/screens/home/components/carousel_view_builder.dart';
import 'package:dellyshop/screens/home/components/category_list_builder.dart';
import 'package:dellyshop/util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'header_title.dart';
import 'item_list_builder.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Sliders sliders;
  CategoriesModel categories;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            return Center(child: Text(state.error));
          }

          if (state is GetCategoriesState) {
            categories = state.categoriesModel;
          }
          if (state is GetSlidersState) {
            sliders = state.sliders;
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
                CateogryListBuilder(categories),
                sliders != null ? CarouselViewBuilder(sliders) : Container(),
                HeaderTitle(
                    ApplicationLocalizations.of(context)
                        .translate("best_seller"),
                    ApplicationLocalizations.of(context).translate("view_all"),
                    Utils.isDarkMode
                        ? kDarkBlackFontColor
                        : kLightBlackTextColor, () {
                  Navigator.of(context)
                      .pushNamed(AllProductItemScreen.routeName);
                }),
                ItemListBuilder(),
                HeaderTitle(
                    ApplicationLocalizations.of(context).translate("newest"),
                    ApplicationLocalizations.of(context).translate("view_all"),
                    Utils.isDarkMode
                        ? kDarkBlackFontColor
                        : kLightBlackTextColor, () {
                  Navigator.of(context)
                      .pushNamed(AllProductItemScreen.routeName);
                }),
                // GridListBuilder(),
              ],
            ),
          );
        },
      ),
    );
  }
}
