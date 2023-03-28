import 'package:flutter/material.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/bottom_navigation_widget.dart';

class HomeDashBoard extends StatefulWidget {
  final Widget child;
  const HomeDashBoard({super.key, required this.child});

  @override
  State<HomeDashBoard> createState() => _HomeDashBoardState();
}

class _HomeDashBoardState extends State<HomeDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavigationDart(),
    );
  }
}
