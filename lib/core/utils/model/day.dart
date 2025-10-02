import 'package:weather_app/core/utils/model/condition.dart';

class Day {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final double avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: (json['maxtemp_c'] as num).toDouble(),
      maxtempF: (json['maxtemp_f'] as num).toDouble(),
      mintempC: (json['mintemp_c'] as num).toDouble(),
      mintempF: (json['mintemp_f'] as num).toDouble(),
      avgtempC: (json['avgtemp_c'] as num).toDouble(),
      avgtempF: (json['avgtemp_f'] as num).toDouble(),
      maxwindMph: (json['maxwind_mph'] as num).toDouble(),
      maxwindKph: (json['maxwind_kph'] as num).toDouble(),
      totalprecipMm: (json['totalprecip_mm'] as num).toDouble(),
      totalprecipIn: (json['totalprecip_in'] as num).toDouble(),
      totalsnowCm: (json['totalsnow_cm'] as num).toDouble(),
      avgvisKm: (json['avgvis_km'] as num).toDouble(),
      avgvisMiles: (json['avgvis_miles'] as num).toDouble(),
      avghumidity: (json['avghumidity'] as num).toDouble(),
      dailyWillItRain: json['daily_will_it_rain'],
      dailyChanceOfRain: json['daily_chance_of_rain'],
      dailyWillItSnow: json['daily_will_it_snow'],
      dailyChanceOfSnow: json['daily_chance_of_snow'],
      condition: Condition.fromJson(json['condition']),
      uv: (json['uv'] as num).toDouble(),
    );
  }
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;

  final int isMoonUp;
  final int isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,

    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],

      isMoonUp: json['is_moon_up'],
      isSunUp: json['is_sun_up'],
    );
  }
}

class Hour {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final double snowCm;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      timeEpoch: json['time_epoch'],
      time: json['time'],
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      windMph: (json['wind_mph'] as num).toDouble(),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: (json['pressure_mb'] as num).toDouble(),
      pressureIn: (json['pressure_in'] as num).toDouble(),
      precipMm: (json['precip_mm'] as num).toDouble(),
      precipIn: (json['precip_in'] as num).toDouble(),
      snowCm: (json['snow_cm'] as num).toDouble(),
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: (json['feelslike_c'] as num).toDouble(),
      feelslikeF: (json['feelslike_f'] as num).toDouble(),
      windchillC: (json['windchill_c'] as num).toDouble(),
      windchillF: (json['windchill_f'] as num).toDouble(),
      heatindexC: (json['heatindex_c'] as num).toDouble(),
      heatindexF: (json['heatindex_f'] as num).toDouble(),
      dewpointC: (json['dewpoint_c'] as num).toDouble(),
      dewpointF: (json['dewpoint_f'] as num).toDouble(),
      willItRain: json['will_it_rain'],
      chanceOfRain: json['chance_of_rain'],
      willItSnow: json['will_it_snow'],
      chanceOfSnow: json['chance_of_snow'],
      visKm: (json['vis_km'] as num).toDouble(),
      visMiles: (json['vis_miles'] as num).toDouble(),
      gustMph: (json['gust_mph'] as num).toDouble(),
      gustKph: (json['gust_kph'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
    );
  }
}
