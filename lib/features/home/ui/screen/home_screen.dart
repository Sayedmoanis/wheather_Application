import 'package:flutter/material.dart';
import 'package:weather_app/features/home/ui/widget/custom_widget1day.dart';
import 'package:weather_app/features/home/ui/widget/custom_widget7day.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.7, 2],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF1D2671), Color.fromARGB(255, 173, 71, 153)],
          ),
        ),
        child: const SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CustomWidget1day(), CustomWidget7day()],
            ),
          ),
        ),
      ),
    );
  }
}
