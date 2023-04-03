import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';

// ignore: must_be_immutable
class ReviewCard extends StatelessWidget {
  ReviewCard({super.key});

  final hotelsConroller = Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                  height: 40,
                  child: CircleAvatar(
                    backgroundColor: orange,
                    minRadius: 20,
                    backgroundImage: AssetImage("assets/images/user_img.png"),
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "user",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
