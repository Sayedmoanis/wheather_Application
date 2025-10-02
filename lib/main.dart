import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weather_app/core/di/dependeny_injection.dart';
import 'package:weather_app/core/routing/app_router.dart';
import 'package:weather_app/core/routing/routes.dart';

import 'core/utils/bloc_observer.dart';
import 'features/home/bussiness_logic/home_cubit.dart';
import 'features/search/bussiness_logic/search_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Color(0xFF1D2671)),
  );
  setupGetit();

  runApp(const Weatherapp());
}

class Weatherapp extends StatelessWidget {
  const Weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<HomeCubit>()..getForecastWeather(days: 1),
        ),
        BlocProvider(
          create: (_) => getIt<HomeCubit>()..get7ForecastWeather(days: 3),
        ),

        BlocProvider(create: (_) => getIt<SearchCubit>()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.onboarding,
        getPages: routes,
      ),
    );
  }
}
