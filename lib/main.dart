import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/full_image.dart';
import 'package:wallpaper_app/views/wallpapers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wallpapers(),
      routes: {'fullimage': (context) => FullImage()},
    );
  }
}
