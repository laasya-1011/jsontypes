import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:dio/dio.dart';

import 'package:jsontypes/Album.dart';
import 'package:jsontypes/Posts.dart';

class StateManager with ChangeNotifier {
  StateManager() {}

  Dio dio = new Dio();

  Future fetchJson() async {
    //var response;
    var response = await dio.get("https://jsonplaceholder.typicode.com/photos");

    List<Album> _albumlist = [];
    if (response.statusCode == 200) {
      var jsonResponse = response.data;

      for (var item in jsonResponse) {
        Album album = new Album.fromJson(item);
        _albumlist.add(album);
      }

      return _albumlist;
    }
  }

  Future fetchPosts() async {
    var response =
        await dio.get("https://jsonplaceholder.typicode.com/comments");
    List<Posts> _postlist = [];
    if (response.statusCode == 200) {
      var jsonResponse = response.data;
      for (var item in jsonResponse) {
        Posts posts = Posts.fromJson(item);
        _postlist.add(posts);
      }
    }
    return _postlist;
  }
   Future fetchUsers() async {
    var response =
        await dio.get("https://jsonplaceholder.typicode.com/comments");
    List<Posts> _postlist = [];
    if (response.statusCode == 200) {
      var jsonResponse = response.data;
      for (var item in jsonResponse) {
        Posts posts = Posts.fromJson(item);
        _postlist.add(posts);
      }
    }
    return _postlist;
  }
}
