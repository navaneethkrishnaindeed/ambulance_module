import 'package:injectable/injectable.dart';

import '../dependency_injection/injectable.dart';

@injectable
class AppStrings {
  SplashScreenStrings splashScreenStrings = getItLocator<SplashScreenStrings>();
  DriverLoginScreenStrings driverLoginScreenStrings =
      getItLocator<DriverLoginScreenStrings>();
  PublicEncryptionKeys publicEncryptionKeys =
      getItLocator<PublicEncryptionKeys>();
  GeneralKeys generalKeys = getItLocator<GeneralKeys>();
}

@injectable
class GeneralKeys {
  final String mapsApiKey = "AIzaSyDUhOp5W-Wheo8jT9yQ34hkEsRJFP8Esdw";
}

@injectable
class SplashScreenStrings {
  final String mygrapes = "mygrapes";
}

@injectable
class DriverLoginScreenStrings {
  final String login = "Log in";
  final String headder = "Getting You Out Of Hurdle\n Is Our Responsibility ";
  final String start = "Start";
}

@injectable
class PublicEncryptionKeys {
  final String publicKey = "QU1CVUxBTkNFU0VDS0VZUw==";
  final String publicIv = "U1lFQ0tFU0VDTkFMVUJNQQ==";
}
