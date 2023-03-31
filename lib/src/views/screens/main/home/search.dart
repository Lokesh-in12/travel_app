import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                  ),
                  prefixIconColor: black,
                  focusColor: black,
                  fillColor: lightWhite,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: white)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: white),
                  ),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: black))),
            )
          ],
        ),
      )),
    );
  }
}
