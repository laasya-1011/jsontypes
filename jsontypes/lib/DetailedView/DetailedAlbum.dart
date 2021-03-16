import 'package:flutter/material.dart';
import 'package:jsontypes/Album.dart';

class DetailedView extends StatelessWidget {
  final Album album;
  DetailedView({this.album});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 30, right: 20, left: 20, top: 10),
        elevation: 5,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  album.thumbnailUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(album.title),
                SizedBox(
                  height: 10,
                ),
                Text(album.url),
              ],
            )),
      ),
    );
  }
}
