import 'package:dio/dio.dart';
import 'package:upsplash_app/models/PhotoListResponse.dart';

abstract class PhotoRepository {
  Future<List<PhotoListBean>> getPhotos(int page);
}

class MainPhotoRepository implements PhotoRepository {
  @override
  Future<List<PhotoListBean>> getPhotos(int page) async {
    try {
      Response response = await Dio().get(
          "https://api.unsplash.com/photos/?client_id=e2658d4b6b17ae24b50a7ab36d13ca67da9761322a5e4cb0e9cc531e69cecb90&page=$page");

      List<PhotoListBean> list =
          PhotoListResponse.fromJsonArray(response.data).results;
      list.forEach((value){
        print(value.color);
      });
      print(list.length);
      return list;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return null;
    }
  }
}
