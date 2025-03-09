import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../ui/screens/screens.dart';
import '../../ui/views/views.dart';
import '../destinations/destinations.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: PrincipalDestinations.banking.path,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: PrincipalDestinations.banking.path,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  child: const BankingView(),
                  transitionsBuilder: (context, _, __, child) => child,
                ),
          ),
          GoRoute(
            path: PrincipalDestinations.promotions.path,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  child: const PromotionsView(),
                  transitionsBuilder: (context, _, __, child) => child,
                ),
          ),
          GoRoute(
            path: PrincipalDestinations.wallet.path,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  child: const WalletView(),
                  transitionsBuilder: (context, _, __, child) => child,
                ),
          ),
          GoRoute(
            path: PrincipalDestinations.profile.path,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  child: const ProfileView(),
                  transitionsBuilder: (context, _, __, child) => child,
                ),
          ),
        ],
      ),
    ],
  );
}
