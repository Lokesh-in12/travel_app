// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/more_img_stack.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/overlay_btn.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/overview_card.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/review_card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class SingleLocation extends StatefulWidget {
  String id;
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
    print("id => ${widget.id}");
    await hotelsController.handleSingleHotel(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Obx(() {
      if (hotelsController.SingleHotel.value.length == 0) {
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
                                  .SingleHotel.value[0].images
                                  .toString()),
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.high,
                              alignment: Alignment.centerLeft
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
                            children: [
                              // OverLayButton(
                              //   icon: CupertinoIcons.heart,
                              //   mainCtx: context,
                              // )
                            ],
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
                        children: [
                          Text(
                            "Rating",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          RatingBar.builder(
                            initialRating: double.parse(hotelsController
                                .TabHotels.value[0].rating
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
                        children: [
                          Text(
                            "Charges",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text:
                                    // ignore: invalid_use_of_protected_member
                                    hotelsController.SingleHotel.value[0].price,
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            TextSpan(
                                text: "/day",
                                style: Theme.of(context).textTheme.labelLarge),
                          ])),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "About",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    hotelsController.SingleHotel.value[0].about.toString(),
                    style: Theme.of(context).textTheme.labelSmall,
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
