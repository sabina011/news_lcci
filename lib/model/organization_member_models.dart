class OrganizationalResponse {
  int status;
  bool success;
  List<OrganizationalModel> data;
  String message;

  OrganizationalResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory OrganizationalResponse.fromJson(Map<String, dynamic> json) {
    return OrganizationalResponse(
      status: json['status'],
      success: json['success'],
      data: List<OrganizationalModel>.from(
        json['data'].map((member) => OrganizationalModel.fromJson(member)),
      ),
      message: json['message'],
    );
  }
}



class OrganizationalModel {
  String name;
  String image;
  String? phoneNo;
  String? designation;

  OrganizationalModel({
    required this.name,
    this.phoneNo,
    this.designation,
    required this.image,

  });

  factory OrganizationalModel.fromJson(Map<String, dynamic> json) {
    return OrganizationalModel(
      name: json['name'],
      phoneNo: json['phone_no'],
      designation: json['designation'],
      image: json['image'],
    );
  }
}

