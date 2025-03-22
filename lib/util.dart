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