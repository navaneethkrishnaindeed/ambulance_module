import 'base_url.dart';

enum RequestType { get, post, put, patch, delete }

enum EndPoint {
  checkDatabaseConnectivity,
  preLoginAuthentication,
  driverLogin,
  getDriverDetails,
  
}

// ignore: non_constant_identifier_names
final BASE_URL = API_BaseURL.getBaseURL();

extension URLExtension on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.checkDatabaseConnectivity:
        return "$BASE_URL/api/Driver/CheckDatabaseConnectivity";
      case EndPoint.driverLogin:
        return "$BASE_URL/api/Driver/Login";
      case EndPoint.getDriverDetails:
        return "$BASE_URL/api/Driver/GetDriverDetails";
      case EndPoint.preLoginAuthentication:
        return "$BASE_URL/api/Driver/PreLoginAuthentication";
        

      default:
        throw Exception(["Endpoint not defined"]);
    }
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      case EndPoint.checkDatabaseConnectivity:
        requestType = RequestType.get;
        break;
      case EndPoint.driverLogin:
        requestType = RequestType.post;
        break;
      case EndPoint.getDriverDetails:
        requestType = RequestType.post;
        break;
      case EndPoint.preLoginAuthentication:
        requestType = RequestType.post;
    }
    return requestType;
  }
}

extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = true;
    switch (this) {
      case EndPoint.checkDatabaseConnectivity:
        shouldAdd = false;
        break;
      case EndPoint.driverLogin:
        shouldAdd = false;
        break;
      case EndPoint.preLoginAuthentication:
        shouldAdd = false;
        break;
      case EndPoint.getDriverDetails:
        shouldAdd = true;
        break;

      default:
        break;
    }

    return shouldAdd;
  }
}
