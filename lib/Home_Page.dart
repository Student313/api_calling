import 'dart:convert';

import 'package:http/http.dart';

import 'Model/model.dart';

class HttpService {
  final String postURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<User>> getPosts() async {
    Response res = await get(Uri.parse(postURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> posts = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();
      return posts;
    } else {
      throw ("Unable to retrieve posts");
    }
  }
}
