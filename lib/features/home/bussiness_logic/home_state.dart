import 'package:weather_app/core/utils/model/main_weather_responce.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HomeSuccess extends HomeState {
  final WeatherResponse weatherData;

  HomeSuccess(this.weatherData);
}
