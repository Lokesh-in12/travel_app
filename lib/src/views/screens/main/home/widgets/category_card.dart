import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_app/core/themes/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
          color: shimmerGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/seeFarSingle.png',
            height: 50,
          ),
          Text(
            "Camp",
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
