// import 'dart:async';
// import 'dart:developer' ;
// import 'dart:math' as math;
// import 'dart:ui' as ui;

// import 'package:ambulance_module/domain/utils/screen_sizes.dart';
// import 'package:ambulance_module/presentation/components/modals/loading_modal.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:location/location.dart';
// // import 'package:sensors/sensors.dart';

// import '../../../application/home/value_notifiers/value_notiifers.dart';
// import '../../../application/maps/value_notifier/value_notifiers.dart';
// import '../../../infrastructure/global_database/google/get_directions.dart';

// class GoogleMapScreen extends StatefulWidget {
//   @override
//   State<GoogleMapScreen> createState() => GoogleMapScreenState();
// }

// class GoogleMapScreenState extends State<GoogleMapScreen> {
//   Set<Marker> _markers = Set<Marker>();
//   Set<Polyline> _polylines = Set<Polyline>();

//   //  List<double> gyroscopeValues = [0, 0, 0]; // Gyroscope data (x, y, z)
//   // List<StreamSubscription<dynamic>> streamSubscriptions =
//   //     <StreamSubscription<dynamic>>[];

//   int _polylineIdCounter = 1;
//   BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

//   final TextEditingController _sourceTextController = TextEditingController();
//   final TextEditingController _destinationTextController =
//       TextEditingController();

//           // Location location = Location();


//   static final CameraPosition _kGooglePlex = CameraPosition(
//       target: LatLng(CurrentPositions.currentLattitude.value,
//           CurrentPositions.currentLongitude.value),
//       zoom: 13,
//       tilt: 0);

//   var destinationlat = 0.0;
//   var destinationLng = 0.0;
//   double? rotation=65;

//   @override
//   void initState() {
//     //  showDialog(context: context, builder:(context) => LoadingModal(),);
//    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

//     configMap();

//     _setMarker(
//         LatLng(CurrentPositions.currentLattitude.value,
//             CurrentPositions.currentLongitude.value),
//         LatLng(destinationlat, destinationLng));

//     // Navigator.of(context).pop();
// // _initializeGyroscope();
 
//     super.initState();
//   }

  

//   Future<Uint8List> getImages(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetHeight: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
//         .buffer
//         .asUint8List();
//   }

//   void _setMarker(LatLng point, point2) async {
//     final Uint8List markIcons =
//         await getImages("assets/images/ambulance_top_bitmap.png", 110);
//     setState(() {
//       _markers.add(
//         Marker(
//             markerId: const MarkerId('marker'),
//             position: point,
//             icon: BitmapDescriptor.fromBytes(markIcons),
//             rotation: rotation!
//             ),
//       );

//       // _markers.add(
//       //   Marker(
//       //     markerId: const MarkerId('marker2'),
//       //     position: point2,
//       //   ),
//       // );
//     });
//   }

//   void _setPolyline(List<PointLatLng> points) {
//     final String polylineIdVal = 'polyline_$_polylineIdCounter';
//     _polylineIdCounter++;
//     _polylines.clear();
//     _polylines.add(
//       Polyline(
//         polylineId: PolylineId(polylineIdVal),
//         width: 5,
//         color: Colors.blue,
//         points: points
//             .map(
//               (point) => LatLng(point.latitude, point.longitude),
//             )
//             .toList(),
//       ),
//     );
//   }

//   configMap() async {
//     final GoogleMapController controller =
//         await GoogleMapsController.controller.future;
//     IGetDirectionRepo instance = IGetDirectionRepo();
//     var directions = await instance.getDirections(
//       origin: MapsFromTo.from.value,
//       destination: MapsFromTo.to.value,
//     );
//     _goToPlace(
//       directions['start_location']['lat'],
//       directions['start_location']['lng'],
//       directions['bounds_ne'],
//       directions['bounds_sw'],
//     );

//     destinationlat = directions['end_location']['lat'];
//     destinationLng = directions['end_location']['lng'];

//     controller.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//             target: LatLng(directions['start_location']['lat'],
//                 directions['start_location']['lng']),
//             tilt: 0,
//             zoom: 13.5,
//             bearing: 1),
//       ),
//     );
//     _setPolyline(directions['polyline_decoded']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // location.onLocationChanged.listen((LocationData locationData) {
//     //   setState(() {
//     //     rotation = locationData.heading;
//     //     // _markers.first.rotation=rotation;
//     //   });
//     // });
//   //  var dev= gyroscopeValues[1]*(math.pi / 180.0);
//             // // log("X-GYRO: ${gyroscopeValues[1]} and Radiant $dev");
//             // log("Roation:${rotation!
//             // // *math.pi / 180
//             // }");

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: _potraitView(context),
//     );
//   }

