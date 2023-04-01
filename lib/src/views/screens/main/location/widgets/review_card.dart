import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/models/single_hotel_model/single_hotel_model.dart';

// ignore: must_be_immutable
class ReviewCard extends StatelessWidget {
  Content e;
  ReviewCard({super.key, required this.e});

  final hotelsConroller = Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(" 005248 ${e.userProfile?.avatar?.urlTemplate}");
    }
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
                      e.title.toString(),
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
