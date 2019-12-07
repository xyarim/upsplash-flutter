import 'package:dio/dio.dart';
import 'package:upsplash_app/models/CollectionListResponse.dart';

abstract class CollectionRepository {
  Future<List<CollectionListItem>> getCollections(int page);
}

class MainCollectionRepository extends CollectionRepository {
  @override
  Future<List<CollectionListItem>> getCollections(int page) async {
    Response response = await Dio().get(
        "https://api.unsplash.com/collections/?client_id=e2658d4b6b17ae24b50a7ab36d13ca67da9761322a5e4cb0e9cc531e69cecb90&page=$page");

    List<CollectionListItem> list =
        CollectionListResponse.fromJsonArray(response.data).results;
    print(list.length);
    return list;
  }
}
