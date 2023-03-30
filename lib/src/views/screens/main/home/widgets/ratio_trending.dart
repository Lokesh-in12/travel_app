import 'package:flutter/material.dart';

class RatioTrending extends StatelessWidget {
  const RatioTrending({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jan-April",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              "5.10M",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        )
      ],
    );
  }
}
