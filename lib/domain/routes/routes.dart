
import 'package:ambulance_module/presentation/screens/home/home.dart';
import 'package:ambulance_module/presentation/screens/splash_screen/splash_screen.dart';

import '../../presentation/components/modals/assign_ambulance_and_driver.dart';
import '../../presentation/screens/maps/google_maps.dart';

mixin RoutPaths {
  static const String splashScreen = "/SPLASH_SCREEN";
  static const String driverLoginScreen = "/DRIVER_LOGIN_SCREEN";
  static const String numPadScreen = "/NUM_PAD_SCREEN";
  static const String keyBoardScreen = "/KEY_BOARD_SCREEN";
  static const String assignDriverScreen = "/ASSIGN_DRIVER_AMBULANCE_MODAL";
  static const String ambulanceSearchModal = "/AMBULANCE_SEARCH_MODAL";
  static const String maps = "/MAPS";
}

abstract class GetNamedRouts {
  static getRouts() {
    return {
      RoutPaths.splashScreen: (context) => const SplashScreen(),
      RoutPaths.driverLoginScreen: (context) => const HomeScreen(),
      RoutPaths.assignDriverScreen: (context) => const AmbulanceSearchModal(),
      RoutPaths.maps: (context) =>  GoogleMapScreen(),
    };
  }
}
