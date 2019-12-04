import 'package:meta/meta.dart';

@immutable
abstract class PhotoDetailState {}

class InitialPhotoDetailState extends PhotoDetailState {}

class DownloadingState extends PhotoDetailState {}

class DownloadedState extends PhotoDetailState {}

class ErrorDownloadingState extends PhotoDetailState {}
