import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/location_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final hotelsController = Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 30),
              TextField(
                onChanged: (value) => hotelsController.handleSeachHotel(),
                controller: hotelsController.searchController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                    ),
                    prefixIconColor: black,
                    focusColor: black,
                    fillColor: lightWhite,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: white)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: white),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black))),
              ),
              // Obx(() {
              //   if(hotelsController.SearchHotels.isEmpty){
              //     return SizedBox(
              //       height: 500,
              //       child: Center(
              //         child: Text(
              //           "Search through our best Hotels",
              //           style: Theme.of(context).textTheme.titleMedium,
              //         ),
              //       ),
              //     );
              //   }
              // })
              Obx(() {
                print(
                    "serachAray is = > ${hotelsController.SearchHotels.value} and length of controller is => ${hotelsController.searchController.text.trim().length}");
                if (hotelsController.searchController.text.trim().length == 0) {
                  return SizedBox(
                    height: 500,
                    child: Center(
                      child: Text(
                        "Search through our best Hotels",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
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
                    itemCount: hotelsController.SearchHotels.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.72,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return LocationCard(
                          e: hotelsController.SearchHotels[index]);
                    },
                  ),
                );
              })
            ],
          ),
        ),
      )),
    );
  }
}
