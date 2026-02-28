import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class GeoPermissionState extends Equatable {
  const GeoPermissionState();

  @override
  List<Object> get props => [];
}

class Initial extends GeoPermissionState {
  const Initial();
}

class GeoLocationDenied extends GeoPermissionState {
  const GeoLocationDenied();
}

class GeoLocationDeniedForever extends GeoPermissionState {
  const GeoLocationDeniedForever();
}

class LocationPermissionGranted extends GeoPermissionState {
  const LocationPermissionGranted(this.position);

  final Placemark? position;
}

class LocationPermissionDenied extends GeoPermissionState {
  const LocationPermissionDenied(this.permission);

  final Permission permission;
}

class LocationPermissionPermDenied extends GeoPermissionState {
  const LocationPermissionPermDenied(this.permission);
  final Permission permission;
}
