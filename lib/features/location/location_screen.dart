import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/features/geolocator/ui/widgets/geolocator_widget.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _defaultPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 14.4746,
  );

  double _currentZoom = 14.4746;
  CameraPosition? _currentPosition;

  @override
  void initState() {
    super.initState();
    _loadUserLocation();
  }

  Future<void> _loadUserLocation() async {
    final lat = await GeolocatorWidget.getLatitude();
    final long = await GeolocatorWidget.getLongitude();

    if (lat != null && long != null) {
      final newPos = CameraPosition(target: LatLng(lat, long), zoom: 14.4746);

      setState(() {
        _currentPosition = newPos;
      });

      final controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(newPos));
    }
  }

  Future<void> _zoomIn() async {
    final controller = await _controller.future;
    _currentZoom++;
    controller.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  Future<void> _zoomOut() async {
    final controller = await _controller.future;
    _currentZoom--;
    controller.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _currentPosition ?? _defaultPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          // ✅ أزرار Zoom
          Positioned(
            top: 50,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  mini: true,
                  onPressed: _zoomIn,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  mini: true,
                  onPressed: _zoomOut,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
