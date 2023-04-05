import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/drawer_row.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  BuildContext homeCtx;
  MyDrawer({super.key, required this.homeCtx});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 30),
          child: Column(
            children: [
              InkWell(
                onTap: ()=> context.goNamed(RouteNames.profile),
                child: DrawerRow(
                  name: "Your Profile",
                  icon: CupertinoIcons.person,
                ),
              ),
              DrawerRow(
                name: "Favourite Locations",
                icon: CupertinoIcons.heart_solid,
                colr: red,
              ),
              DrawerRow(
                name: "Your Profile",
                icon: CupertinoIcons.person,
              ),
              DrawerRow(
                name: "Settings",
                icon: CupertinoIcons.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
