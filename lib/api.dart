import 'dart:convert';

import 'package:http/http.dart';

const methodGet = "get";
const methodPost = "post";

final String baseUrl = "http://146.185.154.90:8000/blog/";

Future<String?> fetchData(String path) async {
  final uri = Uri.parse("${baseUrl}${path}");
  try {
    final response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
  } catch (error) {
    return null;
  }
  return null;
}

Future<bool> postData (String path, Object? data) async {
  final uri = Uri.parse("${baseUrl}${path}");
  try {
    final response = await post(uri, body: data);
    if (response.statusCode == 200) {
      return true;
    }
  } catch (error) {
    return false;
  }
  return false;
}