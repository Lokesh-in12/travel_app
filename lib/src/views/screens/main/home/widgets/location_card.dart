import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/themes/colors.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: shimmerGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            children: [Text("Banjar Kamal"), Text("Cairo")],
          )
        ],
      ),
    );
  }
}
