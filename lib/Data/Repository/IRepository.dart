

import 'package:dellyshop/Data/HTTP_Helper/IHttp_Helper.dart';
import 'package:dellyshop/Data/Prefs_Helper/IPrefs_Helper.dart';
import 'package:dellyshop/Data/Repository/Repository.dart';

class IRepository implements Repository {
  IHttpHlper iHttpHlper = IHttpHlper();
  IprefsHelper iprefsHelper= IprefsHelper();
  IRepository(this.iHttpHlper, this.iprefsHelper);
}
