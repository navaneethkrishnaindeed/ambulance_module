import 'package:ambulance_module/application/splash_screen/splashscreen_bloc.dart';
import 'package:ambulance_module/domain/assets/vector_assets.dart';
import 'package:ambulance_module/domain/utils/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as g;
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<SplashscreenBloc>(context)
        .add(SplashscreenEvent.started(ctx: context));
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<SplashscreenBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Container _buildUI(BuildContext context) {
    return Container(                 
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 40),
        height: ScreenSizes(context).screenHeight(),
        width: ScreenSizes(context).screenWidth(),
        color: const Color.fromARGB(255, 248, 193, 171),
        child: VectorAssets.splashScreenAssets.grapesLogo);
  }
}
