import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/drawer_row.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 30),
          child: Column(
            children: [
              DrawerRow(
                name: "Your Profile",
                icon: CupertinoIcons.person,
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
