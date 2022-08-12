import 'dart:async';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:location_service/models/location_model.dart';

class LocationService {
  Location location = Location();
  late LocationModel currentLocation;

  StreamController<LocationModel> locationController =
      StreamController<LocationModel>.broadcast();

  Stream<LocationModel> get getData => locationController.stream;
  LocationService() {
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          locationController.add(LocationModel(
              latitude: locationData.latitude!.toDouble(),
              logitude: locationData.longitude!.toDouble()));
          print(locationData.latitude);
          print(locationData.longitude);
        });
      }
    });
  }

  Future<LocationModel> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      currentLocation = LocationModel(
          latitude: userLocation.latitude!.toDouble(),
          logitude: userLocation.longitude!.toDouble());
    } catch (e) {
      if (e is PlatformException) {
        // ignore: avoid_print
        print(e.message);
      }
    }
    return currentLocation;
  }
}
