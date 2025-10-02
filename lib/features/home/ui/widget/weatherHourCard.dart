import 'package:flutter/material.dart';

class WeatherHourCard extends StatelessWidget {
  final String temp;
  final String time;
  final String icon;

  const WeatherHourCard({
    super.key,
    required this.temp,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetwork = icon.startsWith("http") || icon.startsWith("//");

    return Container(
      width: 60,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF7A42FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            temp,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13.9,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          isNetwork
              ? Image.network(
                  icon.startsWith("http") ? icon : "https:$icon",
                  height: 30,
                  width: 30,
                )
              : Image.asset(icon, height: 30, width: 50),
          const SizedBox(height: 8),
          Text(
            time,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
