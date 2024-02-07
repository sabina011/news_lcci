class ProductModel {
  final int id;
  final String name;
  final String description;
  final String bannerImage;
  final String createdDateNp;
  final String price;
  final int createdBy;
  final int status;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;
  final CreatedUser createdUser;
  final List<ProductImage> productImages;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.bannerImage,
    required this.createdDateNp,
    required this.price,
    required this.createdBy,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.createdUser,
    required this.productImages,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      bannerImage: json['banner_image'],
      createdDateNp: json['created_date_np'],
      price: json['price'],
      createdBy: json['created_by'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      createdUser: CreatedUser.fromJson(json['created_user']),
      productImages: List<ProductImage>.from(
        json['product_images'].map((image) => ProductImage.fromJson(image)),
      ),
    );
  }
}

class CreatedUser {
  final int id;
  final String fullName;
  final String loginUserName;
  final String email;
  final String mobileNo;
  final dynamic address;
  final int roleId;
  final dynamic image;
  final int status;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;
  final dynamic provinceCode;
  final dynamic districtCode;
  final dynamic localBodyCode;
  final bool isSystemAdminUser;
  final dynamic province;
  final dynamic district;
  final dynamic localBody;

  CreatedUser({
    required this.id,
    required this.fullName,
    required this.loginUserName,
    required this.email,
    required this.mobileNo,
    required this.address,
    required this.roleId,
    required this.image,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.provinceCode,
    required this.districtCode,
    required this.localBodyCode,
    required this.isSystemAdminUser,
    required this.province,
    required this.district,
    required this.localBody,
  });

  factory CreatedUser.fromJson(Map<String, dynamic> json) {
    return CreatedUser(
      id: json['id'],
      fullName: json['full_name'],
      loginUserName: json['login_user_name'],
      email: json['email'],
      mobileNo: json['mobile_no'],
      address: json['address'],
      roleId: json['role_id'],
      image: json['image'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      provinceCode: json['province_code'],
      districtCode: json['district_code'],
      localBodyCode: json['local_body_code'],
      isSystemAdminUser: json['is_system_admin_user'],
      province: json['province'],
      district: json['district'],
      localBody: json['local_body'],
    );
  }
}

class ProductImage {
  final int id;
  final int productId;
  final String image;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  ProductImage({
    required this.id,
    required this.productId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      productId: json['product_id'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
