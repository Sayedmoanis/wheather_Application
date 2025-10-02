import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/features/button_navigation/bussiness_logic/button_navigation_cubit.dart';
import 'package:weather_app/features/home/ui/screen/home_screen.dart';
import 'package:weather_app/features/location/location_screen.dart';
import 'package:weather_app/features/search/ui/search_screen.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavInitial());

  int currentIndex = 0;
  List<Widget> screen = [
    const HomeScreen(),
    const SearchScreen(),
    LocationScreen(),
  ];
  void changeBottomState(int index) {
    currentIndex = index;
    emit(BottomNavSuccess());
  }
}
