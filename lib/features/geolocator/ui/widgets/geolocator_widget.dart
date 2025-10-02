import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeolocatorWidget {
  // 🛰️ Function to get current position safely and store in SharedPreferences
  static Future<Position?> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1️⃣ Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showMessage(context, "Please enable location services.");
      return null;
    }

    // 2️⃣ Check current permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showMessage(context, "Location permission denied.");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showMessage(
        context,
        "Permission permanently denied. Please enable it from settings.",
      );
      return null;
    }

    // 3️⃣ If everything is fine → return Position
    final position = await Geolocator.getCurrentPosition();

    // 💾 Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("latitude", position.latitude);
    await prefs.setDouble("longitude", position.longitude);

    return position;
  }

  // 📢 Helper to show messages
  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // 📥 Getter for latitude
  static Future<double?> getLatitude() async {
    final prefs = await SharedPreferences.getInstance();
    log("Latitude: ${prefs.getDouble("latitude")}");
    return prefs.getDouble("latitude");
  }

  // 📥 Getter for longitude
  static Future<double?> getLongitude() async {
    final prefs = await SharedPreferences.getInstance();
    log("Longitude: ${prefs.getDouble("longitude")}");
    return prefs.getDouble("longitude");
  }
}
