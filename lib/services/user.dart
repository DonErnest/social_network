
import 'dart:convert';

import 'package:social_network/api.dart';
import 'package:social_network/models/user.dart';
import 'package:social_network/util.dart';

User? parseUserData(dynamic userData) {
  if (userData != null) {
    return User.fromJson(userData);
  }
  return null;
}

Future<User?> getOrCreateUser (String email) async {
  var rawData = await fetchData("${email}/profile");
  final decodedData = await decodeData(rawData);
  return parseUserData(decodedData);
}

Future<User?> updateAndReturnUser({required String email, required Object data}) async {
  final rawData = await postData("${email}/profile", data);
  final decodedData = await decodeData(rawData);
  return parseUserData(decodedData);
}