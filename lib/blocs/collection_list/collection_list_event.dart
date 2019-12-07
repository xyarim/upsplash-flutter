import 'package:meta/meta.dart';

@immutable
abstract class CollectionListEvent {}

class FetchEvent extends CollectionListEvent {}
