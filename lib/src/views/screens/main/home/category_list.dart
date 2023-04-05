import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/views/screens/main/home/widgets/location_card.dart';

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
    // TODO: implement initState
    super.initState();
    async();
  }

  Future<void> async() async {
    await hotelsController.handleTabHotels(widget.city!);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print("category List => ${hotelsController.TabHotels.value.length}");
      if (hotelsController.TabHotels.length < 1) {
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
              onTap: () => context.goNamed(RouteNames.trending),
              child: Icon(CupertinoIcons.left_chevron)),
          title: Text(
            widget.city!,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          elevation: 0.0,
          backgroundColor: white,
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
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
                          if (hotelsController.isLoading.value) {
                            return Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                  color: black, size: 35),
                            );
                          }
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
