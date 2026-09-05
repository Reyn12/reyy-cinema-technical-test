import 'package:latlong2/latlong.dart';

class CinemaModel {
  const CinemaModel({
    required this.name,
    required this.address,
    required this.distanceLabel,
    required this.location,
  });

  final String name;
  final String address;
  final String distanceLabel;
  final LatLng location;
}
