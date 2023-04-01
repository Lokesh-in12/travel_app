// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/more_img_stack.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/overlay_btn.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/overview_card.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/review_card.dart';

// ignore: must_be_immutable
class SingleLocation extends StatefulWidget {
  String id;
  SingleLocation({super.key, required this.id});

  @override
  State<SingleLocation> createState() => _SingleLocationState();
}

class _SingleLocationState extends State<SingleLocation>
    with TickerProviderStateMixin {
  final hotelsController = Get.find<HotelsController>();

  @override
  void initState() {
    super.initState();
    // async();
  }

  Future<void> async() async {
    await hotelsController.handleSingleHotel(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    if (kDebugMode) {
      print("id is => ${widget.id}");
    }
    // return Obx(() {
    //   if (kDebugMode) {
    //     // ignore: invalid_use_of_protected_member
    //     print("SingleData  => ${hotelsController.SingleHotel.value}");
    //   }
    //   if (hotelsController.isLoading.value) {
    //     return Scaffold(
    //       body: Center(
    //         child:
    //             LoadingAnimationWidget.fourRotatingDots(color: black, size: 30),
    //       ),
    //     );
    //   } else {
    // return SliverFab(
    //   floatingWidget: FloatingActionButton.extended(
    //       onPressed: () {}, label: Text("Book now")),
    //   expandedHeight: 700,
    //   slivers: [
    //     SliverAppBar(
    //       title: Text("title"),
    //       backgroundColor: white,
    //       expandedHeight: 700,
    //       pinned: true,
    //       foregroundColor: white,
    //       flexibleSpace: FlexibleSpaceBar(
    //         title: Text("title2"),
    //         background: Stack(
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                   image: DecorationImage(
    //                       image: NetworkImage(
    //                           "https://images.unsplash.com/photo-1678782078441-9e6c23a33cec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
    //                       fit: BoxFit.cover)),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //     SliverPadding(

    //       padding: EdgeInsets.all(20),
    //       sliver: SliverList(
    //         delegate: SliverChildListDelegate([
    //           Text(
    //             "dfuishhgggggggggggggd hsdevfyiesvhevdy ewests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very welcome!",
    //             style: Theme.of(context).textTheme.headlineSmall,
    //           )
    //         ]),
    //       ),
    //     )
    //   ],
    // );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: black,
            pinned: true,
            expandedHeight: 700,
            leading: Icon(
              CupertinoIcons.left_chevron,
              color: white,
              size: 40,
            ),
            title: Text("", style: Theme.of(context).textTheme.headlineSmall),
            flexibleSpace: FlexibleSpaceBar(
              title: Text("title 1"),
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1678782078441-9e6c23a33cec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter()

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  "dfuishhgggggggggggggd hsdevfyiesvhevdy ewests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I ne. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I ne. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I ne. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very ests are very welcome!This package was made mostly for use case I needed. If you fill it is missing any features or you have found a bug, pull requests are very welcome!",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
  // });
  // }
}


//**
//  return Scaffold(
//           backgroundColor: white,
//           body: Container(
//             width: double.maxFinite,
//             color: shimmerGrey,
//             child: SafeArea(
//               child: SingleChildScrollView(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(boxShadow: const [
//                         BoxShadow(
//                           color: Color.fromARGB(29, 117, 117, 117),
//                           blurRadius: 30,
//                           offset: Offset(0, 10),
//                         )
//                       ]),
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Stack(
//                           children: [
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width,
//                               height: 500,
//                               child: DecoratedBox(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                           // ignore: invalid_use_of_protected_member
//                                           "${hotelsController.SingleHotel.value[0].photos?[0].urlTemplate.toString().split("?")[0].toString()}?w=300&h=500"),
//                                       fit: BoxFit.fill,
//                                     )),
//                               ),
//                             ),
//                             Align(
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 15, horizontal: 10),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     OverLayButton(
//                                         icon: CupertinoIcons.left_chevron,
//                                         goBack: true,
//                                         mainCtx: context),
//                                     OverLayButton(
//                                       icon: CupertinoIcons.heart,
//                                       mainCtx: context,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               width: MediaQuery.of(context).size.width - 35,
//                               bottom: 20,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const SizedBox(
//                                           height: 80,
//                                         ),
//                                         SizedBox(
//                                           width: 180,
//                                           child: Text(
//                                             // ignore: invalid_use_of_protected_member
//                                             "${hotelsController.SingleHotel.value[0].title}",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .headlineLarge,
//                                             maxLines: 2,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         RichText(
//                                             text: TextSpan(children: [
//                                           TextSpan(
//                                               text:
//                                                   // ignore: invalid_use_of_protected_member
//                                                   "Rs ${hotelsController.SingleHotel.value[0].price!.displayPrice ?? "2000"}",
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .headlineMedium),
//                                           TextSpan(
//                                               text: "/day",
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .headlineSmall),
//                                         ]))
//                                       ],
//                                     ),
//                                   ),
//                                   //more images
//                                   SizedBox(
//                                     height: 220,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         MoreImgStack(
//                                             index: 1, hotelId: widget.id),
//                                         MoreImgStack(
//                                           index: 2,
//                                           hotelId: widget.id,
//                                         ),
//                                         MoreImgStack(
//                                             index: 3,
//                                             last: true,
//                                             hotelId: widget.id),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),

//                     //Outof stack

//                     SizedBox(
//                       height: 50,
//                       child: TabBar(
//                           controller: tabController,
//                           indicatorSize: TabBarIndicatorSize.label,
//                           unselectedLabelStyle:
//                               Theme.of(context).textTheme.titleMedium,
//                           labelStyle: Theme.of(context).textTheme.displayMedium,
//                           tabs: const [
//                             Tab(
//                               child: Text(
//                                 "Overview",
//                                 style: TextStyle(
//                                     color: black, fontFamily: 'Montserrat'),
//                                 // style: Theme.of(context).textTheme.bodySmall,
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 "Reviews",
//                                 style: TextStyle(
//                                     color: black, fontFamily: 'Montserrat'),
//                               ),
//                             ),
//                           ]),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       width: double.maxFinite,
//                       height: 270,
//                       child: TabBarView(
//                         controller: tabController,
//                         physics: AlwaysScrollableScrollPhysics(),
//                         children: [
//                           SingleChildScrollView(
//                             physics: const AlwaysScrollableScrollPhysics(),
//                             child: Container(
//                               margin: EdgeInsets.symmetric(horizontal: 40),
//                               width: double.maxFinite,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         //Duration
//                                         OverViewCard(
//                                           title: "Status",
//                                           desc: hotelsController
//                                                   .SingleHotel
//                                                   // ignore: invalid_use_of_protected_member
//                                                   .value[0]
//                                                   .rankingDetails
//                                                   ?.replaceAll("#", "")
//                                                   .replaceAll("<a>", "")
//                                                   .replaceAll("</a>", "") ??
//                                               "#5 in city",
//                                           icon: CupertinoIcons.chart_bar_square,
//                                         ),
//                                         const SizedBox(
//                                           width: 25,
//                                         ),
//                                         OverViewCard(
//                                             title: "Rating",
//                                             desc:
//                                                 // ignore: invalid_use_of_protected_member
//                                                 "${hotelsController.SingleHotel.value[0].rating} out of 5",
//                                             icon: CupertinoIcons.star_fill),
//                                       ]),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   //location_desc
//                                   Text(
//                                     // ignore: invalid_use_of_protected_member
//                                     "${hotelsController.SingleHotel.value[0].about?.title}",
//                                     style:
//                                         Theme.of(context).textTheme.labelMedium,
//                                   ),
//                                   SizedBox(
//                                     height: 50,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 40, vertical: 10),
//                               width: double.maxFinite,
//                               height: 300,
//                               child: ListView.builder(
//                                 // ignore: invalid_use_of_protected_member
//                                 itemCount: hotelsController.SingleHotel.value[0]
//                                     .reviews?.content?.length,
//                                 itemBuilder: (context, index) {
//                                   return ReviewCard(
//                                     // ignore: invalid_use_of_protected_member
//                                     e: hotelsController.SingleHotel.value[0]
//                                         .reviews!.content![index],
//                                   );
//                                 },
//                               )),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           floatingActionButton: FloatingActionButton.extended(
//               backgroundColor: black,
//               onPressed: () {},
//               label: Text("Book Now")),
//         );
// */