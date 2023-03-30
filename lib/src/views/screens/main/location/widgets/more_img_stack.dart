import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';

class MoreImgStack extends StatelessWidget {
  bool? last;
  MoreImgStack({super.key, this.last});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: shimmerLightGrey,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(
          width: 55,
          height: 55,
          child: DecoratedBox(
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1574173803062-743fb38eb51d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1436&q=80"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        last == true
            ? SizedBox(
                width: 65,
                height: 65,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: shimmerLightGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "+5",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
