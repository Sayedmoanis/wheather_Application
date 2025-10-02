import 'package:flutter/material.dart';

class WeatherDayCard extends StatelessWidget {
  final String day;
  final String icon;
  final String temp;

  const WeatherDayCard({
    super.key,
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetwork = icon.startsWith("http") || icon.startsWith("//");

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: const TextStyle(color: Colors.white, fontSize: 16)),
          isNetwork
              ? Image.network(
                  icon.startsWith("http") ? icon : "https:$icon",
                  height: 30,
                  width: 30,
                )
              : Image.asset(icon, height: 30, width: 50),
          Text(
            temp,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
