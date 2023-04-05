import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TabViewList extends StatelessWidget {
  TabViewList({super.key});

  final hotelsController = Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    if (hotelsController.isLoading.value) {
      return Center(
        child: LoadingAnimationWidget.fourRotatingDots(color: black, size: 35),
      );
    }
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: hotelsController.TabHotels.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => context.pushNamed(RouteNames.hotel,
              params: {"id": hotelsController.TabHotels[index].id.toString()}),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
            ),
            decoration: BoxDecoration(
                color: shimmerGrey, borderRadius: BorderRadius.circular(10)),

            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 230,
                  height: 230,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                              image: NetworkImage(
                                  "${hotelsController.TabHotels[index].images}"),
                              height: 130,
                              alignment: Alignment.center,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 210,
                  height: 60,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotelsController.TabHotels[index].name.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(hotelsController.TabHotels[index].rating
                                  .toString()),
                              RatingBar.builder(
                                initialRating: double.parse(hotelsController
                                    .TabHotels[index].rating
                                    .toString()),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 12,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  if (kDebugMode) {
                                    print(rating);
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            // child: ,
          ),
        );
      },
    );
  }
}
