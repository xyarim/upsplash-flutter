import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:upsplash_app/models/PhotoListResponse.dart';
import 'package:upsplash_app/repository/download_repository.dart';

import './bloc.dart';

class PhotoDetailBloc extends Bloc<PhotoDetailEvent, PhotoDetailState> {
  final PhotoListBean _photoListBean;
  final DownloadRepository downloadRepository = UpshplashDownloadRepository();

  PhotoDetailBloc(this._photoListBean);

  @override
  PhotoDetailState get initialState => InitialPhotoDetailState();

  @override
  Stream<PhotoDetailState> mapEventToState(
    PhotoDetailEvent event,
  ) async* {
    final currentState = state;
    if (event is DownloadImageEvent && !(currentState is DownloadingState)) {
      yield* _mapDownloadToState();
    }
  }

  Stream<PhotoDetailState> _mapDownloadToState() async* {
    try {
      yield DownloadingState();
      await downloadRepository.downloadImage(_photoListBean);
      yield DownloadedState();
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      yield ErrorDownloadingState();
    }
  }
}
