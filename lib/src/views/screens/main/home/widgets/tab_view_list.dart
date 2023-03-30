import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';

class TabViewList extends StatelessWidget {
  const TabViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          width: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                height: 240,
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: shimmerGrey),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1525183995014-bd94c0750cd5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
                      height: 150,
                      fit: BoxFit.cover,
                    ),
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
                        "Cape Town",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "South Africa",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // child: ,
        );
      },
    );
  }
}
