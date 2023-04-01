import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';

// ignore: must_be_immutable
class MoreImgStack extends StatelessWidget {
  String? hotelId;
  int index;
  bool? last;
  String? title;
  MoreImgStack(
      {super.key, this.last, required this.index, this.title, this.hotelId});

  final hotelsController = Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(RouteNames.openImage, params: {
        // ignore: invalid_use_of_protected_member
        "title": hotelsController.SingleHotel.value[0].title.toString(),
        // ignore: invalid_use_of_protected_member
        "url": hotelsController.SingleHotel.value[0].photos![index].urlTemplate
            .toString()
            .split("?")[0]
            .toString(),
        "id": hotelId.toString()
      }),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 65,
            height: 65,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: shimmerLightGrey,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            width: 55,
            height: 55,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    // ignore: invalid_use_of_protected_member
                    image: NetworkImage(hotelsController.SingleHotel.value[0]
                                .photos![index].urlTemplate !=
                            null
                        // ignore: invalid_use_of_protected_member
                        ? "${hotelsController.SingleHotel.value[0].photos![index].urlTemplate.toString().split("?")[0].toString()}?w=300&h=500"
                        : " https://images.unsplash.com/photo-1574173803062-743fb38eb51d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1436&q=80"),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          last == true
              ? SizedBox(
                  width: 65,
                  height: 65,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: shimmerLightGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "+5",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
