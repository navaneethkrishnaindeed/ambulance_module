// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';


import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;

import '../../../domain/utils/app_util.dart';

abstract class IGetDirectionRepo {
  factory IGetDirectionRepo() = GetDirectionRepository;
  Future<Map<String, dynamic>> getDirections(
      {required String origin, required String destination});
}

class GetDirectionRepository implements IGetDirectionRepo {
  @override
  Future<Map<String, dynamic>> getDirections(
      {required String origin, required String destination}) async {
    final String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=${AppUtil.appStrings.generalKeys.mapsApiKey}';

    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);

    var results = {
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs'][0]['start_location'],
      'end_location': json['routes'][0]['legs'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decoded': PolylinePoints().decodePolyline(json['routes'][0]['overview_polyline']['points']),
    };

    log(response.body.toString());

    return results;
  }
}
