import 'package:dellyshop/Data/HTTP_Helper/IHttp_Helper.dart';
import 'package:dellyshop/Data/Prefs_Helper/IPrefs_Helper.dart';
import 'package:dellyshop/Data/Repository/Repository.dart';

class IRepository implements Repository {
  IHttpHlper iHttpHlper = IHttpHlper();
  IprefsHelper iprefsHelper = IprefsHelper();
  IRepository(this.iHttpHlper, this.iprefsHelper);

  dynamic getrequest(model([String response]), String url) async {
    String response = await iHttpHlper.getrequest(url);

    var decodeddata = model(response);

    return decodeddata;
  }

  dynamic postrequest(model([String response]), String url, [var body]) async {
    String response = await iHttpHlper.postrequest(url, body);
    var decodeddata = model(response);
    return decodeddata;
  }
}
