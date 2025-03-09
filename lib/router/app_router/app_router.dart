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
    initialLocation: Destinations.pontePilas.path,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: Destinations.banking.path,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  child: const BankingView(),
                  transitionsBuilder: (context, _, __, child) => child,
                ),
          ),
          GoRoute(
            path: Destinations.promotions.path,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  child: const PromotionsView(),
                  transitionsBuilder: (context, _, __, child) => child,
                ),
          ),
          GoRoute(
            path: Destinations.pontePilas.path,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  child: const PontePilasView(),
                  transitionsBuilder: (context, _, __, child) => child,
                ),
            routes: [
              GoRoute(
                path: Destinations.chatbot.path,
                name: Destinations.chatbot.path,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) => ChatBotScreen(),
              ),
              GoRoute(
                path: Destinations.futureCalculator.path,
                name: Destinations.futureCalculator.path,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) => FutureCalculatorScreen(),
              ),
              GoRoute(
                path: Destinations.academy.path,
                name: Destinations.academy.path,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) => AcademyScreen(),
              ),
              GoRoute(
                path: Destinations.financeAnalysis.path,
                name: Destinations.financeAnalysis.path,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) => FinanceAnalysisScreen(),),
              GoRoute(
                path: Destinations.ecuInvest.path,
                name: Destinations.ecuInvest.path,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) => EcuInvest(),
              ),
            ],
          ),
          GoRoute(
            path: Destinations.wallet.path,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  child: const WalletView(),
                  transitionsBuilder: (context, _, __, child) => child,
                ),
          ),
          GoRoute(
            path: Destinations.profile.path,
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
