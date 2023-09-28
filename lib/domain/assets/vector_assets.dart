
import 'package:ambulance_module/domain/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class VectorAssets{
 static LoginScreenAssets get loginScreenAssets => LoginScreenAssets();
 static SplashScreenAssets get splashScreenAssets => SplashScreenAssets();
}


class LoginScreenAssets{
  final hamburgerIcon = SvgPicture.asset(AssetPaths.driverLoginScreenAssetPaths.hamburgerIcon,height: 30,);
}

class SplashScreenAssets{
  final grapesLogo = Image.asset(AssetPaths.splashScreenAssetPaths.grapesLogo);
}