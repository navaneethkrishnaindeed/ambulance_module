import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

abstract class Responcive {

  static ScreenType screenType(BuildContext context) {

    if (MediaQuery.of(context).size.width < 550) {

      return ScreenType.mobile;

    } else if (MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 550) {

      return ScreenType.tablet;
      
    } else {
      return ScreenType.desktop;
    }
  }
}
