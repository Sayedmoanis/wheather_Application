import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:weather_app/core/di/dependeny_injection.dart';
import 'package:weather_app/features/home/bussiness_logic/home_cubit.dart';
import 'package:weather_app/features/search/bussiness_logic/search_cubit.dart';
import 'package:weather_app/features/search/bussiness_logic/search_state.dart';

import '../../button_navigation/ui/screens/button_navigation_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchSuccess && state.results.isNotEmpty) {
            final result = state.results.first;

            // 🔹 ابعت للـ HomeCubit
            final homeCubit = context.read<HomeCubit>();
            homeCubit.get7ForecastWeather(cityName: result.name);

            Get.off(() => const ButtonNavigationbarScreen());
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.7, 2],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF1D2671), Color.fromARGB(255, 173, 71, 153)],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text(
                  "Search about city",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        hintText: "Write city name",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                      ),
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          log('value: $value');
                          context.read<SearchCubit>().searchCity(value);
                        }
                      },
                    ),
                  ),
                  if (state is SearchLoading) const CircularProgressIndicator(),
                  if (state is SearchFailure)
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
