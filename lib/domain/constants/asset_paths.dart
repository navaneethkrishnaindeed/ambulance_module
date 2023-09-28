// assets\images\hamburger.svg

import 'package:injectable/injectable.dart';

import '../dependency_injection/injectable.dart';

abstract class AssetPaths {
  static DriverLoginScreenAssetPaths driverLoginScreenAssetPaths =
      getItLocator<DriverLoginScreenAssetPaths>();
  static SplashScreenAssetPaths splashScreenAssetPaths =
      getItLocator<SplashScreenAssetPaths>();
  static AdminModuleAssetPaths adminModuleAssetPaths =
      getItLocator<AdminModuleAssetPaths>();
}

@injectable
class DriverLoginScreenAssetPaths {
  final String hamburgerIcon = "assets/images/hamburgerr.svg";
  final String lottieAnime = "assets/images/lottie_ambulance.json";
  final String settingLotie = "assets/images/settings_lottie.json";
  final String hamburgerLottie = "assets/images/hamburger_lottie.json";
}

@injectable
class SplashScreenAssetPaths {
  final String grapesLogo = "assets/images/grapesLogo.png";
}

@injectable
class AdminModuleAssetPaths {
  final String driverLottie = "assets/images/driver_ambulance_login.json";
}
