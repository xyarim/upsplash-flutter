import 'package:upsplash_app/models/PhotoListResponse.dart';

class CollectionListResponse {
  final List<CollectionListItem> results;

  CollectionListResponse(this.results);

  CollectionListResponse.fromJsonArray(List json)
      : results = json.map((i) => new CollectionListItem.fromJson(i)).toList();
}

class CollectionListItem {
  String title;
  String description;
  String publishedAt;
  String updatedAt;
  String shareKey;
  bool private;
  int id;
  int totalPhotos;
  CoverPhotoBean coverPhoto;
  LinksBean links;
  UserBean user;

  CollectionListItem(
      {this.title,
      this.description,
      this.publishedAt,
      this.updatedAt,
      this.shareKey,
      this.private,
      this.id,
      this.totalPhotos,
      this.coverPhoto,
      this.links,
      this.user});

  CollectionListItem.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.description = json['description'];
    this.publishedAt = json['published_at'];
    this.updatedAt = json['updated_at'];
    this.shareKey = json['share_key'];
    this.private = json['private'];
    this.id = json['id'];
    this.totalPhotos = json['total_photos'];
    this.coverPhoto = json['cover_photo'] != null
        ? CoverPhotoBean.fromJson(json['cover_photo'])
        : null;
    this.links =
        json['links'] != null ? LinksBean.fromJson(json['links']) : null;
    this.user = json['user'] != null ? UserBean.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['published_at'] = this.publishedAt;
    data['updated_at'] = this.updatedAt;
    data['share_key'] = this.shareKey;
    data['private'] = this.private;
    data['id'] = this.id;
    data['total_photos'] = this.totalPhotos;
    if (this.coverPhoto != null) {
      data['cover_photo'] = this.coverPhoto.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class CoverPhotoBean {
  String id;
  String color;
  String description;
  bool likedByUser;
  int width;
  int height;
  int likes;
  LinksBean links;
  UrlsBean urls;
  UserBean user;

  CoverPhotoBean(
      {this.id,
      this.color,
      this.description,
      this.likedByUser,
      this.width,
      this.height,
      this.likes,
      this.links,
      this.urls,
      this.user});

  CoverPhotoBean.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.color = json['color'];
    this.description = json['description'];
    this.likedByUser = json['liked_by_user'];
    this.width = json['width'];
    this.height = json['height'];
    this.likes = json['likes'];
    this.links =
        json['links'] != null ? LinksBean.fromJson(json['links']) : null;
    this.urls = json['urls'] != null ? UrlsBean.fromJson(json['urls']) : null;
    this.user = json['user'] != null ? UserBean.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['description'] = this.description;
    data['liked_by_user'] = this.likedByUser;
    data['width'] = this.width;
    data['height'] = this.height;
    data['likes'] = this.likes;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class LinksBean {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;

  LinksBean({this.self, this.html, this.photos, this.likes, this.portfolio});

  LinksBean.fromJson(Map<String, dynamic> json) {
    this.self = json['self'];
    this.html = json['html'];
    this.photos = json['photos'];
    this.likes = json['likes'];
    this.portfolio = json['portfolio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    return data;
  }
}

class UserBean {
  String id;
  String username;
  String name;
  String portfolioUrl;
  String bio;
  String location;
  int totalLikes;
  int totalPhotos;
  int totalCollections;
  LinksBean links;
  ProfileImageBean profileImage;

  UserBean(
      {this.id,
      this.username,
      this.name,
      this.portfolioUrl,
      this.bio,
      this.location,
      this.totalLikes,
      this.totalPhotos,
      this.totalCollections,
      this.links,
      this.profileImage});

  UserBean.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.username = json['username'];
    this.name = json['name'];
    this.portfolioUrl = json['portfolio_url'];
    this.bio = json['bio'];
    this.location = json['location'];
    this.totalLikes = json['total_likes'];
    this.totalPhotos = json['total_photos'];
    this.totalCollections = json['total_collections'];
    this.links =
        json['links'] != null ? LinksBean.fromJson(json['links']) : null;
    this.profileImage = json['profile_image'] != null
        ? ProfileImageBean.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['total_collections'] = this.totalCollections;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage.toJson();
    }
    return data;
  }
}

class ProfileImageBean {
  String small;
  String medium;
  String large;

  ProfileImageBean({this.small, this.medium, this.large});

  ProfileImageBean.fromJson(Map<String, dynamic> json) {
    this.small = json['small'];
    this.medium = json['medium'];
    this.large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}
