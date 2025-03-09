import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

import '../../../router/destinations/bottom_nav_bar_destinations.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          selectedIndex = value;
          context.go(BottomNavBarDestination.values[value].destination.path);
          setState(() {});
        },
        destinations:
            BottomNavBarDestination.values
                .map(
                  (destination) => NavigationDestination(
                    icon: Icon(destination.icon),
                    selectedIcon: Icon(
                      destination.selectedIcon,
                      color: AppColors.purple,
                    ),
                    label: destination.name,
                  ),
                )
                .toList(),
      ),
    );
  }
}
