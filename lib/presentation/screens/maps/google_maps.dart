import 'dart:async';
import 'dart:ui' as ui;

import 'package:ambulance_module/domain/utils/screen_sizes.dart';
import 'package:ambulance_module/presentation/components/modals/loading_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  int _polylineIdCounter = 1;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

 final TextEditingController _sourceTextController = TextEditingController();
 final TextEditingController _destinationTextController = TextEditingController();

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(CurrentPositions.currentLattitude.value,
          CurrentPositions.currentLongitude.value),
      zoom: 18,
      tilt: 0);

  var destinationlat = 0.0;
  var destinationLng = 0.0;

  @override
  void initState() {


    //  showDialog(context: context, builder:(context) => LoadingModal(),);


    configMap();

    _setMarker(
        LatLng(CurrentPositions.currentLattitude.value,
            CurrentPositions.currentLongitude.value),
        LatLng(destinationlat, destinationLng));

        // Navigator.of(context).pop();

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
        await getImages("assets/images/ambulance_top_bitmap.png", 80);
    setState(() {
      _markers.add(
        Marker(
            markerId: const MarkerId('marker'),
            position: point,
            icon: BitmapDescriptor.fromBytes(markIcons)),
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

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(directions['start_location']['lat'],
                directions['start_location']['lng']),
            tilt: 0,
            zoom: 15,
            bearing: 1),
      ),
    );
    _setPolyline(directions['polyline_decoded']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  height:
                      ScreenSizes(context).screenHeightFraction(percent: 20),
                ),
                SizedBox(
                  height:
                      ScreenSizes(context).screenHeightFraction(percent: 55),
                  child: Expanded(
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: false,
                      mapType: MapType.normal,
                      markers: _markers,
                      polylines: _polylines,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        GoogleMapsController.controller.complete(controller);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenSizes(context).screenHeight(),
            width: ScreenSizes(context).screenWidth(),
            child: Column(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Container(
                  color: const ui.Color.fromARGB(172, 215, 244, 248),
                  height:
                      ScreenSizes(context).screenHeightFraction(percent: 20),
                  width: ScreenSizes(context).screenWidth(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: ScreenSizes(context)
                            .screenWidthFraction(percent: 10),
                      ),
                      Column(
                        children: [
                          SizedBox(
                              height: ScreenSizes(context)
                                  .screenHeightFraction(percent: 3.1)),
                          SizedBox(
                              width: ScreenSizes(context)
                                  .screenWidthFraction(percent: 68),
                              height: 40,
                              child: TextFormField(
                                controller: _sourceTextController,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(top: 5, left: 6),
                                  alignLabelWithHint: true,
                                  hintText: "Source...",
                                  hintStyle: const TextStyle(
                                      color:
                                          ui.Color.fromARGB(255, 102, 101, 101),
                                      fontWeight: FontWeight.w400),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: SizedBox(
                                      width: 15,
                                      height: 20,
                                      child: SvgPicture.asset(
                                          "assets/images/location_icon.svg"),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: ScreenSizes(context)
                                .screenHeightFraction(percent: 2.5),
                          ),
                          SizedBox(
                              width: ScreenSizes(context)
                                  .screenWidthFraction(percent: 68),
                              height: 40,
                              child: TextFormField(
                                controller: _destinationTextController,
                                decoration: InputDecoration(
                                  contentPadding:
                                     const EdgeInsets.only(top: 5, left: 6),
                                  alignLabelWithHint: true,
                                  hintText: "Destination...",
                                  hintStyle:const TextStyle(
                                      color:
                                          ui.Color.fromARGB(255, 102, 101, 101),
                                      fontWeight: FontWeight.w400),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 15,
                                      height: 20,
                                      child: SvgPicture.asset(
                                          "assets/images/destination_location.svg"),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.directions,
                        size: 37,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),

             const Spacer(),
             Container(color: Colors.amber,height: ScreenSizes(context).screenHeightFraction(percent: 25),)
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
