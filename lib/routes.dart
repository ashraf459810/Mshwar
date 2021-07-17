import 'package:dellyshop/screens/add_adress/add_address_screen.dart';
import 'package:dellyshop/screens/add_credit_card/add_credit_cart_screen.dart';
import 'package:dellyshop/screens/all_product/all_product_screen.dart';
import 'package:dellyshop/screens/app_intro/app_intro_screen.dart';
import 'package:dellyshop/screens/cart/cart_screen.dart';
import 'package:dellyshop/screens/category_detail/category_detail_screen.dart';
import 'package:dellyshop/screens/edit_profile/edit_profile_screen.dart';
import 'package:dellyshop/screens/home/home_screen.dart';
import 'package:dellyshop/screens/last_view/last_view_screen.dart';
import 'package:dellyshop/screens/login/login_screen.dart';
import 'package:dellyshop/screens/my_comments/my_comments_screen.dart';
import 'package:dellyshop/screens/my_favorites/my_favorites_screen.dart';
import 'package:dellyshop/screens/my_orders/my_orders_screen.dart';
import 'package:dellyshop/screens/notifications/notification_screen.dart';
import 'package:dellyshop/screens/payment/payment_screen.dart';
import 'package:dellyshop/screens/progfile/porile_screen.dart';
import 'package:dellyshop/screens/register/register_screen.dart';
import 'package:dellyshop/screens/search/search_screen.dart';
import 'package:dellyshop/screens/select_credit_card/select_credit_card_screen.dart';
import 'package:dellyshop/screens/settings/settings_screen.dart';
import 'package:dellyshop/screens/splash/splash_screen.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  CustomBottomNavigationBar.routeName: (context) => CustomBottomNavigationBar(),
  AddAddressScreen.routeName: (context) => AddAddressScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SelectCreditCartScreen.routeName: (context) => SelectCreditCartScreen(),
  AddCreditCardScreen.routeName: (context) => AddCreditCardScreen(),
  LastViewScreen.routeName: (context) => LastViewScreen(),
  MyFavoriteScreen.routeName: (context) => MyFavoriteScreen(),
  MyOdersScreen.routeName: (context) => MyOdersScreen(),
  MyCommentScreen.routeName: (context) => MyCommentScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  SettingsPage.routeName: (context) => SettingsPage(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  CategoryDetailScreen.routeName: (context) => CategoryDetailScreen(),
  AllProductItemScreen.routeName: (context) => AllProductItemScreen(),
  AppIntroScreen.routeName: (context) => AppIntroScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
};
