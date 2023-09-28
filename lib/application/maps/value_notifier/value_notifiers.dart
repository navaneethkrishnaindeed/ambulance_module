import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class CurrentPositions {
  static ValueNotifier<double> currentLattitude = ValueNotifier(0);
  static ValueNotifier<double> currentLongitude = ValueNotifier(0); 
}

abstract class MapsTextEditingControllers{
  static ValueNotifier<TextEditingController> originController = ValueNotifier(TextEditingController());
  static ValueNotifier<TextEditingController> destinationController = ValueNotifier(TextEditingController());
}

abstract class GoogleMapsController{
  static Completer<GoogleMapController> controller = Completer();
}