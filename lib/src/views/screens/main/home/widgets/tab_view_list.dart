import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';
import 'package:travel_app/src/models/hotel_model.dart' hide Image;

class TabViewList extends StatelessWidget {
  TabViewList({
    super.key,
  });

  final hotelsController = Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    final e = hotelsController.Hotels;
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: hotelsController.Hotels.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => context.goNamed(RouteNames.hotel,
              params: {"id": e[index].documentId.toString()}),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 230,
                  height: 240,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                          image: NetworkImage(
                              "${e[index].image!.urlTemplate.toString().split("?")[0]}?w=200&h=200" ??
                                  "https://images.unsplash.com/photo-1525183995014-bd94c0750cd5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
                          height: 150,
                          alignment: Alignment.center,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 170,
                  height: 50,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e[index]
                                  .title
                                  .toString()
                                  .replaceAll("<b>", "")
                                  .replaceAll("</b>", "") ??
                              "Capetown",
                          style: Theme.of(context).textTheme.displayMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          e[index].secondaryText.toString(),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // child: ,
          ),
        );
      },
    );
  }
}
