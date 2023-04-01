import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerRow extends StatelessWidget {
  String name;
  IconData icon;
  Color? colr;
  DrawerRow({super.key, required this.name, required this.icon, this.colr});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: colr,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
