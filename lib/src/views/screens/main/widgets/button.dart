import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/router/router_name.dart';
import 'package:travel_app/core/themes/colors.dart';

// ignore: must_be_immutable
class CustoButton extends StatelessWidget {
  double? width;
  double? height;
  bool? responsive;
  CustoButton({super.key, this.width, this.height, this.responsive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed(RouteNames.homeDiscover),
      child: Container(
        width: width ?? 40,
        height: height ?? 20,
        decoration: BoxDecoration(
            color: ligthViolet, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: responsive == null
                ? [
                    const Icon(
                      CupertinoIcons.chevron_right_2,
                      color: white,
                    )
                  ]
                : [],
          ),
        ),
      ),
    );
  }
}
