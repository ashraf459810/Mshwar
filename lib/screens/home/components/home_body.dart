import 'package:dellyshop/Widgets%20copy/Container.dart';
import 'package:dellyshop/Widgets%20copy/Text.dart';
import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/DiscountItems/DiscountItems.dart';

import 'package:dellyshop/models/Sliders.dart/Sliders.dart';
import 'package:dellyshop/models/category_models.dart';
import 'package:dellyshop/screens/MshwarTaxi/Taxi.dart';
import 'package:dellyshop/screens/all_product/all_product_screen.dart';

import 'package:dellyshop/screens/home/components/DiscountDetails.dart';

import 'package:dellyshop/screens/home/components/bloc/home_bloc.dart';
import 'package:dellyshop/screens/home/components/carousel_view_builder.dart';
import 'package:dellyshop/screens/home/components/category_list_builder.dart';
import 'package:dellyshop/screens/home/ttt.dart';
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
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Tess(),
                    ));
                  },
                  child: HeaderTitle(
                      ApplicationLocalizations.of(context)
                          .translate("categories"),
                      "",
                      Utils.isDarkMode
                          ? kDarkBlackFontColor
                          : kLightBlackTextColor,
                      () {}),
                ),
                categories != null
                    ? Container(
                        height: h(110), child: CateogryListBuilder(categories))
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
                            height: h(200),
                            child: Container(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: discountitems.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => DiscountDetails(
                                            datum: discountitems[index],
                                          ),
                                        ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: h(12),
                                            ),
                                            container(
                                              shadow: true,
                                              borderRadius: 15,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    child: Container(
                                                        height: h(100),
                                                        width: w(150),
                                                        child: Image.asset(
                                                          "assets/images/apple.jpg",
                                                          // "${discountitems[index].images}",
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                  text(
                                                      text:
                                                          "${discountitems[index].titleEn},",
                                                      color: Colors.grey[900]),
                                                  Container(
                                                    width: w(100),
                                                    child: Flexible(
                                                      fit: FlexFit.loose,
                                                      child: text(
                                                          text:
                                                              "sdfsdfsdfgsdfsddsgsdgsdggsgrgerg${discountitems[index].descriptionEn},",
                                                          fontsize: 11,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                  text(
                                                      text:
                                                          "Discount ${discountitems[index].discount}",
                                                      color:
                                                          Colors.orange[900]),
                                                  text(
                                                      text:
                                                          "Price ${discountitems[index].price}",
                                                      color: Colors.orange[900])
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );

                                    // },
                                  }),
                            ))

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
                      ),
                SizedBox(
                  height: h(30),
                ),
                Container(
                  child: Text(
                    "  Mshwar Taxi",
                    style: TextStyle(
                        color: kLightBlackTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Taxi(),
                    ));
                  },
                  child: Card(
                    child: Container(
                      height: h(150),
                      child: Image.asset(
                        'assets/images/taxi.jpeg',
                        fit: BoxFit.cover,
                      ),
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
