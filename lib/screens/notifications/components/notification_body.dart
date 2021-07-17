import 'package:dellyshop/models/notification_model.dart';
import 'package:dellyshop/screens/notification_detail/notification_detail_screen.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../util.dart';

class NotificationBody extends StatefulWidget {
  @override
  _NotificationBodyState createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return notificationItem(
          i,
          () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NotificationDetailScreen(notifList[i])));
          },
        );
      },
      itemCount: notifList.length,
    );
  }

  Container notificationItem(int i, GestureTapCallback onTap) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        child: CardWidget(
          height: 80.0,
          childWidget: ListTile(
            title: NormalTextWidget(
                notifList[i].title,
                Utils.isDarkMode ? kDarkBlackTextColor : kBlackFontColor,
                kTitleFontSize),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                notifList[i].description,
                maxLines: 2,
                style: TextStyle(
                    color: Utils.isDarkMode
                        ? kDarkTextColorColor
                        : kLightBlackTextColor,
                    fontSize: kSubTitleFontSize),
                overflow: TextOverflow.clip,
              ),
            ),
            leading: Hero(
              tag: 'hero-tag-${notifList[i].id}',
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        notifList[i].image,
                      ),
                    )),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: kAppColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