//   Widget _potraitView(BuildContext context) {
//     return SafeArea(
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 5,
//               right: 5,
//             ),
//             child: Column(
//               children: [
//                 // SizedBox(
//                 //   height:
//                 //       ScreenSizes(context).screenHeightFraction(percent: 20),
//                 // ),
//                 Expanded(
//                   child: GoogleMap(
//                     zoomControlsEnabled: false,
//                     compassEnabled: false,
//                     myLocationButtonEnabled: false,
//                     myLocationEnabled: false,
//                     mapType: MapType.normal,
//                     markers: _markers,
//                     polylines: _polylines,
//                     initialCameraPosition: _kGooglePlex,
//                     onMapCreated: (GoogleMapController controller) {
//                       GoogleMapsController.controller.complete(controller);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: ScreenSizes(context).screenHeight(),
//             width: ScreenSizes(context).screenWidth(),
//             child: Column(children: [
//               Container(
//                 margin: const EdgeInsets.only(left: 20, right: 20, top: 18,),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(18),
//                     color: Colors.white),
//                 height: ScreenSizes(context).screenHeightFraction(percent: 21.25
                
//                 ),
//                 width: ScreenSizes(context).screenWidth(),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                         height: ScreenSizes(context)
//                             .screenHeightFraction(percent: 2.4)),
//                     SizedBox(
//                         width: ScreenSizes(context)
//                             .screenWidthFraction(percent: 75),
//                         height: 40,
//                         child: TextFormField(
//                           controller: _sourceTextController,
//                           decoration: InputDecoration(
//                             contentPadding:const EdgeInsets.only(top: 5, left: 6),
//                             alignLabelWithHint: true,
//                             hintText: "Your Location",
//                             hintStyle:const TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.w400),
//                             prefixIcon:const Padding(
//                               padding: EdgeInsets.only(top: 2),
//                               // child: SizedBox(
//                               //   // width: 15,
//                               //   height: 20,
//                               //   child: SvgPicture.asset(
//                               //       "assets/images/location_icon.svg"),
//                               // ),
//                               child: Icon(
//                                 Icons.my_location_rounded,
//                                 size: 18,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             // focusColor: Colors.amber
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7),
//                                 borderSide:const BorderSide(
//                                     color:
//                                         ui.Color.fromARGB(255, 172, 170, 170))),
//                             // enabledBorder: OutlineInputBorder()
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7),
//                                 borderSide:const BorderSide(
//                                     color:
//                                         ui.Color.fromARGB(255, 172, 170, 170))),
//                           ),
//                         )),
//                     SizedBox(
//                       height:
//                           ScreenSizes(context).screenHeightFraction(percent: 2),
//                     ),
//                     SizedBox(
//                         width: ScreenSizes(context)
//                             .screenWidthFraction(percent: 75),
//                         height: 40,
//                         child: TextFormField(
//                           controller: _destinationTextController,
//                           decoration: InputDecoration(
//                             contentPadding:const EdgeInsets.only(top: 5, left: 6),
//                             alignLabelWithHint: true,
//                             hintText: "Destination...",
//                             hintStyle:const TextStyle(
//                                 color: ui.Color.fromARGB(255, 134, 133, 133),
//                                 fontWeight: FontWeight.w400),
//                             prefixIcon:const Icon(
//                               Icons.location_on_outlined,
//                               size: 18,
//                               color: Colors.red,
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7),
//                                 borderSide:const BorderSide(
//                                     color:
//                                         ui.Color.fromARGB(255, 172, 170, 170))),
//                             // enabledBorder: OutlineInputBorder()
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7),
//                                 borderSide:const BorderSide(
//                                     color:
//                                         ui.Color.fromARGB(255, 172, 170, 170))),
//                             //  Padding(
//                             //   padding: const EdgeInsets.all(8.0),
//                             //   child: SizedBox(
//                             //     width: 15,
//                             //     height: 20,
//                             //     child: SvgPicture.asset(
//                             //         "assets/images/destination_location.svg"),
//                             //   ),
//                             // ),
//                             // focusedBorder: OutlineInputBorder(

