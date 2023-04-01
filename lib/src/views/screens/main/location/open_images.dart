import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';

// ignore: must_be_immutable
class OpenImage extends StatefulWidget {
  String? title;
  String? url;
  OpenImage({super.key, this.title, this.url});

  @override
  State<OpenImage> createState() => _OpenImageState();
}

class _OpenImageState extends State<OpenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        foregroundColor: white,
        backgroundColor: black,
        title: SizedBox(
            width: 200,
            child: Text(
              widget.title.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: NetworkImage("${widget.url}?w=300&h=500"),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          )
        ],
      ),
    );
  }
}
