import 'package:ambulance_module/domain/utils/app_util.dart';
import 'package:encrypt/encrypt.dart';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:convert';

class EncryptionDecryption {
  static final key = encrypt.Key.fromUtf8(decodePublicKey());
  static final iv = encrypt.IV.fromUtf8(decodePublicIV());
  static final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: AESMode.cbc));

  static decodePublicKey() {
    final base64Str = AppUtil.appStrings.publicEncryptionKeys.publicKey;
    return utf8.decode(base64.decode(base64Str));
  }

  static decodePublicIV(){
    final base64Str =AppUtil.appStrings.publicEncryptionKeys.publicIv;
    return utf8.decode(base64.decode(base64Str));
  }
  

  static encryptAES(text) {
    return encrypter.encrypt(text, iv: iv);
  }

  static String decryptAES(text) {
    return encrypter.decrypt(text, iv: iv);
  }
}
