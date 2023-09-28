import 'dart:developer';

import 'package:ambulance_module/application/maps/value_notifier/value_notifiers.dart';
import 'package:ambulance_module/domain/encryption/aes_encryption.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';

import 'domain/dependency_injection/injectable.dart';

import 'infrastructure/local_database/secured_shared_preference/secured_shared_preference.dart';
import 'presentation/app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  
  FlutterNativeSplash.remove();
  
var g =await  EncryptionDecryption.encryptAES('''{"PhoneNumber": "8606984848","Password":"Jesus@2021","Hospitals":"56","FCM":null,"DeviceID":"abcd"}''');

// var gh =await  EncryptionDecryption.encryptAES("{PhoneNumber: 8606984848}");
// var auth =await EncryptionDecryption.decryptAES(Encrypted.from64("PTanHbU32bFdK4IVb2ID9d9z3PU6cSuWulrmSU2adzEB3SHvv5Q4BHHayW/9wI/TNK6kb5ZYP74oH4LS3cBDC9/dFE/rQyFu2IUt4zWEXX5p4jrSJH8qk7qmd2iEix42d/p3ENcci8uJCCdDs9d8Lm858VpF4y4ReY/VF8YpJ2suiTsB4w0170pcWiK5aeLyu462SqqNqWljVdNscoZtVgutwGdPYP2zzH6NW7q0SvR2r7P5Xdvlwoh6v5+XGz/zaYpf0kKapm23jYy3b+dJ5edfTR28nAQ9yj5LGRQpCUv0EixXAD6xHt6KIpnTB7i3SY/U1cVkqy2U0MwZa3bcH0POCybubwP2Nd6I/tZ1FxpnI1I7DrwJvOZiiXFMDZa64kC1pkGoVxJbvFmUvHfbqUCf9QiLZxExE6y//zqEXS7waoEoqGCCQPu7WuUHYvySRNnorotCbuX1q5Jyq151m9zlSccXmjCTtg6giHzYeeedM1S96k2x6Htxn5dtuxXiWfsiqI/Sw9yN086wWlQ3cHnhwaS3sSRjP2cjiEvD1yBPbzcWdEO5bMph3OJcEpv/mM9IzEbOliKxHEKrBBu/AKclMGk/1aZ0NEkTUq3TCIaOuualjNfTsROSJkQck6yr"));
// var res =await EncryptionDecryption.decryptAES(Encrypted.from64("jXjgYPHrGs2FIKIzTf9djtf+sf0tet05/3yXokyTGm1Ik6dj60CGmS8H4vFhErovl8L+hGma04wSMrAPYN6Nrw=="));
// var tok=await EncryptionDecryption.encryptAES("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiI1NiIsInJvbGUiOiJEcml2ZXIiLCJuYmYiOjE2OTQ2MTc4NDQsImV4cCI6MTcyNjE1Mzg0NCwiaWF0IjoxNjk0NjE3ODQ0fQ.2JJxqWWKvSS0lXCHwn02VyiCW1axixkSU1KpPFyzdqA");
// var profile=await EncryptionDecryption.decryptAES(Encrypted.from64("E5mFF6lYY5ZKIHbU4A+fUkb2HzRtMN/vzz7v329L8Tt9dN1Ak0IRIcPMuViG9wITnj8GYAxUm1s2Q3+pLEbpP+t0IqFHY/X/f7W46L8E1xfp4PbHvSjBhqx8xaqFRuXZ"));


await Geolocator.requestPermission();

Position position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.high);
CurrentPositions.currentLattitude.value=position.latitude;
CurrentPositions.currentLongitude.value=position.longitude;

FlutterLocalSecuredStorage storage=FlutterLocalSecuredStorage();

if(await storage.getbool("AUTH_TOKEN")){

  String key=await storage.read("KEY");
  String iv=await storage.read("IV");

  String authToken=await storage.read("AUTH_TOKEN");

  log("AUTH_TOKEN: $authToken");

  log("KEY : $key");
  log("IV : $iv");
}

var placemark = await geo.placemarkFromCoordinates(position.latitude,position.longitude);

var post=placemark.first;

print(placemark);
print("${post.subThoroughfare},${post.subLocality},${post.subAdministrativeArea}");
placemark.forEach((element) => print(element.name),);

log(g.base64);
// logPrettyJsonString(profile);

  runApp(const MyApp());
}
