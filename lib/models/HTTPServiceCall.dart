import 'dart:convert';

import 'package:rest_api_call/models/Post.dart';

import 'package:http/http.dart' as http;

class HTTPServiceCall {
  // URL
  final String POST_URL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    List<Post> postList = [];

    final response = await http.get(Uri.parse(POST_URL));

    var responseData = json.decode(response.body);

    for (var postData in responseData) {

      Post post = Post(
          id: postData['id'],
          userId: postData['userId'],
          title: postData['title'],
          body: postData['body']);
      postList.add(post);
    }

    return postList;
  }
}
