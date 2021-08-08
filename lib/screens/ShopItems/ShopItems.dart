import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/ShopItem.dart';
import 'package:dellyshop/screens/ItemDetails/ItemDetails.dart';
import 'package:dellyshop/screens/ShopItems/bloc/shopitems_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util.dart';

class ShopItems extends StatefulWidget {
  final int shopid;
  final String shopimage;
  final shopname;

  ShopItems({Key key, this.shopid, this.shopimage, this.shopname})
      : super(key: key);

  @override
  _ShopItemsState createState() => _ShopItemsState();
}

class _ShopItemsState extends State<ShopItems> {
  ScrollController controller = ScrollController();
  int pages = 0;
  int ssize = 12;
  List<Datum> items = [];

  /// Custom text for bottomSheet

  @override
  Widget build(BuildContext context) {
    /// Hero animation for image
    return BlocProvider(
      create: (context) =>
          ShopitemsBloc()..add(GetItemsEvent(widget.shopid, pages, ssize)),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              height: h(20),
            ),
            Row(
              children: [
                Text(
                  "Products",
                  style: TextStyle(fontSize: 30, color: Colors.orange[900]),
                ),
              ],
            ),
            SizedBox(
              width: w(200),
            )
          ],
        ),
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: h(10),
              ),
              BlocBuilder<ShopitemsBloc, ShopitemsState>(
                  builder: (context, state) {
                // if (state is Loading) {
                //   return Container(
                //     child: Center(
                //       child: CircularProgressIndicator(
                //         color: Colors.orange,
                //       ),
                //     ),
                //   );
                // }
                if (state is Error) {
                  return Center(
                      child: Text(
                    state.error,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ));
                }
                if (state is GetItemsState) {
                  items = state.shopItem;
                }
                return NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification &&
                          controller.position.extentAfter == 0) {
                        print("here from listener");
                        pages++;
                        print(pages);
                        context
                            .read<ShopitemsBloc>()
                            .add(GetItemsEvent(widget.shopid, pages, ssize));
                      }

                      return false;
                    },
                    child: Container(
                      height: h(650),
                      child: GridView.builder(
                          physics: ScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          controller: controller,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 3.8,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: items.length,
                          // ignore: missing_return
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ItemDetails(
                                      datum: items[index],
                                    ),
                                  ));
                                },
                                child: Card(
                                  child: Container(
                                    color: Colors.white,
                                    height: h(150),
                                    width: w(200),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: h(150),
                                            width: w(200),
                                            child: Image.network(
                                              "${items[index].images}",
                                              fit: BoxFit.cover,
                                            )),
                                        SizedBox(
                                          height: h(10),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "${items[index].titleEn}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: h(10),
                                            ),
                                            Text(
                                              "Price : ${items[index].price}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ));
              }),
            ],
          ),
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
