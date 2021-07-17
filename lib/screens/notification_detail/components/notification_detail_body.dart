import 'package:dellyshop/models/notification_model.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../util.dart';

// ignore: must_be_immutable
class NotificationBody extends StatefulWidget {
  NotificationModel _notificationModel;
  NotificationBody(this._notificationModel);
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  _NotificationBodyState createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
      key: widget._key,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor:
                Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
            iconTheme: IconThemeData(color: kAppColor),
            expandedHeight: 250.0,
            elevation: 0.1,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget._notificationModel.title,
                  style: TextStyle(
                      color: kAppColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700),
                ),
                background: Material(
                  child: Hero(
                    tag: 'hero-tag-${widget._notificationModel.id}',
                    child: Material(
                      child: new DecoratedBox(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                new AssetImage(widget._notificationModel.image),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 130.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: Utils.isDarkMode
                                    ? <Color>[
                                        new Color(0x00000000),
                                        new Color(0xFF000000),
                                      ]
                                    : <Color>[
                                        new Color(0x00FFFFFF),
                                        new Color(0xFFFFFFFF),
                                      ],
                                stops: [0.0, 1.0],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(0.0, 1.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, left: 20.0, right: 20.0),
                            child: Text(
                              widget._notificationModel.description,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                  color: Utils.isDarkMode
                                      ? kDarkTextColorColor
                                      : Colors.black54),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, left: 20.0, right: 20.0),
                            child: Text(
                              widget._notificationModel.description,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                  color: Utils.isDarkMode
                                      ? kDarkTextColorColor
                                      : Colors.black54),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
