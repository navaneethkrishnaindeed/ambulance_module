import 'package:lottie/lottie.dart';

abstract class Globalstates{
  static Future<LottieComposition> composition = AssetLottie("assets/images/heart_loading.json").load();

}