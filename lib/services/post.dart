

import 'dart:convert';

import 'package:social_network/api.dart';
import 'package:social_network/models/post.dart';
import 'package:social_network/util.dart';


Post? parsePostData(dynamic postData) {
  if (postData != null) {
    return Post.fromJson(postData);
  }
  return null;
}

Future<dynamic> getPostsData (String email, String? query) async {
  var path = "${email}/posts";
  if (query != null) {
    path = "$path?${query}";
  }
  var rawData = await fetchData(path);
  if (rawData != null) {
    final Object jsonData = jsonDecode(rawData);
    return jsonData;
  }
  return null;
}

Future<List<Post>> getPosts (String email, DateTime? lastPosted) async {
  var query;
  if (lastPosted != null) {
    query = "datetime=${lastPosted.toIso8601String()}";
  }
  final decodedData = await getPostsData(email, query);
  if (decodedData != null) {
    return List<Post>.from(
        decodedData.map((json) => Post.fromJson(json)).toList());
  }
  return [];
}

Future<Post?> uploadPost({required String email, required String text}) async {
  final rawData = await postData("${email}/posts", {"message": text});
  final decodedData = await decodeData(rawData);
  return parsePostData(decodedData);
}