//                             //   borderRadius: BorderRadius.circular(15),
//                             // ),
//                             // enabledBorder: OutlineInputBorder(
//                             //   borderRadius: BorderRadius.circular(15),
//                             // ),
//                           ),
//                         )),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     // const Padding(
//                     //   padding: EdgeInsets.only(
//                     //     left: 15, right: 15
//                     //     ),
//                     //   child: Divider(color: Colors.black87,thickness: 0.7,),
//                     // ),
//                     Padding(
//                       padding: const EdgeInsets.only( right: 8),
//                       child: Row(
//                         children: [
//                           const Spacer(),
//                           GestureDetector(
//                             child: const Text(
//                               "Done",
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 22,
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               Container(
//                 // color: Colors.amber,
//                 height: ScreenSizes(context).screenHeightFraction(percent: 25),
//               )
//             ]),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _goToPlace(
//     // Map<String, dynamic> place,
//     double lat,
//     double lng,
//     Map<String, dynamic> boundsNe,
//     Map<String, dynamic> boundsSw,
//   ) async {
//     // final double lat = place['geometry']['location']['lat'];
//     // final double lng = place['geometry']['location']['lng'];

//     final GoogleMapController controller =
//         await GoogleMapsController.controller.future;

//     controller.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(target: LatLng(lat, lng), zoom: 12, tilt: 80),
//       ),
//     );

//     // controller.animateCamera(
//     //   CameraUpdate.newLatLngBounds(
//     //       LatLngBounds(
//     //         southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
//     //         northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
//     //       ),
//     //       25),
//     // );

//     _setMarker(LatLng(lat, lng), LatLng(destinationlat, destinationLng));
//   }
// }




// ---------------------------------------------------------------------------------------------



import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:ambulance_module/domain/utils/screen_sizes.dart';
import 'package:ambulance_module/presentation/components/modals/loading_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:sensors/sensors.dart';

import '../../../application/home/value_notifiers/value_notiifers.dart';
import '../../../application/maps/value_notifier/value_notifiers.dart';
import '../../../infrastructure/global_database/google/get_directions.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  State<GoogleMapScreen> createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();

  //  List<double> gyroscopeValues = [0, 0, 0]; // Gyroscope data (x, y, z)
  // List<StreamSubscription<dynamic>> streamSubscriptions =
  //     <StreamSubscription<dynamic>>[];

  int _polylineIdCounter = 1;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  final TextEditingController _sourceTextController = TextEditingController();
  final TextEditingController _destinationTextController =
      TextEditingController();

  // Location location = Location();

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(CurrentPositions.currentLattitude.value,
          CurrentPositions.currentLongitude.value),
      zoom: 13,
      tilt: 40);

  var destinationlat = 0.0;
  var destinationLng = 0.0;
  double? rotation = -90;

  @override
  void initState() {
    //  showDialog(context: context, builder:(context) => LoadingModal(),);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    configMap();

    _setMarker(
        LatLng(CurrentPositions.currentLattitude.value,
            CurrentPositions.currentLongitude.value),
        LatLng(destinationlat, destinationLng));

    // Navigator.of(context).pop();
// _initializeGyroscope();

    super.initState();
  }

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void _setMarker(LatLng point, point2) async {
    final Uint8List markIcons =
        await getImages("assets/images/ambulance_top_bitmap.png", 70);
    setState(() {
      _markers.add(
        Marker(
            markerId: const MarkerId('marker'),
            position: point,
            icon: BitmapDescriptor.fromBytes(markIcons),
            rotation: rotation!),
      );

      // _markers.add(
      //   Marker(
      //     markerId: const MarkerId('marker2'),
      //     position: point2,
      //   ),
      // );
    });
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;
    _polylines.clear();
    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 5,
        color: Colors.blue,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList(),
      ),
    );
  }

  configMap() async {
    final GoogleMapController controller =
        await GoogleMapsController.controller.future;
    IGetDirectionRepo instance = IGetDirectionRepo();
    var directions = await instance.getDirections(
      origin: MapsFromTo.from.value,
      destination: MapsFromTo.to.value,
    );
    _goToPlace(
      directions['start_location']['lat'],
      directions['start_location']['lng'],
      directions['bounds_ne'],
      directions['bounds_sw'],
    );

    destinationlat = directions['end_location']['lat'];
    destinationLng = directions['end_location']['lng'];

    // log("${directions['start_location']['lat']},${directions['start_location']['lng']}");

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(directions['start_location']['lat'],
                directions['start_location']['lng']),
            tilt: 80,
            zoom: 13.5,
            bearing: 1),
      ),
    );
    _setPolyline(directions['polyline_decoded']);
  }

  @override
  Widget build(BuildContext context) {
    // location.onLocationChanged.listen((LocationData locationData) {
    //   setState(() {
    //     rotation = locationData.heading;
    //     // _markers.first.rotation=rotation;
    //   });
    // });
    //  var dev= gyroscopeValues[1]*(math.pi / 180.0);
    // // log("X-GYRO: ${gyroscopeValues[1]} and Radiant $dev");
    // log("Roation:${rotation!
    // // *math.pi / 180
    // }");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _potraitView(context),
    );
  }

  Widget _potraitView(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Column(
              children: [
                // SizedBox(
                //   height:
                //       ScreenSizes(context).screenHeightFraction(percent: 20),
                // ),
                Expanded(
                  child: GoogleMap(
                    rotateGesturesEnabled: true,
                    trafficEnabled: true,
                    mapType: MapType.normal,
                    markers: _markers,
                    polylines: _polylines,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      GoogleMapsController.controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenSizes(context).screenHeight(),
            width: ScreenSizes(context).screenWidth(),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 18,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white),
                height:
                    ScreenSizes(context).screenHeightFraction(percent: 21.25),
                width: ScreenSizes(context).screenWidth(),
                child: Column(
                  children: [
                    SizedBox(
                        height: ScreenSizes(context)
                            .screenHeightFraction(percent: 2.4)),
                    SizedBox(
                        width: ScreenSizes(context)
                            .screenWidthFraction(percent: 75),
                        height: 40,
                        child: TextFormField(
                          controller: _sourceTextController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 5, left: 6),
                            alignLabelWithHint: true,
                            hintText: "Your Location",
                            hintStyle: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(top: 2),
                              // child: SizedBox(
                              //   // width: 15,
                              //   height: 20,
                              //   child: SvgPicture.asset(
                              //       "assets/images/location_icon.svg"),
                              // ),
                              child: Icon(
                                Icons.my_location_rounded,
                                size: 18,
                                color: Colors.blue,
                              ),
                            ),
                            // focusColor: Colors.amber
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color:
                                        ui.Color.fromARGB(255, 172, 170, 170))),
                            // enabledBorder: OutlineInputBorder()
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color:
                                        ui.Color.fromARGB(255, 172, 170, 170))),
                          ),
                        )),
                    SizedBox(
                      height:
                          ScreenSizes(context).screenHeightFraction(percent: 2),
                    ),
                    SizedBox(
                        width: ScreenSizes(context)
                            .screenWidthFraction(percent: 75),
                        height: 40,
                        child: TextFormField(
                          controller: _destinationTextController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 5, left: 6),
                            alignLabelWithHint: true,
                            hintText: "Destination...",
                            hintStyle: const TextStyle(
                                color: ui.Color.fromARGB(255, 134, 133, 133),
                                fontWeight: FontWeight.w400),
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Colors.red,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color:
                                        ui.Color.fromARGB(255, 172, 170, 170))),
                            // enabledBorder: OutlineInputBorder()
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color:
                                        ui.Color.fromARGB(255, 172, 170, 170))),
                            //  Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: SizedBox(
                            //     width: 15,
                            //     height: 20,
                            //     child: SvgPicture.asset(
                            //         "assets/images/destination_location.svg"),
                            //   ),
                            // ),
                            // focusedBorder: OutlineInputBorder(

                            //   borderRadius: BorderRadius.circular(15),
                            // ),
                            // enabledBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(15),
                            // ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(
                    //     left: 15, right: 15
                    //     ),
                    //   child: Divider(color: Colors.black87,thickness: 0.7,),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                          
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                // color: Colors.amber,
                height: ScreenSizes(context).screenHeightFraction(percent: 25),
              )
            ]),
          ),
        ],
      ),
    );
  }

  Future<void> _goToPlace(
    // Map<String, dynamic> place,
    double lat,
    double lng,
    Map<String, dynamic> boundsNe,
    Map<String, dynamic> boundsSw,
  ) async {
    // final double lat = place['geometry']['location']['lat'];
    // final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller =
        await GoogleMapsController.controller.future;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12, tilt: 80),
      ),
    );

    // controller.animateCamera(
    //   CameraUpdate.newLatLngBounds(
    //       LatLngBounds(
    //         southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
    //         northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
    //       ),
    //       25),
    // );

    _setMarker(LatLng(lat, lng), LatLng(destinationlat, destinationLng));
  }
}
