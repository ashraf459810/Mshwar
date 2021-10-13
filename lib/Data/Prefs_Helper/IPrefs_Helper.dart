import 'package:dellyshop/Core/Consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Prefs_Helper.dart';

class IprefsHelper implements PrefsHelper {
  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> getislogin() async {
    return (await getPrefs()).getBool(S.islogin) ?? false;
  }

  @override
  Future<String> gettoken() async {
    return (await getPrefs()).getString(S.token);
  }

  @override
  Future<void> setislogin(bool islogin) async {
    return (await getPrefs()).setBool(S.islogin, islogin);
  }

  @override
  Future<void> settoken(String token) async {
    return (await getPrefs()).setString(S.token, token);
  }

  @override
  Future<int> getcartcount() async {
    return (await getPrefs()).getInt(S.cartcount) ?? 0;
  }

  @override
  Future<void> increasecartcount() async {
    int count = await getcartcount();
    print("here the count $count");
    count++;

    return (await getPrefs()).setInt(S.cartcount, count);
  }

  @override
  Future<void> decreasecartcount() async {
    int count = await getcartcount();
    count--;
    return (await getPrefs()).setInt(S.cartcount, count);
  }

  @override
  Future<bool> getIsEnglish() async {
    return (await getPrefs()).getBool(S.isenglish) ?? true;
  }

  @override
  Future<void> setIsEnglish(bool lang) async {
    return (await getPrefs()).setBool(S.isenglish, lang);
  }
}
