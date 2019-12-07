import 'package:upsplash_app/models/PhotoListResponse.dart';

abstract class PhotoListState {
  const PhotoListState();
}

class InitialPhotoListState extends PhotoListState {}

class PhotoListError extends PhotoListState {}

class PhotoListLoaded extends PhotoListState {
  final List<PhotoListBean> photos;
  final int page;

  PhotoListLoaded(this.photos, this.page);

  PhotoListLoaded copyWith(List<PhotoListBean> photos) {
    return PhotoListLoaded(photos, page);
  }
}
