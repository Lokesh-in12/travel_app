// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/bottom_controller.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/drawer.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/location_card.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/tab_view_list.dart';

class HomeDiscover extends StatefulWidget {
  const HomeDiscover({super.key});

  @override
  State<HomeDiscover> createState() => _HomeDiscoverState();
}

class _HomeDiscoverState extends State<HomeDiscover>
    with TickerProviderStateMixin {
  List<Tab> tabs = <Tab>[
    const Tab(
      text: "Bhopal",
    ),
    const Tab(
      text: "Indore",
    ),
    const Tab(
      text: "Bengaluru",
    ),
    const Tab(
      text: "Mumbai",
    ),
    const Tab(
      text: "Delhi",
    ),
    const Tab(
      text: "Udaipur",
    ),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final hotelsController = Get.find<HotelsController>();
  final bottomController = Get.find<BottomController>();

  late TabController _controller;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    async();
    _controller = TabController(length: tabs.length, vsync: this);

    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        switch (_controller.index) {
          case 0:
            hotelsController.handleTabHotels("Bhopal");
            break;
          case 1:
            hotelsController.handleTabHotels("Indore");
            break;
          case 2:
            hotelsController.handleTabHotels("Bangalore");
            break;
          case 3:
            hotelsController.handleTabHotels("Mumbai");
            break;
          case 4:
            hotelsController.handleTabHotels("Delhi");
            break;
          case 5:
            hotelsController.handleTabHotels("Udaipur");
            break;
          default:
        }
      }
    });
  }

  Future<void> async() async {
    await hotelsController.setTotalLength();
    await hotelsController.fetchAllHotels();
    await hotelsController.handleTabHotels("Bhopal");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      // ignore: invalid_use_of_protected_member
      print("data is =>>>> ${hotelsController.Hotels.value}");
      // ignore: invalid_use_of_protected_member
      print("Popular hotels ${hotelsController.Hotels.value}");
    }
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: InkWell(
              onTap: () => scaffoldKey.currentState!.isDrawerOpen
                  ? scaffoldKey.currentState!.closeDrawer()
                  : scaffoldKey.currentState!.openDrawer(),
              child: const Icon(CupertinoIcons.bars)),
          actions: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/seeFar.png',
              ),
            )
          ],
          elevation: 0.0,
        ),
        drawer: MyDrawer(homeCtx: context),
        body: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async {
              debugPrint("refresh");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TabBar(
                    unselectedLabelColor: lightGrey,
                    labelColor: black,
                    isScrollable: true,
                    controller: _controller,
                    physics: const AlwaysScrollableScrollPhysics(),
                    automaticIndicatorColorAdjustment: true,
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: CircleTabIndicator(color: black, radius: 4),
                    tabs: tabs,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //tab items
                  Obx(() {
                    if (kDebugMode) {
                      // ignore: invalid_use_of_protected_member
                      print("data is =>>>> ${hotelsController.Hotels.value}");
                      print(
                          "TotalDataLength =>>>> ${hotelsController.TotalDataLength.value}");
                    }
                    if (hotelsController.TabHotels.isEmpty) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          itemCount: 5,
                          itemBuilder: (context, index) => SizedBox(
                            height: 230,
                            width: 230,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: shimmerGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: LoadingAnimationWidget.fourRotatingDots(
                                    color: black, size: 30),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      width: double.maxFinite,
                      height: 300,
                      child: TabBarView(
                        controller: _controller,
                        children: tabs.map((e) => TabViewList()).toList(),
                      ),
                    );
                  }),

                  const SizedBox(
                    height: 25,
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Category",
                  //       style: Theme.of(context).textTheme.displayMedium,
                  //     ),
                  //     const SizedBox(
                  //       height: 15,
                  //     ),
                  //     Container(
                  //       width: double.maxFinite,
                  //       height: 40,
                  //       child: ListView.separated(
                  //         separatorBuilder: (context, index) => const SizedBox(
                  //           width: 15,
                  //         ),
                  //         scrollDirection: Axis.horizontal,
                  //         itemCount: 5,
                  //         itemBuilder: (context, index) {
                  //           return const CategoryCard();
                  //         },
                  //       ),
                  //     )
                  //   ],
                  // ),

                  //Popular Hotels
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Hotels",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            "",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        if (hotelsController.Hotels.isEmpty) {
                          return Center(
                            child: LoadingAnimationWidget.fourRotatingDots(
                                color: black, size: 30),
                          );
                        }
                        // return Wrap(
                        //   spacing: 12,
                        //   runSpacing: 20,
                        //   children: hotelsController.Hotels.map(
                        //       (element) => LocationCard(
                        //             e: element,
                        //           )).toList(),
                        // );
                        return SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: hotelsController.Hotels.length + 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.72,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 10),
                            itemBuilder: (BuildContext context, int index) {
                              return LocationCard(
                                  e: hotelsController.Hotels[index]);
                            },
                          ),
                        );
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  // ignore: avoid_renaming_method_parameters
  BoxPainter createBoxPainter([VoidCallback? onchanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
