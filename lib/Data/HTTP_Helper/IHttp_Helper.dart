

import 'package:connectivity/connectivity.dart';
import 'package:dellyshop/Core/AppExcepition.dart';
import 'package:dellyshop/Data/HTTP_Helper/Http_Helper.dart';
import 'package:http/http.dart' as http;

class IHttpHlper implements HttpHelper {
  final String _baseUrl = "http://meshwar.bitsblend.org/api";
  @override
  Future getrequest(String url) async {
    var responseJson;

    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        throw NoInternet("");
    }

    final response = await http.get(Uri.parse(_baseUrl + url));
    print(response.statusCode);
    print("here from http $url");

    responseJson = returnResponse(response);

    return responseJson;
  }

  @override
  Future postrequest(String url) async {
    var responseJson;
    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        throw NoInternet("");
    }

    final response = await http.post(Uri.parse(_baseUrl + url));
    responseJson = returnResponse(response);

    return responseJson;
  }

  @override
  returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseinjson = (response.body);

        return responseinjson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        print("error");
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NoInternet("Check your connection");
      case 500:
        throw InternalServerError("Internal Server Error");

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
