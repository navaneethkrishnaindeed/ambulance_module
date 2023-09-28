import '../DS_Version3/DS_colors/DS_colors.dart';
import '../constants/app_strings.dart';
import '../dependency_injection/injectable.dart';

abstract class AppUtil {
  static final appStrings = getItLocator<AppStrings>();
  static final appColors = getItLocator<DS_Colors>();
}

var j = AppUtil.appStrings.splashScreenStrings.mygrapes;
