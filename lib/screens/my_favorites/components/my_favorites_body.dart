import 'package:dellyshop/models/product_item_model.dart';

import 'package:dellyshop/widgets/card_widget.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';
import '../../../constant.dart';
import '../../../util.dart';

// ignore: must_be_immutable
class MyFavoritesBody extends StatefulWidget {
  // ignore: deprecated_member_use
  var favList = new List<ProductItemModel>();
  double itemHeight = 120;
  double totalListHeight;
  int index;

  @override
  _MyFavoritesBodyState createState() => _MyFavoritesBodyState();
}

class _MyFavoritesBodyState extends State<MyFavoritesBody> {
  @override
  void initState() {
    super.initState();
    createList();
  }

  @override
  Widget build(BuildContext context) {
    //widget.favList = productList;

    widget.index = widget.favList.length;
    widget.totalListHeight = ((widget.index * widget.itemHeight)).toDouble();
    print(widget.totalListHeight);
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        height: widget.totalListHeight,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Dismissible(
                onDismissed: (val) {
                  setState(() {
                    widget.index--;
                    widget.totalListHeight =
                        ((index * widget.itemHeight)).toDouble();
                    widget.favList.remove(widget.favList[index]);
                  });
                },
                background: slideRightBackground(),
                secondaryBackground: slideLeftBackground(),
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: "hero-Item-${widget.favList[index].id}",
                    child: Material(
                      child: CardWidget(
                        height: 100,
                        childWidget: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10.0, top: 5.0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image:
                                        AssetImage(widget.favList[index].image),
                                  )),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.favList[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Utils.isDarkMode
                                              ? kDarkTextColorColor
                                              : kLightBlackTextColor,
                                          fontSize: kTitleFontSize)),
                                  Text(widget.favList[index].company,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: kGrayColor,
                                          fontSize: kSmallFontSize)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.favList[index].normalPrice,
                                    style: TextStyle(
                                        color: kAppColor,
                                        fontSize: kPriceFontSize),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: widget.favList.length,
        ),
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.redAccent.withOpacity(0.7),
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            Text(
              " ${ApplicationLocalizations.of(context).translate("un_fav")}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.redAccent.withOpacity(0.7),
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            Text(
              " ${ApplicationLocalizations.of(context).translate("un_fav")}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Future<void> createList() async {
    productList.forEach((element) async {
      // ignore: await_only_futures
      await widget.favList.add(element);
    });
  }
}
