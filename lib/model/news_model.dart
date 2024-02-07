class ApiResponse {
  final int status;
  final bool success;
  final ApiData data;
  final String message;

  ApiResponse({required this.status, required this.success, required this.data, required this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      success: json['success'],
      data: ApiData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class ApiData {
  final int currentPage;
  final List<NewsItem> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<PageLink> links;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  ApiData({required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      currentPage: json['current_page'],
      data: List<NewsItem>.from(json['data'].map((article) =>NewsItem.fromJson(article))),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: List<PageLink>.from(json['links'].map((link) => PageLink.fromJson(link))),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class NewsItem {
  int id;
  String title;
  String description;
  String? banner_image;

  NewsItem({required this.id, required this.title, required this.description,this.banner_image,});

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      banner_image: json['banner_image'],);
  }
}

class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({
    required this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}

