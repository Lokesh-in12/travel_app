import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';

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
      if (hotelsController.TabHotels.value.length == 0) {
        return Scaffold(
            body: Center(
          child:
              LoadingAnimationWidget.fourRotatingDots(color: black, size: 35),
        ));
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.city!),
        ),
      );
    });
  }
}
