
import 'dart:convert';

import 'package:social_network/api.dart';
import 'package:social_network/models/user.dart';

Future<dynamic> saveUser (String email) async {
  var rawData = await fetchData("${email}/profile");
  if (rawData != null) {
    final Object jsonData = jsonDecode(rawData);
    return jsonData;
  }
  return null;
}

Future<User?> createAndReturnUser (String email) async {
  final decodedData = await saveUser(email);
  if (decodedData != null) {
    return User.fromJson(decodedData);
  }
  return null;
}