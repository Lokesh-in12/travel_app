import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/location_card.dart';

// ignore: must_be_immutable
class CategoryList extends StatefulWidget {
  String? city;
  CategoryList({super.key, this.city});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final hotelsController = Get.find<HotelsController>();

  @override
  void initState() {
    super.initState();
    async();
  }

  Future<void> async() async {
    await hotelsController.handleTabHotels(widget.city!);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (kDebugMode) {
        // ignore: invalid_use_of_protected_member
        print("category List => ${hotelsController.TabHotels.value.length}");
      }
      if (hotelsController.TabHotels.isEmpty) {
        return Scaffold(
            body: Center(
          child:
              LoadingAnimationWidget.fourRotatingDots(color: black, size: 35),
        ));
      }
      return Scaffold(
        appBar: AppBar(
          foregroundColor: black,
          leading: InkWell(
              onTap: () => context.pop(RouteNames.trending),
              child: const Icon(CupertinoIcons.left_chevron)),
          title: Text(
            widget.city!,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          elevation: 0.0,
          backgroundColor: white,
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: hotelsController.TabHotels.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.72,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return LocationCard(
                              e: hotelsController.TabHotels[index]);
                        }),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
