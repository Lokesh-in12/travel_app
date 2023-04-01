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
    "assets/images/hotel1.png",
    "assets/images/hotel2.png",
    "assets/images/hotel3.jpg",
  ];

  final List _titles = [
    "Browse Hotels",
    "Want a 5 ⭐",
    "Confused where to stay?"
  ];

  final List _desc = [
    "Every city has its own popular hotles, proceed to surf them!",
    "Don't worry we got it , from bottom to 5 ⭐ we've got all!",
    "Try our latest alogorithm just to make you choose your hotel!. "
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
