import 'package:flutter/cupertino.dart';
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
          decoration: BoxDecoration(
              color: shimmerGrey, borderRadius: BorderRadius.circular(10)
              // image: DecorationImage(
              //     image: AssetImage(
              //         'assets/images/seeFar.png'))
              ),
          // child: ,
        );
      },
    );
  }
}
