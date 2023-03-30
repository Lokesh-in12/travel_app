import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';

class OverLayButton extends StatelessWidget {
  BuildContext mainCtx;
  IconData icon;
  bool? goBack;
  OverLayButton(
      {super.key, required this.icon, this.goBack, required this.mainCtx});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          goBack == true ? context.goNamed(RouteNames.homeDiscover) : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 55,
            height: 55,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: shimmerLightGrey,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          SizedBox(
            width: 45,
            height: 45,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(40),
              ),
              // ignore: prefer_const_constructors
              child: Icon(
                icon,
                color: black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
