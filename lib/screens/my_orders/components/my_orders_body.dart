import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/models/my_favorite_model.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../constant.dart';
import '../../../util.dart';

class MyOrdersBody extends StatefulWidget {
  @override
  _MyOrdersBodyState createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return buildProductItem(index);
        },
        itemCount: myFavList.length,
      ),
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
          height: myFavList[index].itemHeight,
          childWidget: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0, top: 5.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(myFavList[index].productImage),
                        )),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(myFavList[index].productName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor,
                                fontSize: kTitleFontSize)),
                        Text(myFavList[index].companyName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: kGrayColor, fontSize: kSmallFontSize)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${myFavList[index].price}\$",
                          style: TextStyle(
                              color: kAppColor, fontSize: kPriceFontSize),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    print("press");
                    setState(
                      () {
                        myFavList[index].isSelect =
                            myFavList[index].isSelect == false;
                        print(myFavList[index].isSelect);
                        myFavList[index].arrowRotate =
                            myFavList[index].isSelect ? 90 : 0;
                        if (myFavList[index].itemHeight == 150)
                          myFavList[index].itemHeight = 250;
                        else {
                          myFavList[index].itemHeight = 150;
                        }
                      },
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalTextWidget(
                          ApplicationLocalizations.of(context)
                              .translate("show_mote_detail"),
                          Utils.isDarkMode
                              ? kDarkTextColorColor
                              : kLightBlackTextColor,
                          kSubTitleFontSize),
                      RotationTransition(
                        turns: new AlwaysStoppedAnimation(
                            myFavList[index].arrowRotate / 360),
                        child: Icon(Icons.arrow_forward_ios,
                            size: 25, color: kAppColor),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: myFavList[index].isSelect,
                child: Column(
                  children: [
                    buildOrderInfo(
                        index,
                        ApplicationLocalizations.of(context)
                            .translate("order_no"),
                        myFavList[index].orderNo.toString()),
                    buildOrderInfo(
                        index,
                        ApplicationLocalizations.of(context)
                            .translate("order_date"),
                        Jiffy(myFavList[index].orderDate).yMMMd),
                    buildOrderInfo(
                        index,
                        ApplicationLocalizations.of(context)
                            .translate("order_status"),
                        myFavList[index].orderStatus.toString()),
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
