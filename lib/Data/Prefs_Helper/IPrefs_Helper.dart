
import 'package:dellyshop/Core/Consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Prefs_Helper.dart';

class IprefsHelper implements PrefsHelper{

@override
  Future<SharedPreferences> getPrefs() async {
  return await SharedPreferences.getInstance();
}



  



  @override
  Future<bool> getislogin() async{
   return (await getPrefs()).getBool(S.islogin);
  }

  @override
  Future<String> gettoken() async{
  return (await getPrefs()).getString(S.token);
  }

  @override
  Future<void> setislogin(bool islogin) async{
   return (await getPrefs()).setBool(S.islogin, islogin);
  }

  @override
  Future<void> settoken(String token) async {
      return (await getPrefs()).setString(S.token, token);
  }


}