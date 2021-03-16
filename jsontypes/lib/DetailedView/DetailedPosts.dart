import 'package:flutter/material.dart';
import 'package:jsontypes/Posts.dart';

class DetailedPosts extends StatelessWidget {
  final Posts posts;
  DetailedPosts({this.posts});
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
                Text(posts.name),
                Text(posts.email),
                Text(posts.body)
              ],
            )),
      ),
    );
  }
}
