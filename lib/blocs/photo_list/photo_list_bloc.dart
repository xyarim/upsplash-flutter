import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:upsplash_app/repository/photo_repository.dart';

import './bloc.dart';

class PhotoListBloc extends Bloc<PhotoListEvent, PhotoListState> {
  final PhotoRepository photoRepository;

  PhotoListBloc(this.photoRepository);

  @override
  PhotoListState get initialState => InitialPhotoListState();

  @override
  Stream<PhotoListState> transformEvents(
    Stream<PhotoListEvent> events,
    Stream<PhotoListState> Function(PhotoListEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<PhotoListEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<PhotoListState> mapEventToState(
    PhotoListEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchEvent) {
      try {
        if (currentState is InitialPhotoListState) {
          final photos = await photoRepository.getPhotos(0);
          yield PhotoListLoaded(photos, 0);
        } else if (currentState is PhotoListLoaded) {
          int currentPage = currentState.page;
          final photos =
          await photoRepository.getPhotos(currentPage++);
          print("current_page = $currentPage");
          yield photos.isEmpty
              ? currentState.copyWith(photos)
              : PhotoListLoaded(currentState.photos + photos, currentPage);
        }
      } catch (error, stacktrace) {
        yield PhotoListError();
        print(error);
        print(stacktrace);
      }
    }
  }
}
