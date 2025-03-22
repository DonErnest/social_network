class User {
  final String email;
  final String firstName;
  final String lastName;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }

  const User({required this.email, required this.firstName, required this.lastName});
}