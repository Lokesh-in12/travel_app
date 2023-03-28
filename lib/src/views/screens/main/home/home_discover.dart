import 'package:flutter/material.dart';

class HomeDiscover extends StatelessWidget {
  const HomeDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeDiscoverPage"),
        elevation: 0.0,
      ),
      body: Center(child: Text("HomeDiscover Page")),
    );
  }
}
