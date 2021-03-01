import 'dart:convert';
import 'package:demo_get_api/post.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiManage {
  var url = "https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5";

  Future<List<Post>> getData() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Post.fromJson(data)).toList();
    } else {
      print("Error");
    }
  }
}
