import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/notification_body.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notification_screen";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: NotificationBody(),
      title: "Notifications",
    );
  }
}
