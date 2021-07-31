import 'package:dellyshop/models/DiscountItems/DiscountItems.dart';
import 'package:dellyshop/models/product_item_model.dart';
import 'package:dellyshop/screens/home/components/DiscountItemsDetails.dart';
import 'package:dellyshop/screens/home/components/bloc/home_bloc.dart';

import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';
import 'package:dellyshop/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductScreenBody extends StatefulWidget {
  @override
  _AllProductScreenBody createState() => _AllProductScreenBody();
}

class _AllProductScreenBody extends State<AllProductScreenBody> {
  HomeBloc homeBloc = HomeBloc();
  List<ItemsWithDiscount> items = [];
  @override
  void initState() {
    homeBloc.add(GetDicountItemsEvent(12));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: homeBloc,
      builder: (context, state) {
        if (state is GetDiscountItemsState) {
          items = state.discountItems;
        }
        if (state is Error) {
          return Text(
            state.error,
            style: TextStyle(color: Colors.black),
          );
        }

        return ListView(
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                height: h(40),
              ),
            ),
            Container(
              height: h(200),
              child: GridView.builder(
                  itemCount: items.length,
                  physics:
                      ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DiscountItemDetails(
                            itemsWithDiscount: items[index],
                          ),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: h(100),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: h(150),
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
                                      "${items[index].titleEn}",
                                      style:
                                          TextStyle(color: Colors.orange[900]),
                                    ),
                                    Text(
                                      "Price : ${items[index].price}",
                                      style:
                                          TextStyle(color: Colors.orange[900]),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
