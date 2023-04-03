import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/models/popular_hotel_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class LocationCard extends StatelessWidget {
  PopularHotelModel e;
  LocationCard({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed(RouteNames.hotel, params: {"id": "${e.id}"}),
      child: Container(
        width: 180,
        height: 250,
        decoration: BoxDecoration(
          color: shimmerGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170,
                height: 170,
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: shimmerGrey),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Image.network(
                          e.images.toString(),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          filterQuality: FilterQuality.high,
                          width: 170,
                          height: 170,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 60,
                            height: 30,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: shimmerLightGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "\$ ${e.price}",
                                style: Theme.of(context).textTheme.titleMedium,
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 140,
                        child: Text(
                          e.name.toString(),
                          style: Theme.of(context).textTheme.labelMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Text("Cairo",
                      //     style: Theme.of(context).textTheme.labelSmall),

                      Row(
                        children: [
                          Text(
                            "${e.rating}",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          RatingBar.builder(
                            initialRating: double.parse(e.rating.toString()),
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
                  const Icon(
                    CupertinoIcons.heart,
                    size: 18,
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
