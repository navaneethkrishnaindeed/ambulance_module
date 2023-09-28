import 'dart:convert';
import 'dart:developer';

import 'package:ambulance_module/domain/api/dio_client.dart';
import 'package:ambulance_module/domain/api/endPoints.dart';
import 'package:ambulance_module/domain/encryption/aes_encryption.dart';
import 'package:ambulance_module/domain/utils/app_util.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';

import '../../../../../domain/utils/pretty_json_logger.dart';
import '../../../../local_database/secured_shared_preference/secured_shared_preference.dart';

abstract class IPreLoginRepo {
  factory IPreLoginRepo() = PreLoginRepository;
  postPreLoginAuth({required String phoneNumber});
}

class PreLoginRepository implements IPreLoginRepo {
  @override
  postPreLoginAuth({required String phoneNumber}) async {
    try {
      DioClient dioClient = DioClient(Dio());
       FlutterLocalSecuredStorage securedStorageinstance = FlutterLocalSecuredStorage();

      var body = {"PhoneNumber": "$phoneNumber"};

      var enc = EncryptionDecryption.encryptAES(body.toString());

      log(enc.base64);

      var responce = await dioClient.request(
          endPoint: EndPoint.preLoginAuthentication,
          data: {"value": enc.base64});

      var decryptedValue = EncryptionDecryption.decryptAES(
          Encrypted.from64(responce.toString()));
      var jsonObj =jsonDecode(decryptedValue);
     
      //  await  securedStorageinstance.write("Hospital_Id", jsonObj[0]['Hospital_Id'].toString());
      await  securedStorageinstance.write("Hospital_Id", "56");

      log(" ");
      log(" ");
      log("----------------Decrypted------------------");
      log(" ");

// List<dynamic> jsonResponceDecryped=jsonDecode("{$decryptedValue}");
// print(decryptedValue);

      log(decryptedValue);
      log(" ");
      log(" ");

      
    } catch (e) {
      log("Exception found at Prelogin Auth : $e");
    }
  }
}


const v="AMBULANCESECKEYS    SYECKESECNALUBMA";