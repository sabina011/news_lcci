class MemberResponse {
  final int status;
  final bool success;
  final List<dynamic> data;
  final String message;

  MemberResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory MemberResponse.fromJson(Map<String, dynamic> json) {
    return MemberResponse(
      status: json['status'] ?? 0,
      success: json['success'] ?? false,
      data: json['data'] ?? [],
      message: json['message'] ?? '',
    );
  }
}
