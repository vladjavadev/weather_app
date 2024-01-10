import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:weather_app/exception/location_service_disabled.dart';

class LocationUtil {
  Location location = Location();

  Future<Map<String, double>> getLocation() async {
    try {
      Location location = Location();
      var _serviceEnabled = await location.serviceEnabled();
      if(!_serviceEnabled){
          throw GeoLocationServiceDisabled();
      }
      var currentLocation = await location.getLocation();
      double latitude = currentLocation.latitude!;
      double longitude = currentLocation.longitude!;

      return {'latitude': latitude, 'longitude': longitude};
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        throw Exception('Permission denied');
      } else if (e.code == 'SERVICE_DISABLED') {
        throw Exception('Location services are disabled');
      }
      throw Exception('Failed to get location');
    }
  }
}
