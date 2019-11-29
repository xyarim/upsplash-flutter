class PhotoListResponse {
  final List<PhotoListBean> results;

  PhotoListResponse(this.results);

  PhotoListResponse.fromJsonArray(List json)
      : results = json.map((i) => new PhotoListBean.fromJson(i)).toList();
}

class PhotoListBean {
  String id;
  String createdAt;
  String updatedAt;
  String color;
  String altDescription;
  bool likedByUser;
  int width;
  int height;
  int likes;
  LinksBean links;
  SponsorshipBean sponsorship;
  UrlsBean urls;
  UserBean user;

  PhotoListBean(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.color,
      this.altDescription,
      this.likedByUser,
      this.width,
      this.height,
      this.likes,
      this.links,
      this.sponsorship,
      this.urls,
      this.user});

  PhotoListBean.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.createdAt = json['created_at'];
    this.updatedAt = json['updated_at'];
    this.color = json['color'];
    this.altDescription = json['alt_description'];
    this.likedByUser = json['liked_by_user'];
    this.width = json['width'];
    this.height = json['height'];
    this.likes = json['likes'];
    this.links =
        json['links'] != null ? LinksBean.fromJson(json['links']) : null;
    this.sponsorship = json['sponsorship'] != null
        ? SponsorshipBean.fromJson(json['sponsorship'])
        : null;
    this.urls = json['urls'] != null ? UrlsBean.fromJson(json['urls']) : null;
    this.user = json['user'] != null ? UserBean.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['color'] = this.color;
    data['alt_description'] = this.altDescription;
    data['liked_by_user'] = this.likedByUser;
    data['width'] = this.width;
    data['height'] = this.height;
    data['likes'] = this.likes;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.sponsorship != null) {
      data['sponsorship'] = this.sponsorship.toJson();
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
  String following;
  String followers;

  LinksBean(
      {this.self,
      this.html,
      this.photos,
      this.likes,
      this.portfolio,
      this.following,
      this.followers});

  LinksBean.fromJson(Map<String, dynamic> json) {
    this.self = json['self'];
    this.html = json['html'];
    this.photos = json['photos'];
    this.likes = json['likes'];
    this.portfolio = json['portfolio'];
    this.following = json['following'];
    this.followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    data['following'] = this.following;
    data['followers'] = this.followers;
    return data;
  }
}

class SponsorshipBean {
  String impressionsId;
  String tagline;
  SponsorBean sponsor;
  List<String> impressionUrls;

  SponsorshipBean(
      {this.impressionsId, this.tagline, this.sponsor, this.impressionUrls});

  SponsorshipBean.fromJson(Map<String, dynamic> json) {
    this.impressionsId = json['impressions_id'];
    this.tagline = json['tagline'];
    this.sponsor =
        json['sponsor'] != null ? SponsorBean.fromJson(json['sponsor']) : null;

    List<dynamic> impressionUrlsList = json['impression_urls'];
    this.impressionUrls = new List();
    this.impressionUrls.addAll(impressionUrlsList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['impressions_id'] = this.impressionsId;
    data['tagline'] = this.tagline;
    if (this.sponsor != null) {
      data['sponsor'] = this.sponsor.toJson();
    }
    data['impression_urls'] = this.impressionUrls;
    return data;
  }
}

class UrlsBean {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  UrlsBean({this.raw, this.full, this.regular, this.small, this.thumb});

  UrlsBean.fromJson(Map<String, dynamic> json) {
    this.raw = json['raw'];
    this.full = json['full'];
    this.regular = json['regular'];
    this.small = json['small'];
    this.thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

class UserBean {
  String id;
  String updatedAt;
  String username;
  String name;
  String firstName;
  String lastName;
  String twitterUsername;
  String portfolioUrl;
  String bio;
  String instagramUsername;
  bool acceptedTos;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  LinksBean links;
  ProfileImageBean profileImage;

  UserBean(
      {this.id,
      this.updatedAt,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.instagramUsername,
      this.acceptedTos,
      this.totalCollections,
      this.totalLikes,
      this.totalPhotos,
      this.links,
      this.profileImage});

  UserBean.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.updatedAt = json['updated_at'];
    this.username = json['username'];
    this.name = json['name'];
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.twitterUsername = json['twitter_username'];
    this.portfolioUrl = json['portfolio_url'];
    this.bio = json['bio'];
    this.instagramUsername = json['instagram_username'];
    this.acceptedTos = json['accepted_tos'];
    this.totalCollections = json['total_collections'];
    this.totalLikes = json['total_likes'];
    this.totalPhotos = json['total_photos'];
    this.links =
        json['links'] != null ? LinksBean.fromJson(json['links']) : null;
    this.profileImage = json['profile_image'] != null
        ? ProfileImageBean.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['instagram_username'] = this.instagramUsername;
    data['accepted_tos'] = this.acceptedTos;
    data['total_collections'] = this.totalCollections;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage.toJson();
    }
    return data;
  }
}

class SponsorBean {
  String id;
  String updatedAt;
  String username;
  String name;
  String firstName;
  String lastName;
  String twitterUsername;
  String portfolioUrl;
  String bio;
  String instagramUsername;
  bool acceptedTos;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  LinksBean links;
  ProfileImageBean profileImage;

  SponsorBean(
      {this.id,
      this.updatedAt,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.instagramUsername,
      this.acceptedTos,
      this.totalCollections,
      this.totalLikes,
      this.totalPhotos,
      this.links,
      this.profileImage});

  SponsorBean.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.updatedAt = json['updated_at'];
    this.username = json['username'];
    this.name = json['name'];
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.twitterUsername = json['twitter_username'];
    this.portfolioUrl = json['portfolio_url'];
    this.bio = json['bio'];
    this.instagramUsername = json['instagram_username'];
    this.acceptedTos = json['accepted_tos'];
    this.totalCollections = json['total_collections'];
    this.totalLikes = json['total_likes'];
    this.totalPhotos = json['total_photos'];
    this.links =
        json['links'] != null ? LinksBean.fromJson(json['links']) : null;
    this.profileImage = json['profile_image'] != null
        ? ProfileImageBean.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['instagram_username'] = this.instagramUsername;
    data['accepted_tos'] = this.acceptedTos;
    data['total_collections'] = this.totalCollections;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
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
