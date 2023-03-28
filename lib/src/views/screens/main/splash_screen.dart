import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final List _images = [
    "assets/images/talk1.png",
    "assets/images/seeFar.png",
    "assets/images/mountain.png",
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
            child: Container(
              margin: const EdgeInsets.only(top: 90, left: 30, right: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trips Jungle",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(
                          width: 200,
                          child: Text("datadafcvcsdvjdsbvcisuyuadcvhb"))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
