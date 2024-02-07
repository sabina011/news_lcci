class PasswordChangeResponse {
  final int status;
  final bool success;
  final PasswordData data;
  final String message;

  PasswordChangeResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory PasswordChangeResponse.fromJson(Map<String, dynamic> json) {
    return PasswordChangeResponse(
      status: json['status'],
      success: json['success'],
      data: PasswordData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class PasswordData {
  final int id;
  final int memberId;
  final String username;
  final String activeFromNp;
  final String activeFromEn;
  final String activeToNp;
  final String activeToEn;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  PasswordData({
    required this.id,
    required this.memberId,
    required this.username,
    required this.activeFromNp,
    required this.activeFromEn,
    required this.activeToNp,
    required this.activeToEn,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PasswordData.fromJson(Map<String, dynamic> json) {
    return PasswordData(
      id: json['id'],
      memberId: json['member_id'],
      username: json['username'],
      activeFromNp: json['active_from_np'],
      activeFromEn: json['active_from_en'],
      activeToNp: json['active_to_np'],
      activeToEn: json['active_to_en'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}
