import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/router/destinations/route.dart';

import 'destinations.dart';

enum BottomNavBarDestination {
  banking(
    destination: PrincipalDestinations.banking,
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    name: 'Inicio',
  ),
  promotions(
    destination: PrincipalDestinations.promotions,
    icon: Icons.local_offer_outlined,
    selectedIcon: Icons.local_offer,
    name: 'Promos',
  ),
  wallet(
    destination: PrincipalDestinations.wallet,
    icon: Icons.account_balance_wallet_outlined,
    selectedIcon: Icons.account_balance_wallet,
    name: 'Billetera',
  ),
  profile(
    destination: PrincipalDestinations.profile,
    icon: Icons.account_circle_outlined,
    selectedIcon: Icons.account_circle,
    name: 'Tú',
  );

  final DestinationRoute destination;
  final IconData icon;
  final IconData selectedIcon;
  final String name;

  const BottomNavBarDestination({
    required this.destination,
    required this.icon,
    required this.selectedIcon,
    required this.name,
  });
}
