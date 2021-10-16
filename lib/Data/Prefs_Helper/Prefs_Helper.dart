import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefsHelper {
  Future<SharedPreferences> getPrefs();
  Future<void> settoken(String token);
  Future<void> setislogin(bool islogin);
  Future<String> gettoken();
  Future<bool> getislogin();
  Future<void> increasecartcount();
  Future<void> decreasecartcount();
  Future<int> getcartcount();
  Future<void> setIsEnglish(bool lang);
  Future<bool> getIsEnglish();
  Future<void> resetcartcount();
}
