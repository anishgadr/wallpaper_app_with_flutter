import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/global.dart';

class FullImage extends StatefulWidget {
  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Global.photos[Global.index].src.large2x),
                  fit: BoxFit.cover))),
    );
  }
}
