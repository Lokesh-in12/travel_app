import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/bottom_controller.dart';

class BottomNavigationDart extends StatefulWidget {
  const BottomNavigationDart({super.key});

  @override
  State<BottomNavigationDart> createState() => _BottomNavigationDartState();
}

class _BottomNavigationDartState extends State<BottomNavigationDart> {
  final bottomController = Get.find<BottomController>();
  void _onTap(int index) {
    bottomController.setPosition(index);
    switch (index) {
      case 0:
        context.goNamed(RouteNames.homeDiscover);
        break;
      case 1:
        context.goNamed(RouteNames.trending);
        break;
      case 2:
        context.goNamed(RouteNames.search);
        break;
      case 3:
        context.goNamed(RouteNames.profile);
        break;
      default:
        0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: white,
      elevation: 0,
      showUnselectedLabels: true,
      selectedItemColor: black,
      unselectedItemColor: lightGrey,
      type: BottomNavigationBarType.fixed,
      currentIndex: bottomController.position.value,
      onTap: (value) => _onTap(value),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            activeIcon: Icon(CupertinoIcons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            activeIcon: Icon(Icons.dashboard_outlined),
            label: 'Category'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            activeIcon: Icon(CupertinoIcons.search),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            activeIcon: Icon(CupertinoIcons.person),
            label: 'Profile'),
      ],
    );
  }
}
