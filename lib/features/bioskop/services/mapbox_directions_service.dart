import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:reyy_cinema/network/environment.dart';

class MapboxRouteResult {
  const MapboxRouteResult({
    required this.points,
    required this.durationMinutes,
  });

  final List<LatLng> points;
  final int durationMinutes;
}

class MapboxDirectionsService {
  MapboxDirectionsService({Dio? dio}) : dio = dio ?? Dio();

  final Dio dio;

  Future<MapboxRouteResult> fetchDrivingRoute({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final url =
        'https://api.mapbox.com/directions/v5/mapbox/driving/'
        '${origin.longitude},${origin.latitude};'
        '${destination.longitude},${destination.latitude}';

    final response = await dio.get<Map<String, dynamic>>(
      url,
      queryParameters: {
        'geometries': 'geojson',
        'overview': 'full',
        'access_token': mapBoxToken,
      },
    );

    final routes = response.data?['routes'] as List<dynamic>?;
    if (routes == null || routes.isEmpty) {
      throw Exception('Rute tidak ditemukan');
    }

    final route = routes.first as Map<String, dynamic>;
    final durationSeconds = (route['duration'] as num?)?.toDouble() ?? 0;
    final geometry = route['geometry'] as Map<String, dynamic>?;
    final coordinates = geometry?['coordinates'] as List<dynamic>? ?? [];

    final points = coordinates.map((coord) {
      final pair = coord as List<dynamic>;
      return LatLng(
        (pair[1] as num).toDouble(),
        (pair[0] as num).toDouble(),
      );
    }).toList();

    return MapboxRouteResult(
      points: points,
      durationMinutes: (durationSeconds / 60).round().clamp(1, 999),
    );
  }
}
