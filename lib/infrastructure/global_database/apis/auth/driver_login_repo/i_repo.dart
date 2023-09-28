import 'dart:convert';
import 'dart:developer';

import 'package:ambulance_module/domain/api/endPoints.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';

import '../../../../../application/driver_login_modal/value_notifiers/value_notifiers.dart';
import '../../../../../domain/api/dio_client.dart';
import '../../../../../domain/encryption/aes_encryption.dart';
import '../../../../local_database/secured_shared_preference/secured_shared_preference.dart';

abstract class IDriverLoginRepo {
  factory IDriverLoginRepo() = DriverLoginrRpository;

  postDriverLoginService();
}

class DriverLoginrRpository implements IDriverLoginRepo {
  @override
  postDriverLoginService() async {
    try {
      FlutterLocalSecuredStorage securedStorageinstance =
          FlutterLocalSecuredStorage();

      DioClient dioClient = DioClient(Dio());
      var hospitalID = await securedStorageinstance.read("Hospital_Id");
      log(hospitalID.toString());
      print(hospitalID);
      final mobileDeviceIdentifier =
          await MobileDeviceIdentifier().getDeviceId();
          String encoded = base64.encode(utf8.encode(mobileDeviceIdentifier.toString()));


      var body = await EncryptionDecryption.encryptAES(
          '''{"PhoneNumber":"${DriverLoginModalValueLisnableBuilders.username.value}","Password":"${DriverLoginModalValueLisnableBuilders.password.value}","Hospitals":"56","FCM":null,"DeviceID":"abcd"}''');
      //  var body="";

      var bodyDecrypted = EncryptionDecryption.decryptAES(body);
      log("Body :   $bodyDecrypted");

      //  body ="3xYVSGyvqflu+Tag15r7e1aPKNMJGoh+nxssazvpInJ992XQ08S2fd7egVWVThz+u0mXHu46WSa1wXhHlu0qG78pRyDi17OTmIpd6pJ4QVGuICDBHMdMYmk9cF9J2OqAmCovOaQWSA3DS4mOXkge5A==";
      var responce = await dioClient.request(
          endPoint: EndPoint.driverLogin, data: {"Value": body.base64});
      var decrypt =
          EncryptionDecryption.decryptAES(Encrypted.from64(responce.data));
      var json = jsonDecode(decrypt);
      var token = json['Token'].toString();
      log("++++++++++++++++++++++++++++++++++++++++");
      log(token.toString());

      await securedStorageinstance.write("AUTH_TOKEN", token.toString());
      String newString = token.substring(token.length - 14);
      String last14 = newString;
      await securedStorageinstance.write("KEY", "$last14$hospitalID");

      var iv = reverseString("$last14$hospitalID");

      await securedStorageinstance.write("IV", "$iv");

      log(last14);

      return json['status'].toString();

      // await securedStorageinstance.write("AUTH_TOKEN", token);
    } catch (e) {
      log(e.toString());
    }
  }
}

String reverseString(String input) {
  String reversed = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}
