import 'dart:developer';

import 'package:ambulance_module/domain/api/dio_client.dart';
import 'package:ambulance_module/domain/api/endPoints.dart';
import 'package:ambulance_module/domain/encryption/aes_encryption.dart';
import 'package:ambulance_module/domain/failures/failures.dart';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:dartz/dartz.dart';


abstract class ICheckDatabaseConnectivityRepo {
  factory ICheckDatabaseConnectivityRepo() = CheckDataBaseConnectionRepository;
 Future<Either<MainFailure,String>> checkConnection();
}

class CheckDataBaseConnectionRepository
    implements ICheckDatabaseConnectivityRepo {
  CheckDataBaseConnectionRepository();
  @override
  checkConnection() async {
    DioClient dio = DioClient(Dio());
   
    try {
       var resp = await dio.request(endPoint: EndPoint.checkDatabaseConnectivity);
      var sect = EncryptionDecryption.decryptAES(Encrypted.fromBase64(resp.toString()));
      // log(sect);
      // log("---------------------------------------");
      // var get=await EncryptionDecryption.encryptAES(sect.toString());
      // print( get.base64);
        return Right( sect);
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.serverFailure());
    }



  
    // log(resp.toString());
  }
}
