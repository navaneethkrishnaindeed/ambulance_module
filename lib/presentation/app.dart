import 'package:ambulance_module/domain/dependency_injection/injectable.dart';
import 'package:ambulance_module/domain/routes/routes.dart';
import 'package:ambulance_module/presentation/components/modals/loading_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/assign_ambulance_and_driver/bloc/assign_ambulance_with_driver_bloc.dart';
import '../application/driver_login_modal/bloc/driver_auth_form_validator_and_custom_keyboard_navigation_manager_bloc.dart';
import '../application/home/form_validator_and_custom_keyboard_navigtion_manager_bloc/form_validator_and_custom_keyboard_navigation_manager_bloc.dart';
import '../application/splash_screen/splashscreen_bloc.dart';
import '../domain/constants/debug_status.dart';
import 'components/modals/assign_ambulance_and_driver.dart';
import 'screens/home/home.dart';
import 'screens/splash_screen/test.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    preferedOrientationConfig(isTablet(context));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getItLocator<SplashscreenBloc>()),
        BlocProvider(create: (ctx) => getItLocator<FormValidatorAndCustomKeyboardNavigationManagerBloc>()),
        BlocProvider(create: (ctx) => getItLocator<DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc>()),
        BlocProvider(create: (ctx) => getItLocator<AmbulanceSearchModalBloc>())
      ],
      child: MaterialApp(
          routes: GetNamedRouts.getRouts(),
          debugShowCheckedModeBanner:false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: HomeScreen(),
          // home: LoadingModal(),
          initialRoute: RoutPaths.splashScreen
          ),
    );
  }
}

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.longestSide >= 950;
}

preferedOrientationConfig(bool isTablet) {
  if (isTablet) {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp
    ]);
  } else {
    return SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);
  }
}
