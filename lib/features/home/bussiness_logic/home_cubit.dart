import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/error/error_function.dart';
import 'package:weather_app/core/network/api_constant.dart';
import 'package:weather_app/features/home/bussiness_logic/home_state.dart';
import 'package:weather_app/features/home/data/repository/home_repo.dart';

import '../../geolocator/ui/widgets/geolocator_widget.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> getForecastWeather({int days = 1, String? cityName}) async {
    emit(HomeLoading());

    // ✅ لو lat/lon مش موجودين -> استخدم Cairo
    final String query;
    final lat = await GeolocatorWidget.getLatitude();
    final long = await GeolocatorWidget.getLongitude();
    log("Latitude: $lat, Longitude: $long");

    if (cityName != null) {
      query = cityName;
    } else {
      query = '$lat,$long';
    }

    final result = await homeRepo.getforcast(
      queries: {"key": ApiConstant.apiKey, "q": query, "days": days.toString()},
    );

    result.fold(
      (error) => emit(HomeError(mapFailureToMessage(error))),
      (data) => emit(HomeSuccess(data)),
    );
  }

  Future<void> get7ForecastWeather({int days = 3, String? cityName}) async {
    emit(HomeLoading());

    final String query;
    final lat = await GeolocatorWidget.getLatitude();
    final long = await GeolocatorWidget.getLongitude();
    if (cityName != null) {
      query = cityName;
    } else {
      query = '$lat,$long';
    }

    final result = await homeRepo.getforcast(
      queries: {"key": ApiConstant.apiKey, "q": query, "days": 3.toString()},
    );
    result.fold(
      (error) => emit(HomeError(mapFailureToMessage(error))),
      (data) => emit(HomeSuccess(data)),
    );
  }
}
