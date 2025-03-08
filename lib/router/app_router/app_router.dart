import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../ui/screens/screens.dart';
import '../routes/destinations.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: PrincipalDestinations.home.path,
    routes: [
      GoRoute(
        path: PrincipalDestinations.home.path,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
