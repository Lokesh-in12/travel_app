import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/core/consts/injections.dart';
import 'package:travel_app/core/router/router.dart';
import 'package:travel_app/core/themes/app_theme.dart';

void main() async {
  Injections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: MyAppRouterConfig.getRouter(),
        );
      },
    );
  }
}
