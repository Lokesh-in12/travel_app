import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/core/consts/injections.dart';
import 'package:travel_app/core/router/router.dart';
import 'package:travel_app/core/themes/app_theme.dart';
import 'package:get/get.dart';

void main() async {
  Injections.inject();
  GoRouter router = MyAppRouterConfig.getRouter();
  runApp(MyApp(
    router: router,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          // routerConfig: MyAppRouterConfig.getRouter(),
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
        );
      },
    );
  }
}
