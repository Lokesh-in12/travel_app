import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';

class OverViewCard extends StatelessWidget {
  IconData icon;
  String title;
  String desc;
  OverViewCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: shimmerLightGrey, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: orange,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    desc,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
