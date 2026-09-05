import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:reyy_cinema/features/bioskop/services/mapbox_directions_service.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_map_current_location_marker.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_map_destination_marker.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_map_eta_banner.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/network/environment.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';
import 'package:reyy_cinema/widget/image_load.dart';

//TODO: All Logic must be move after engine implementation

class WBioskopMap extends StatefulWidget {
  const WBioskopMap({
    super.key,
    required this.cinemaName,
    required this.destination,
  });

  final String cinemaName;
  final LatLng destination;

  @override
  State<WBioskopMap> createState() => _WBioskopMapState();
}

class _WBioskopMapState extends State<WBioskopMap> {
  final mapController = MapController();
  final directionsService = MapboxDirectionsService();

  LatLng? currentLocation;
  List<LatLng> routePoints = [];
  int? etaMinutes;
  bool isLoadingRoute = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadCurrentLocationAndRoute();
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Future<bool> ensureLocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        CustomSnackbar.error(
          context,
          'Aktifkan GPS dulu ya',
          title: 'Lokasi Off',
        );
      }
      return false;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      if (mounted) {
        CustomSnackbar.error(
          context,
          'Izinkan akses lokasi untuk lihat rute',
          title: 'Izin Ditolak',
        );
      }
      return false;
    }

    return true;
  }

  Future<void> loadCurrentLocationAndRoute() async {
    if (isLoadingRoute) return;

    final allowed = await ensureLocationPermission();
    if (!allowed) return;

    setState(() => isLoadingRoute = true);

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      final origin = LatLng(position.latitude, position.longitude);
      final route = await directionsService.fetchDrivingRoute(
        origin: origin,
        destination: widget.destination,
      );

      if (!mounted) return;

      setState(() {
        currentLocation = origin;
        routePoints = route.points;
        etaMinutes = route.durationMinutes;
        isLoadingRoute = false;
      });

      fitRouteBounds(origin, widget.destination, route.points);
    } catch (error) {
      if (!mounted) return;
      setState(() => isLoadingRoute = false);
      CustomSnackbar.error(
        context,
        'Gagal ambil lokasi / rute',
        title: 'Error',
      );
    }
  }

  Future<void> onTapCurrentLocation() => loadCurrentLocationAndRoute();

  void fitRouteBounds(LatLng origin, LatLng destination, List<LatLng> points) {
    final allPoints = <LatLng>[origin, destination, ...points];
    if (allPoints.length < 2) {
      mapController.move(origin, 14);
      return;
    }

    final bounds = LatLngBounds.fromPoints(allPoints);
    mapController.fitCamera(
      CameraFit.bounds(
        bounds: bounds,
        padding: const EdgeInsets.fromLTRB(48, 80, 48, 100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: widget.destination,
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/mapbox/light-v11/tiles/256/{z}/{x}/{y}@2x'
                    '?access_token={accessToken}',
                additionalOptions: const {'accessToken': mapBoxToken},
                userAgentPackageName: 'com.reyy_cinema',
              ),
              if (routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routePoints,
                      strokeWidth: 5,
                      color: AppColors.primaryPressed,
                      borderStrokeWidth: 2,
                      borderColor: AppColors.primary.withValues(alpha: 0.35),
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: widget.destination,
                    width: 160,
                    height: 72,
                    alignment: Alignment.topCenter,
                    child: WBioskopMapDestinationMarker(
                      cinemaName: widget.cinemaName,
                    ),
                  ),
                  if (currentLocation != null)
                    Marker(
                      point: currentLocation!,
                      width: 28,
                      height: 28,
                      child: const WBioskopMapCurrentLocationMarker(),
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: onTapCurrentLocation,
              child: isLoadingRoute
                  ? const Padding(
                      padding: EdgeInsets.all(4),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : ImageLoad(
                      src: Assets.icons.icCurrentLocation.path,
                      isAsset: true,
                      width: 56,
                      height: 56,
                    ),
            ),
          ),
          if (etaMinutes != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: WBioskopMapEtaBanner(etaMinutes: etaMinutes!),
            ),
        ],
      ),
    );
  }
}
