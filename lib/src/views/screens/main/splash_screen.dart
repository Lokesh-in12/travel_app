import 'package:flutter/material.dart';
import 'package:travel_app/src/views/screens/main/widgets/splash_texts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // HotelServices.getHotels("bhoapl");
  }

  final List _images = [
    "assets/images/talk1.png",
    "assets/images/seeFar.png",
    "assets/images/mountain.png",
  ];

  final List _titles = ["Jungle Trip", "Hiking Adevntures", "Mountaining"];

  final List _desc = [
    "Jungle Trips is what make you meet with new adventures",
    "Hiking on mountains makes you energitic",
    "Mountainig is not an easy task , but those who did it they are awesome."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  _images[index],
                ),
                alignment: Alignment.bottomLeft,
                fit: BoxFit.contain,
              )),
              child: SplashText(
                  head: "Discover",
                  title: _titles[index],
                  desc: _desc[index],
                  ind: index));
        },
      ),
    );
  }
}
