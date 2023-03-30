// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/more_img_stack.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/overlay_btn.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/overview_card.dart';
import 'package:travel_app/src/views/screens/main/location/widgets/review_card.dart';

class SingleLocation extends StatefulWidget {
  String id;
  SingleLocation({super.key, required this.id});

  @override
  State<SingleLocation> createState() => _SingleLocationState();
}

class _SingleLocationState extends State<SingleLocation>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    print("id is => ${widget.id}");
    return Scaffold(
      backgroundColor: white,
      body: Container(
        width: double.maxFinite,
        color: shimmerGrey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(29, 117, 117, 117),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    )
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1570992032131-e797ab3952fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OverLayButton(
                                    icon: CupertinoIcons.left_chevron,
                                    goBack: true, mainCtx: context),
                                OverLayButton(
                                  icon: CupertinoIcons.heart,
                                  mainCtx: context,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          width: MediaQuery.of(context).size.width - 35,
                          bottom: 20,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    SizedBox(
                                      width: 180,
                                      child: Text(
                                        "Jatibarang Resovier",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "\$ 120",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                      TextSpan(
                                          text: "/person",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                    ]))
                                  ],
                                ),
                              ),
                              //more images
                              SizedBox(
                                height: 220,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MoreImgStack(),
                                    MoreImgStack(),
                                    MoreImgStack(last: true),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //Outof stack

                SizedBox(
                  height: 50,
                  child: TabBar(
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.titleMedium,
                      labelStyle: Theme.of(context).textTheme.displayMedium,
                      tabs: const [
                        Tab(
                          child: Text(
                            "Overview",
                            style: TextStyle(
                                color: black, fontFamily: 'Montserrat'),
                            // style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                                color: black, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 270,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          width: double.maxFinite,
                          color: shimmerLightGrey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //Duration
                                    OverViewCard(
                                      title: "Duration",
                                      desc: "5 hours",
                                      icon: CupertinoIcons.time_solid,
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    OverViewCard(
                                        title: "Rating",
                                        desc: "4.8 out of 5",
                                        icon: CupertinoIcons.star_fill),
                                  ]),
                              const SizedBox(
                                height: 20,
                              ),
                              //location_desc
                              Text(
                                "blurRadius: This property takes in a double value as the object. It controls the haziness on the edges of the shadowblurSigma: This property takes in a double value as the object. It controls the blur-radius in terms of sigma instead of logical pixels.ty takes in a double value as the object. It controls the haziness on the edges of the ide the extent to which the box should be inflated before applying the blurblurRadius: This property takes in a double value as the object. It controls the haziness on the edges es of the ide the extent to which the box should be inflated before applying the blur.",
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          width: double.maxFinite,
                          color: shimmerLightGrey,
                          height: 300,
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ReviewCard();
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
