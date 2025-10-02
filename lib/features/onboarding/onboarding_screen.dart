import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:weather_app/core/routing/routes.dart';

import '../geolocator/ui/widgets/geolocator_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.7, 2],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF1D2671), Color.fromARGB(255, 173, 71, 153)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/first.png', height: 300),
              const SizedBox(height: 40),
              const Text(
                "Weather",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "ForeCasts",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFC107),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC107),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                onPressed: () async {
                  final pos = await GeolocatorWidget.determinePosition(context);
                  Get.toNamed(AppRoutes.buttonnavigation);
                  if (pos != null) {
                    print("Lat: ${pos.latitude}, Lng: ${pos.longitude}");
                  }
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
