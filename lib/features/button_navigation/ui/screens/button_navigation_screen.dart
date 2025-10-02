import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/button_navigation/bussiness_logic/button_navigation_cubit.dart';
import 'package:weather_app/features/button_navigation/bussiness_logic/button_navigation_state.dart';

class ButtonNavigationbarScreen extends StatelessWidget {
  const ButtonNavigationbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => BottomNavigationCubit(),
        child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            final cubit = context.read<BottomNavigationCubit>();
            return Scaffold(
              backgroundColor: Colors.transparent,
              extendBody: true,
              body: cubit.screen[cubit.currentIndex],
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF7A42FF).withOpacity(0.1),
                          const Color(0xFF1D2671).withOpacity(0.9),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        navItem(
                          context: context,
                          index: 0,
                          icon: Icons.home,
                          label: 'Home',
                          isSelected: cubit.currentIndex == 0,
                        ),
                        navItem(
                          context: context,
                          index: 1,
                          icon: Icons.search,
                          label: 'Search',
                          isSelected: cubit.currentIndex == 1,
                        ),
                        navItem(
                          context: context,
                          index: 2,
                          icon: Icons.location_on,
                          label: 'location',
                          isSelected: cubit.currentIndex == 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget navItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final cubit = context.read<BottomNavigationCubit>();
    return GestureDetector(
      onTap: () => cubit.changeBottomState(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF7A42FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white60,
              size: 22,
            ),
            if (isSelected && label.isNotEmpty) ...[
              const SizedBox(width: 6),
              Text(label, style: const TextStyle(color: Colors.white)),
            ],
          ],
        ),
      ),
    );
  }
}
