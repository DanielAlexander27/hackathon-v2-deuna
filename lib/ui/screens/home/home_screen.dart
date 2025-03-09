import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_v2_deuna/router/destinations/destinations.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

import '../../../router/destinations/bottom_nav_bar_destinations.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _displayAppBar
              ? AppBar(
                backgroundColor: AppColors.purple,
                actions: [AssistantIcon(), SizedBox(width: 10)],
              )
              : null,
      backgroundColor: Colors.white, // Color.fromRGBO(250, 250, 250, 1),
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withValues(alpha: 0.2),
              width: 0.75,
            ),
          ),
        ),
        child: widget.child,
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 10,
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.white,
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

  bool get _displayAppBar {
    final currentBottomNavBarDestination =
        BottomNavBarDestination.values[selectedIndex];

    return currentBottomNavBarDestination == BottomNavBarDestination.pontePilas;
  }
}

class AssistantIcon extends StatelessWidget {
  const AssistantIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        context.goNamed(Destinations.chatbot.path);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.smart_toy, color: Colors.white),
            Text('Asistente', style: TextStyle(color: Colors.white, height: 0)),
          ],
        ),
      ),
    );
  }
}
