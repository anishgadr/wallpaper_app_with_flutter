import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/global.dart';
import 'package:wallpaper_app/models/photos.dart';

class Wallpapers extends StatefulWidget {
  @override
  _WallpapersState createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
  getWallpapers() async {
    await http.get('https://api.pexels.com/v1/curated?per_page=15"&page=1',
        headers: {
          "Authorization":
              "563492ad6f917000010000016f94982e6fde4f2998fa124977ae6ed4"
        }).then((res) {
      print(res.body);
      var parsedJson = jsonDecode(res.body);

      Global.photos = (parsedJson["photos"] as List)
          .map((e) => Photos.fromJson(e))
          .toList();
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        itemCount: Global.photos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.5),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Global.index = index;
              Navigator.of(context).pushNamed('fullimage');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                        Global.photos[index].src.tiny,
                      ),
                      fit: BoxFit.cover)),
            ),
          );
        },
      ),
    );
  }
}
