// 🟢 Current Weather
import 'condition.dart';

class Current {
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windKph;
  final String windDir;
  final int humidity;
  final double feelsLikeC;
  final double uv;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.windDir,
    required this.humidity,
    required this.feelsLikeC,
    required this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdated: json['last_updated'],
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDir: json['wind_dir'],
      humidity: json['humidity'],
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
    );
  }
}
