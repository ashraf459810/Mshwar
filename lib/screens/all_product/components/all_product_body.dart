import 'package:dellyshop/Widgets%20copy/Container.dart';
import 'package:dellyshop/Widgets%20copy/Text.dart';
import 'package:dellyshop/models/DiscountItems/DiscountItems.dart';

import 'package:dellyshop/screens/home/components/DiscountItemsDetails.dart';
import 'package:dellyshop/screens/home/components/bloc/home_bloc.dart';

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
              height: h(700),
              child: GridView.builder(
                  itemCount: items.length,
                  physics:
                      ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 4 / 4),
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
                        child: container(
                          borderRadius: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: h(150),
                                  width: w(200),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/images/apple.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Container(
                                width: w(150),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${items[index].titleEn}",
                                      style: TextStyle(color: Colors.grey[900]),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                              minHeight: 10, maxHeight: 23),
                                          child: text(
                                              text:
                                                  "${items[index].descriptionEn},",
                                              fontsize: 11,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: h(3),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Discount : ${items[index].discount}",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                        Text(
                                          "Price : ${items[index].price}",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        ),
                                      ],
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
