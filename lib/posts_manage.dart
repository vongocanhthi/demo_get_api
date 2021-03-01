import 'package:demo_get_api/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_manage.dart';

class PostsManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiManage().getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts Manage"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiManage().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Post> data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].title),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
        },
      ),
    );
  }
}
