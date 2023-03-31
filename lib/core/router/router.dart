import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/router/router_paths.dart';
import 'package:travel_app/src/views/screens/main/home/home_dashboard.dart';
import 'package:travel_app/src/views/screens/main/home/home_discover.dart';
import 'package:travel_app/src/views/screens/main/home/profile.dart';
import 'package:travel_app/src/views/screens/main/home/search.dart';
import 'package:travel_app/src/views/screens/main/home/trending.dart';
import 'package:travel_app/src/views/screens/main/location/single_location.dart';
import 'package:travel_app/src/views/screens/main/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

class MyAppRouterConfig {
  static GoRouter getRouter() {
    GoRouter router = GoRouter(
        // initialLocation: '/${RouteNames.homeDiscover}',
        // initialLocation: '/${RouteNames.search}',
        // initialLocation: '/${RouteNames.location}/275',
        initialLocation: RoutePaths.splashScreen,
        routes: [
          //splashRoute
          GoRoute(
            path: RoutePaths.splashScreen,
            name: RouteNames.splashScreen,
            builder: (context, state) => SplashScreen(),
          ),

          GoRoute(
            path: RoutePaths.hotel,
            name: RouteNames.hotel,
            builder: (context, state) =>
                SingleLocation(id: state.params['id']!),
          ),

          ShellRoute(
              navigatorKey: _shellNavigator,
              builder: (context, state, child) =>
                  HomeDashBoard(key: state.pageKey, child: child),
              routes: [
                GoRoute(
                  path: RoutePaths.homeDiscover,
                  name: RouteNames.homeDiscover,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: HomeDiscover());
                  },
                ),
                GoRoute(
                  path: RoutePaths.trending,
                  name: RouteNames.trending,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: TrendingScreen());
                  },
                ),
                GoRoute(
                  path: RoutePaths.search,
                  name: RouteNames.search,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: SearchScreen());
                  },
                ),
                GoRoute(
                  path: RoutePaths.profile,
                  name: RouteNames.profile,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: ProfileScreen());
                  },
                ),
              ]),
        ]);

    return router;
  }
}
