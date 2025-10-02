import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:weather_app/core/routing/routes.dart';
import 'package:weather_app/features/button_navigation/ui/screens/button_navigation_screen.dart';
import 'package:weather_app/features/home/ui/screen/home_screen.dart';
import 'package:weather_app/features/location/location_screen.dart';
import 'package:weather_app/features/onboarding/onboarding_screen.dart';
import 'package:weather_app/features/search/ui/search_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    page: () => const HomeScreen(),
    name: AppRoutes.home,
    transition: Transition.fade,
  ),
  GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
  GetPage(name: AppRoutes.search, page: () => SearchScreen()),
  GetPage(name: AppRoutes.location, page: () => LocationScreen()),
  GetPage(
    name: AppRoutes.buttonnavigation,
    page: () => ButtonNavigationbarScreen(),
  ),
];
