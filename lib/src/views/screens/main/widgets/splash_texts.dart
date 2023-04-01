import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/views/screens/main/widgets/button.dart';

// ignore: must_be_immutable
class SplashText extends StatelessWidget {
  String? head;
  String? desc;
  String? title;
  int? ind;
  SplashText({super.key, this.title, this.head, this.desc, this.ind});

  @override
  Widget build(BuildContext context) {
    return Container(                           
      margin: const EdgeInsets.only(top: 90, left: 30, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                head.toString(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  title.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  child: Text(
                    desc.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
              const SizedBox(
                height: 20,
              ),
              CustoButton(
                width: 100,
                height: 40,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(3, (dots) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                width: 10,
                height: ind == dots ? 35 : 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ind == dots ? ligthViolet : black,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
