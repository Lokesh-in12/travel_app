import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
                child: CircleAvatar(
                  backgroundColor: orange,
                  minRadius: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lokesh",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Amazing Location. Must visit!sfhf sfdifv gffuf hhfufgaouefau",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
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
