import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/ProfileModel/ProfileModel.dart';
import 'package:dellyshop/screens/edit_profile/edit_profile_screen.dart';
import 'package:dellyshop/screens/last_view/last_view_screen.dart';
import 'package:dellyshop/screens/my_comments/my_comments_screen.dart';
import 'package:dellyshop/screens/my_favorites/my_favorites_screen.dart';
import 'package:dellyshop/screens/my_orders/my_orders_screen.dart';
import 'package:dellyshop/screens/notifications/notification_screen.dart';
import 'package:dellyshop/screens/settings/settings_screen.dart';
import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/normal_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_bloc.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  ProfileModel profileModel = ProfileModel();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(GetProfileEvent()),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (state is Error) {
            return Center(child: Text(state.error));
          }
          if (state is GetProfileState) {
            profileModel = state.profileModel;
          }
          return Container(
            margin: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Hero(
                      tag: "profile",
                      child: Material(
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/blank-portrait.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalTextWidget(
                              "${profileModel.name}",
                              Utils.isDarkMode
                                  ? kDarkTextColorColor
                                  : kBlackFontColor,
                              kNormalFontSize),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${profileModel.email}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: kLightBlackTextColor, fontSize: 14)),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(EditProfileScreen.routeName);
                            },
                            child: CardWidget(
                              height: 45.0,
                              childWidget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: kAppColor,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  NormalTextWidget(
                                      ApplicationLocalizations.of(context)
                                          .translate("edit_profile"),
                                      Utils.isDarkMode
                                          ? kDarkTextColorColor
                                          : kBlackFontColor,
                                      kNormalFontSize)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                buildCard(
                    ApplicationLocalizations.of(context).translate("last_view"),
                    Icons.access_time, () {
                  Navigator.of(context).pushNamed(LastViewScreen.routeName);
                }),
                SizedBox(
                  height: 10.0,
                ),
                buildCard(
                    ApplicationLocalizations.of(context)
                        .translate("my_favorite"),
                    Icons.favorite, () {
                  Navigator.of(context).pushNamed(MyFavoriteScreen.routeName);
                }),
                SizedBox(
                  height: 10.0,
                ),
                buildCard(
                    ApplicationLocalizations.of(context).translate("my_orders"),
                    Icons.indeterminate_check_box, () {
                  Navigator.of(context).pushNamed(MyOdersScreen.routeName);
                }),
                SizedBox(
                  height: 10.0,
                ),
                buildCard(
                    ApplicationLocalizations.of(context)
                        .translate("my_comments"),
                    Icons.comment, () {
                  Navigator.of(context).pushNamed(MyCommentScreen.routeName);
                }),
                SizedBox(
                  height: 10.0,
                ),
                buildCard(
                    ApplicationLocalizations.of(context)
                        .translate("notifications"),
                    Icons.notifications, () {
                  Navigator.of(context).pushNamed(NotificationScreen.routeName);
                }),
                SizedBox(
                  height: 10.0,
                ),
                buildCard(
                    ApplicationLocalizations.of(context).translate("settings"),
                    Icons.settings, () {
                  Navigator.of(context).pushNamed(SettingsPage.routeName);
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  buildCard(String text, IconData icon, GestureTapCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: CardWidget(
          childWidget: ListTile(
            title: NormalTextWidget(
                text,
                Utils.isDarkMode ? kDarkTextColorColor : kLightBlackTextColor,
                kSubTitleFontSize),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: kAppColor,
            ),
            leading: Container(
              child: Icon(
                icon,
                size: 25,
                color: kAppColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
