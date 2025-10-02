import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bussiness_logic/home_cubit.dart';
import 'package:weather_app/features/home/bussiness_logic/home_state.dart';
import 'package:weather_app/features/home/ui/widget/7day_forcast.dart';
import 'package:weather_app/features/home/ui/widget/details_data.dart';

class CustomWidget7day extends StatelessWidget {
  const CustomWidget7day({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSuccess) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "3-Day Forecast",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                WeatherDayCard(
                  day: DateTimeUtils.getDayName(
                    state.weatherData.forecast.forecastday[0].date,
                  ),
                  temp:
                      "${state.weatherData.forecast.forecastday[0].day.avgtempC}°C",
                  icon: state
                      .weatherData
                      .forecast
                      .forecastday[0]
                      .day
                      .condition
                      .icon,
                ),
                WeatherDayCard(
                  day: DateTimeUtils.getDayName(
                    state.weatherData.forecast.forecastday[1].date,
                  ),
                  temp:
                      "${state.weatherData.forecast.forecastday[1].day.avgtempC}°C",
                  icon: state
                      .weatherData
                      .forecast
                      .forecastday[1]
                      .day
                      .condition
                      .icon,
                ),
                WeatherDayCard(
                  day: DateTimeUtils.getDayName(
                    state.weatherData.forecast.forecastday[2].date,
                  ),
                  temp:
                      "${state.weatherData.forecast.forecastday[2].day.avgtempC}°C",
                  icon: state
                      .weatherData
                      .forecast
                      .forecastday[2]
                      .day
                      .condition
                      .icon,
                ),
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
