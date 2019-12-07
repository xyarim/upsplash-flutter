import 'package:meta/meta.dart';
import 'package:upsplash_app/models/CollectionListResponse.dart';

@immutable
abstract class CollectionListState {}

class InitialCollectionListState extends CollectionListState {}

class CollectionListError extends CollectionListState {}

class CollectionListLoaded extends CollectionListState {
  final List<CollectionListItem> collections;
  final int page;

  CollectionListLoaded(this.collections, this.page);

  CollectionListLoaded copyWith(List<CollectionListItem> collections, page) {
    return CollectionListLoaded(collections, page);
  }
}
