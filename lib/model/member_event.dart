class EventsResponse {
  int status;
  bool success;
  EventsData data;
  String message;

  EventsResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory EventsResponse.fromJson(Map<String, dynamic> json) {
    return EventsResponse(
      status: json['status'],
      success: json['success'],
      data: EventsData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class EventsData {
  int currentPage;
  List<EventItem> events;
  int total;

  EventsData({
    required this.currentPage,
    required this.events,
    required this.total,
  });

  factory EventsData.fromJson(Map<String, dynamic> json) {
    List<EventItem> eventsList = [];
    json['data'].forEach((key, value) {
      eventsList.add(EventItem.fromJson(value));
    });
    return EventsData(
      currentPage: json['current_page'],
      events: eventsList,
      total: json['total'],
    );
  }
}

class EventItem {
  int id;
  String logo;
  String description;
  String fromDateEn;
  String fromDateNp;
  String toDateEn;
  String toDateNp;
  String sendType;
  int status;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  String title;
  String slug;

  EventItem({
    required this.id,
    required this.logo,
    required this.description,
    required this.fromDateEn,
    required this.fromDateNp,
    required this.toDateEn,
    required this.toDateNp,
    required this.sendType,
    required this.status,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.slug,
  });

  factory EventItem.fromJson(Map<String, dynamic> json) {
    return EventItem(
      id: json['id'],
      logo: json['logo'],
      description: json['description'],
      fromDateEn: json['from_date_en'],
      fromDateNp: json['from_date_np'],
      toDateEn: json['to_date_en'],
      toDateNp: json['to_date_np'],
      sendType: json['send_type'],
      status: json['status'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      title: json['title'],
      slug: json['slug'],
    );
  }
}
