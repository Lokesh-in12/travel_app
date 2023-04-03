import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';

// ignore: must_be_immutable
class Paragraphs extends StatelessWidget {
  String? isThis;
  Paragraphs({super.key, this.isThis});

  @override
  Widget build(BuildContext context) {
    final hotelsController = Get.find<HotelsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isThis.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          isThis == "About"
              // ignore: invalid_use_of_protected_member
              ? hotelsController.SingleHotel.value[0].about.toString()
              // ignore: invalid_use_of_protected_member
              : hotelsController.SingleHotel.value[0].location.toString(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
