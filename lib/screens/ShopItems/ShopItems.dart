import 'package:dellyshop/Widgets%20copy/Container.dart';
import 'package:dellyshop/Widgets%20copy/Text.dart';
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
            ),
          ],
        ),
        backgroundColor:
            Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Center(
                      child: Container(
                        height: h(650),
                        width: w(350),
                        child: ListView.builder(
                            physics: ScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            controller: controller,
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: container(
                                    borderRadius: 16,
                                    hight: h(100),
                                    width: w(200),
                                    shadow: true,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          child: Container(
                                              height: h(100),
                                              width: w(120),
                                              color: Colors.red,
                                              child: Image.network(
                                                "${items[index].images}",
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        SizedBox(
                                          width: w(40),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // SizedBox(
                                            //   height: h(10),
                                            // ),
                                            text(
                                                text:
                                                    "${items[index].titleEn},",
                                                color: Colors.grey[900]),
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: w(150),
                                                  minHeight: h(10),
                                                  maxHeight: h(30)),
                                              child: text(
                                                  text:
                                                      "${items[index].descriptionEn},",
                                                  fontsize: 11,
                                                  color: Colors.grey),
                                            ),
                                            text(
                                                text:
                                                    "Price ${items[index].price}",
                                                color: Colors.orange[900]),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
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
