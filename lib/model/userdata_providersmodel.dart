class User {
  final int id;
  final String fullName;
  final int toleId;
  final int categoryId;
  final String image;
  final String email;
  final String phoneNo;
  final String membershipNo;
  final String joinDateNp;
  final String joinDateEn;
  final int status;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt; // Can be null
  final int businessCategoryId;
  final String username;
  final String categoryName;

  User({
    required this.id,
    required this.fullName,
    required this.toleId,
    required this.categoryId,
    required this.image,
    required this.email,
    required this.phoneNo,
    required this.membershipNo,
    required this.joinDateNp,
    required this.joinDateEn,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.businessCategoryId,
    required this.username,
    required this.categoryName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      toleId: json['tole_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      phoneNo: json['phone_no'] ?? '',
      membershipNo: json['membership_no'] ?? '',
      joinDateNp: json['join_date_np'] ?? '',
      joinDateEn: json['join_date_en'] ?? '',
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'],
      businessCategoryId: json['business_category_id'] ?? 0,
      username: json['username'] ?? '',
      categoryName: json['category_name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'toleId': toleId,
      'categoryId': categoryId,
      'image':image,
      'email':email,
      'phoneNo':phoneNo,
      'membershipNo':membershipNo,
      'joinDateNp':joinDateNp,
      'joinDateEn':joinDateEn,
      'status':status,
      'createdAt':createdAt,
      'updatedAt':updatedAt,
      'deletedAt':deletedAt,
      'businessCategoryId':businessCategoryId,
      'username':username,
      'categoryName':categoryName,
    };
  }
}


