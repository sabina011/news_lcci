class PresidentsResponse {
  int status;
  bool success;
  List<PresidentModel> data;
  String message;

  PresidentsResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory PresidentsResponse.fromJson(Map<String, dynamic> json) {
    return PresidentsResponse(
      status: json['status'],
      success: json['success'],
      data: List<PresidentModel>.from(
        json['data'].map((president) => PresidentModel.fromJson(president)),
      ),
      message: json['message'],
    );
  }
}



class PresidentModel {
  int id;
  String name;
  String? image;
  String? phoneNo;
  String? designation;
  String workingPeriod;
  String type;

  PresidentModel({
    required this.id,
    required this.name,
    this.image,
    this.phoneNo,
    this.designation,
    required this.workingPeriod,
    required this.type,
  });

  factory PresidentModel.fromJson(Map<String, dynamic> json) {
    return PresidentModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      phoneNo: json['phone_no'],
      designation: json['designation'],
      workingPeriod: json['working_period'],
      type: json['type'],
    );
  }
}

