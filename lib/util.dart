import 'dart:convert';

String zeroPad(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }
  return dateTimeValue.toString();
}

dynamic decodeData (String? rawData) {
  if (rawData != null) {
    final Object jsonData = jsonDecode(rawData);
    return jsonData;
  }
  return null;
}

bool isValidEmail(String email) {
  final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return regex.hasMatch(email);
}