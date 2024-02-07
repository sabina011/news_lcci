class EventResponse {
  final int status;
  final bool success;
  final EventData data;
  final String message;

  EventResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      status: json['status'],
      success: json['success'],
      data: EventData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class EventData {
  final int currentPage;
  final List<Event> events;

  EventData({
    required this.currentPage,
    required this.events,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      currentPage: json['current_page'],
      events: List<Event>.from(json['data'].map((eventJson) => Event.fromJson(eventJson))),
    );
  }
}

class Event {
  final int id;
  final String logo;
  final String description;
  final String fromDateEn;
  final String fromDateNp;
  final String toDateEn;
  final String toDateNp;
  final String sendType;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String slug;

  Event({
    required this.id,
    required this.logo,
    required this.description,
    required this.fromDateEn,
    required this.fromDateNp,
    required this.toDateEn,
    required this.toDateNp,
    required this.sendType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.slug,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      logo: json['logo'],
      description: json['description'],
      fromDateEn: json['from_date_en'],
      fromDateNp: json['from_date_np'],
      toDateEn: json['to_date_en'],
      toDateNp: json['to_date_np'],
      sendType: json['send_type'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      title: json['title'],
      slug: json['slug'],
    );
  }
}
