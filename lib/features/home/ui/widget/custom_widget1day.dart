import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/ui/widget/InfoCard.dart';
import 'package:weather_app/features/home/ui/widget/details_data.dart';
import 'package:weather_app/features/home/ui/widget/weatherHourCard.dart';

import '../../bussiness_logic/home_cubit.dart';
import '../../bussiness_logic/home_state.dart';

class CustomWidget1day extends StatelessWidget {
  const CustomWidget1day({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const CircularProgressIndicator();
        }
        if (state is HomeError) {
          return Text(state.message);
        }
        if (state is HomeSuccess) {
          final humidity =
              state.weatherData.forecast.forecastday[0].day.avghumidity;

          return Column(
            children: [
              const SizedBox(height: 10),

              /// Main Weather
              Text(
                '  ${state.weatherData.current.tempC}°',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                state.weatherData.location.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
              Text(
                ' ${state.weatherData.forecast.forecastday[0].day.maxtempC} ° / ${state.weatherData.forecast.forecastday[0].day.mintempC} °',
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 40),

              /// Info cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoCard(
                      title: "Humidity",
                      mainValue: "$humidity%",
                      subValue: DateTimeUtils.getHumidityStatus(humidity),
                      icon: Icons.water_drop,
                    ),
                    InfoCard(
                      title: "Wind",
                      mainValue: "${state.weatherData.current.windKph} km/h",
                      subValue: state.weatherData.current.windDir,
                      icon: Icons.air,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Bottom container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateTimeUtils.getDayName(
                            state.weatherData.forecast.forecastday[0].date,
                          ),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateTimeUtils.getFormattedDate(
                            state.weatherData.location.localtime,
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// Hourly forecast row (scrollable)
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state
                            .weatherData
                            .forecast
                            .forecastday[0]
                            .hour
                            .length,
                        itemBuilder: (context, index) {
                          final hourData = state
                              .weatherData
                              .forecast
                              .forecastday[0]
                              .hour[index];
                          return WeatherHourCard(
                            temp: '${hourData.tempC}°C',
                            time: hourData.time.split(" ")[1],
                            icon: hourData.condition.icon,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
