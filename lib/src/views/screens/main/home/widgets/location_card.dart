import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed(RouteNames.hotel, params: {"id": "257"}),
      child: Container(
        width: 180,
        height: 240,
        decoration: BoxDecoration(
          color: shimmerGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170,
                height: 170,
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: shimmerGrey),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Image.network(
                          "https://images.unsplash.com/photo-1680034200919-26a16a426d34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80",
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                          filterQuality: FilterQuality.high,
                          width: 170,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 60,
                            height: 30,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: shimmerLightGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "\$ 120",
                                style: Theme.of(context).textTheme.titleMedium,
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Banjar Cancal",
                          style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Cairo",
                          style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.heart,
                    size: 18,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
