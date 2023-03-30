import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/ratio_trending.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/trending_sm_img.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Trending",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            CupertinoIcons.chart_bar_alt_fill,
                            size: 28,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "1. Dubai",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 400,
                        height: 180,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                          itemBuilder: (context, index) {
                            return const TrendingSmImages();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Why we chose this",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/images/Group 2.png',
                            height: 20,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.maxFinite,
                        height: 100,
                        child: Text(
                          "Dubai is a tourist paradise, offering a multitude of attractions. With affordable tour packages and budget-friendly accommodations, the city has a place in every traveler’s itinerary. Moreover, the recent introduction of new travel trends such as staycations and tourism-boosting initiatives like remote-working visas and golden visas has contributed to its growing popularity. Today, in 2023, Dubai stands tall as it has been ranked as the number one destination in the Tripadvisor Travellers’ Choice Awards.",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 150,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Text(
                                  "Tourist Ratios",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    RatioTrending(),
                                    RatioTrending(),
                                    RatioTrending(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Top things to do in dubai",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 400,
                        height: 70,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                          itemBuilder: (context, index) {
                            return const CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  "https://media.istockphoto.com/id/1182347072/vector/woman-parachutist-jumper.jpg?s=612x612&w=0&k=20&c=RjaJLSfjxQnOiRCNNmtU5NaiMYXp9AOQDSHpaOMXWYQ="),
                              backgroundColor: black,
                            );
                          },
                        ),
                      ),
                    ]),
              ))),
    );
  }
}
