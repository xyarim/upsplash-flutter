import 'package:meta/meta.dart';

@immutable
abstract class PhotoDetailEvent {}

class DownloadImageEvent extends PhotoDetailEvent {}

