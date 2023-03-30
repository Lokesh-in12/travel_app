import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/category_card.dart';
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
    Tab(
      text: "Asia",
    ),
    Tab(
      text: "Europe",
    ),
    Tab(
      text: "North America",
    ),
    Tab(
      text: "Africa",
    ),
    Tab(
      text: "Antartica",
    ),
    Tab(
      text: "South America",
    ),
    Tab(
      text: "Ocenia",
    ),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 7, vsync: this);
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
          physics: const BouncingScrollPhysics(),
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
                    controller: _tabController,
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
                  SizedBox(
                    width: double.maxFinite,
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        TabViewList(),
                        TabViewList(),
                        TabViewList(),
                        TabViewList(),
                        TabViewList(),
                        TabViewList(),
                        TabViewList(),
                      ],
                    ),
                  ),

                  //SizedBox
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 40,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const CategoryCard();
                          },
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //top trips
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top trips",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            "Explore More",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        spacing: 12,
                        runSpacing: 20,
                        children: const [
                          LocationCard(),
                          LocationCard(),
                          LocationCard(),
                          LocationCard(),
                        ],
                      )
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
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
