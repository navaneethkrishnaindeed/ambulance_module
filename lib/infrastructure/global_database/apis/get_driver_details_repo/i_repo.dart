import 'dart:developer';

import 'package:ambulance_module/domain/api/dio_client.dart';
import 'package:ambulance_module/domain/api/endPoints.dart';

import 'package:dio/dio.dart';

abstract class IGetDriverDetilasRepo {
  factory IGetDriverDetilasRepo() = GetDriverDetilsRepository;
   checkConnection();
}

class GetDriverDetilsRepository implements IGetDriverDetilasRepo {

  GetDriverDetilsRepository();
  @override
  checkConnection() async {
    DioClient dio = DioClient(Dio());
    var resp = await dio.request(endPoint: EndPoint.checkDatabaseConnectivity);
    log(resp.toString());
  }


}



