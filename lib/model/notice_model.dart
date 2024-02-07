class NoticeResponse {
  final int status;
  final bool success;
  final dynamic data;
  final String message;

  NoticeResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory NoticeResponse.fromJson(Map<String, dynamic> json) {
    return NoticeResponse(
      status: json['status'] ?? 0,
      success: json['success'] ?? false,
      data: json['data'],
      message: json['message'] ?? '',
    );
  }
}
