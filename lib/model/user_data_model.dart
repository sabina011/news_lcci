class User {
  final int id;
  final String fullName;
  final String email;
  final String phoneNo;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phoneNo: json['phone_no'],
    );
  }
}
