import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';
import '../../../constant.dart';

class CustomCarouselSlider extends StatefulWidget {
  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 2,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        "1231 **** **** 3423",
        "9854 **** **** 3495",
        "3544 **** **** 2344"
      ].map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kAppColor,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/creditCardVisa.png")),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          ApplicationLocalizations.of(context)
                              .translate("card_number"),
                          style: TextStyle(fontSize: kMicroFontSize)),
                      Text(
                        i,
                        style: TextStyle(fontSize: kNormalFontSize),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  ApplicationLocalizations.of(context)
                                      .translate("expiration"),
                                  style: TextStyle(fontSize: kMicroFontSize)),
                              Text("12/22",
                                  style:
                                      TextStyle(fontSize: kSubTitleFontSize)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  ApplicationLocalizations.of(context)
                                      .translate("card_name"),
                                  style: TextStyle(fontSize: kMicroFontSize)),
                              Text("William Stone",
                                  overflow: TextOverflow.clip,
                                  style:
                                      TextStyle(fontSize: kSubTitleFontSize)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
