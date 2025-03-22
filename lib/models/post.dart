import 'package:social_network/util.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Post {
  late String id;
  String author;
  String message;
  DateTime datetime;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["_id"],
      author: "${json["user"]["firstName"]} ${json["user"]["lastName"]}",
      message: json["message"],
      datetime: DateTime.parse(json["datetime"]),
    );
  }

  Post(
      {String? id,
        required this.author,
        required this.message,
        required this.datetime})
      : id = id ?? uuid.v4();

  String get publishedDisplay {
    var localizedDatetime = datetime.toLocal();
    return "${zeroPad(localizedDatetime.hour)}:${zeroPad(localizedDatetime.minute)} ${zeroPad(localizedDatetime.day)}.${zeroPad(localizedDatetime.month)}.${localizedDatetime.year.toString().substring(2)}";
  }
}