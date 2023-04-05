// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/paragraphs.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class SingleLocation extends StatefulWidget {
  String? id;
  bool? popular;
  SingleLocation({super.key, required this.id, this.popular});

  @override
  State<SingleLocation> createState() => _SingleLocationState();
}

class _SingleLocationState extends State<SingleLocation>
    with TickerProviderStateMixin {
  final hotelsController = Get.find<HotelsController>();

  @override
  void initState() {
    super.initState();
    async();
  }

  Future<void> async() async {
    if (kDebugMode) {
      print("id => ${widget.id.runtimeType}");
    }
    await hotelsController.handleSingleHotel(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: invalid_use_of_protected_member
      print("singleData array => ${hotelsController.SingleHotel.value.length}");
      if (hotelsController.SingleHotel.value.length < 1) {
        return Scaffold(
          body: Center(
            child:
                LoadingAnimationWidget.fourRotatingDots(color: black, size: 40),
          ),
        );
      }
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: black,
              pinned: true,
              expandedHeight: 700,
              foregroundColor: white,
              leading: InkWell(
                onTap: () => context.goNamed(RouteNames.homeDiscover),
                child: Icon(
                  CupertinoIcons.left_chevron,
                ),
              ),
              title: Text("", style: Theme.of(context).textTheme.headlineSmall),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  // ignore: invalid_use_of_protected_member
                  hotelsController.SingleHotel.value[0].name.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                titlePadding: EdgeInsets.fromLTRB(50, 0, 0, 18),
                background: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 750,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(hotelsController
                                  // ignore: invalid_use_of_protected_member
                                  .SingleHotel
                                  // ignore: invalid_use_of_protected_member
                                  .value[0]
                                  .images
                                  .toString()),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            )),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width - 15,
                      bottom: 20,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 180,
                                  child: Text(""),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // ignore: invalid_use_of_protected_member
                            " Rating ${hotelsController.SingleHotel.value[0].rating}",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RatingBar.builder(
                            initialRating: double.parse(hotelsController
                                // ignore: invalid_use_of_protected_member
                                .SingleHotel
                                // ignore: invalid_use_of_protected_member
                                .value[0]
                                .rating
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
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Charges",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text:
                                    // ignore: invalid_use_of_protected_member
                                    "Rs ${hotelsController.SingleHotel.value[0].price}",
                                style: Theme.of(context).textTheme.titleSmall),
                            TextSpan(
                                text: "/day",
                                style: Theme.of(context).textTheme.titleSmall),
                          ])),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Paragraphs(
                    isThis: "About",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Paragraphs(
                    isThis: "Location",
                  )
                ]),
              ),
            )
          ],
        ),
      );
    });
  }
}
