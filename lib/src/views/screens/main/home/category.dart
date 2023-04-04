import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  List images = [
    "agra.jpg",
    "bang.jpg",
    "bhopal.jpg",
    "delhi.jpg",
    "goa.jpg",
    "indore.jpg",
    "mumbai.jpg",
    "udaipur.jpg"
  ];
  List name = [
    "AGRA",
    "BANGLORE",
    "BHOPAL",
    "DELHI",
    "GOA",
    "INDORE",
    "MUMBAI",
    "UDAIPUR"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.goNamed(RouteNames.cityList, params: {"city": name[index]});
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 190, 189, 189),
                      offset: Offset.zero,
                      blurRadius: 8)
                ]),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/${images[index]}"))),
                ),
                Container(
                  color: Colors.white,
                  // margin: EdgeInsets.only(left: 150),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    name[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        letterSpacing: 5,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
