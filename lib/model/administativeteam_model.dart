class AdministrativeResponse<T> {
  final int status;
  final bool success;
  final List<T> data;
  final String message;

  AdministrativeResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory AdministrativeResponse.fromJson(Map<String, dynamic> json) {
    return AdministrativeResponse<T>(
      status: json['status'] ?? 0,
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>? ?? []).map<T>((item) => item as T).toList(),
      message: json['message'] ?? '',
    );
  }
}
