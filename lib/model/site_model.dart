class ApiResponses {
  final int status;
  final bool success;
  final List<Site> data;
  final String message;

  ApiResponses({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });

  factory ApiResponses.fromJson(Map<String, dynamic> json) {
    return ApiResponses(
      status: json['status'],
      success: json['success'],
      data: List<Site>.from(json['data'].map((site) => Site.fromJson(site))),
      message: json['message'],
    );
  }
}

class Site {
  final int id;
  final String name;
  final String description;
  final String bannerImage;
  final List<SiteImage> siteImages;

  Site({
    required this.id,
    required this.name,
    required this.description,
    required this.bannerImage,
    required this.siteImages,
  });

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      bannerImage: json['banner_image'],
      siteImages: List<SiteImage>.from(json['site_images'].map((image) => SiteImage.fromJson(image))),
    );
  }
}

class SiteImage {
  final int id;
  final int siteId;
  final String image;

  SiteImage({
    required this.id,
    required this.siteId,
    required this.image,
  });

  factory SiteImage.fromJson(Map<String, dynamic> json) {
    return SiteImage(
      id: json['id'],
      siteId: json['site_id'],
      image: json['image'],
    );
  }
}
