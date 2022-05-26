// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      final status = await Permission.locationWhenInUse.request();
      if (status == PermissionStatus.granted) {
        Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.best)
            .timeout(const Duration(seconds: 15));

        latitude = position.latitude;
        longitude = position.longitude;
        print('Permission granted');
      } else if (status == PermissionStatus.denied) {
        print(
            'Denied. Show a dialog with a reason and again ask for the permission.');
      } else if (status == PermissionStatus.permanentlyDenied) {
        print('Take the user to the settings page.');
      }
    } catch (e) {
      log('Something goes wrong: $e');
    }
  }
}
