import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/models/CartHistory/CartHistory.dart';

import 'package:dellyshop/screens/CategoryShops/CategoryShopsBuilder.dart';
import 'package:dellyshop/screens/progfile/components/bloc/profile_bloc.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:toast/toast.dart';

import '../../../constant.dart';
import '../../../util.dart';

class MyOrdersBody extends StatefulWidget {
  @override
  _MyOrdersBodyState createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody>
    with TickerProviderStateMixin {
  bool showdetails = false;
  int num = 0;
  List<MyOrder> carthistory = [];
  List<TaxiOrderItem> carttaxi = [];
  bool taxiorders = false;
  ProfileBloc profileBloc = ProfileBloc();
  @override
  void initState() {
    profileBloc.add(CartHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is SupportState) {
          Toast.show("Thanks we will contact you ASAP", context,
              duration: 2, backgroundColor: Colors.orange[900], gravity: 1);
        }
      },
      bloc: profileBloc,
      builder: (context, state) {
        if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is Error) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(color: Colors.black),
            ),
          );
        }
        if (state is CartHistoryState) {
          carthistory = state.cartHistory.myOrders;
          carttaxi = state.cartHistory.taxiOrderItems;
        }
        return Container(
          height: h(700),
          margin: EdgeInsets.all(10.0),
          child: ListView(children: [
            !taxiorders
                ? carthistory.isNotEmpty
                    ? Container(
                        height: h(600),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return buildProductItem(index);
                          },
                          itemCount: carthistory.length,
                        ),
                      )
                    : Container(
                        height: h(200),
                        child: Center(
                            child: Text(
                          "No Orders For you",
                          style: TextStyle(color: Colors.orange[900]),
                        )),
                      )
                : Container(
                    height: 1,
                  ),
            SizedBox(
              height: h(20),
            ),
            GestureDetector(
              onTap: () {
                if (num.isEven) {
                  taxiorders = true;
                } else {
                  taxiorders = false;
                }
                num++;
                setState(() {});
              },
              child: Container(
                child: Text(
                  !taxiorders ? "Show Taxi Orders" : "Show previous orders",
                  style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h(30),
            ),
            taxiorders
                ? carttaxi.isNotEmpty
                    ? Container(
                        height: h(600),
                        width: w(200),
                        child: ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return buildProductItemtaxi(index);
                          },
                          itemCount: carttaxi.length,
                        ),
                      )
                    : Container(
                        height: h(200),
                        child: Center(
                            child: Text(
                          "No Taxi Orders For you",
                          style: TextStyle(color: Colors.orange[900]),
                        )),
                      )
                : Container(),
          ]),
        );
      },
    );
  }

  buildProductItem(int index) {
    return AnimatedSize(
      duration: new Duration(seconds: 1),
      curve: Curves.elasticOut,
      vsync: this,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardWidget(
          height: h(250),
          childWidget: Column(
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10.0, top: 5.0),
                      height: h(100),
                      width: w(150),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.network(
                        "${carthistory[index].mainImage}",
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(carthistory[index].itemName.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor,
                                fontSize: kTitleFontSize)),
                        // Text(carthistory[index].invoiceId.toString(),
                        //     overflow: TextOverflow.ellipsis,
                        //     style: TextStyle(
                        //         color: kGrayColor, fontSize: kSmallFontSize)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${carthistory[index].price}\$",
                          style: TextStyle(
                              color: kAppColor, fontSize: kPriceFontSize),
                        ),
                        SizedBox(
                          height: h(10),
                        ),
                        GestureDetector(
                          onTap: () {
                            profileBloc
                                .add(SupportEvent(carthistory[index].id));
                          },
                          child: Container(
                            child: Text(
                              "click for Support",
                              style: TextStyle(
                                  color: kAppColor,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: true,
                child: Column(
                  children: [
                    buildOrderInfo(
                        index,
                        ApplicationLocalizations.of(context)
                            .translate("order_no"),
                        carthistory[index].invoiceId.toString()),
                    buildOrderInfo(
                        index,
                        ApplicationLocalizations.of(context)
                            .translate("order_date"),
                        Jiffy(carthistory[index].createdAt).yMMMd),
                    buildOrderInfo(
                        index,
                        ApplicationLocalizations.of(context)
                            .translate("order_status"),
                        carthistory[index].status.name.toString()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildProductItemtaxi(int index) {
    return AnimatedSize(
      duration: new Duration(seconds: 1),
      curve: Curves.elasticOut,
      vsync: this,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardWidget(
          height: h(150),
          childWidget: Column(
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10.0, top: 5.0),
                      height: h(100),
                      width: w(150),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.taxi_alert,
                        size: 70,
                        color: Colors.grey,
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Order Id :${carttaxi[index].id.toString()}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor,
                                fontSize: kTitleFontSize)),
                        // Text(carthistory[index].invoiceId.toString(),
                        //     overflow: TextOverflow.ellipsis,
                        //     style: TextStyle(
                        //         color: kGrayColor, fontSize: kSmallFontSize)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Fee ${carttaxi[index].total}\$",
                          style: TextStyle(
                              color: kAppColor, fontSize: kPriceFontSize),
                        ),
                        SizedBox(
                          height: h(10),
                        ),
                        GestureDetector(
                          onTap: () {
                            profileBloc.add(SupportEvent(carttaxi[index].id));
                          },
                          child: Container(
                            child: Text(
                              "click for Support",
                              style: TextStyle(
                                  color: kAppColor,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: true,
                child: Column(
                  children: [
                    // buildOrderInfo(
                    //     index,
                    //     ApplicationLocalizations.of(context)
                    //         .translate("order_no"),
                    //     carthistory[index].invoiceId.toString()),
                    buildOrderInfo(
                        index,
                        ApplicationLocalizations.of(context)
                            .translate("order_date"),
                        Jiffy(carttaxi[index].createdAt).yMMMd),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildOrderInfo(int index, String text, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NormalTextWidget(text, kAppColor, kSubTitleFontSize),
          NormalTextWidget(
              info,
              Utils.isDarkMode ? kDarkTextColorColor : kLightBlackTextColor,
              kSubTitleFontSize),
        ],
      ),
    );
  }
}
