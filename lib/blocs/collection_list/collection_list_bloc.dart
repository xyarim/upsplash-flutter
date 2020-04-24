import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:upsplash_app/repository/collection_repository.dart';

import './bloc.dart';
import 'bloc.dart';
import 'bloc.dart';
import 'bloc.dart';

class CollectionListBloc
    extends Bloc<CollectionListEvent, CollectionListState> {
  final CollectionRepository _repository;

  CollectionListBloc(this._repository);

  @override
  CollectionListState get initialState => InitialCollectionListState();



  @override
  Stream<Transition<CollectionListEvent, CollectionListState>> transformEvents(
      Stream<CollectionListEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(
          Duration(milliseconds: 500),
        ),
        transitionFn);
  }

  @override
  Stream<CollectionListState> mapEventToState(
    CollectionListEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchEvent) {
      try {
        if (currentState is InitialCollectionListState) {
          final collections = await _repository.getCollections(0);
          yield CollectionListLoaded(collections, 0);
        } else if (currentState is CollectionListLoaded) {
          var fetchPage = currentState.page + 1;
          final collections = await _repository.getCollections(fetchPage);

          yield collections.isEmpty
              ? currentState.copyWith(collections, fetchPage)
              : CollectionListLoaded(
                  currentState.collections + collections, fetchPage);
        }
      } catch (error, stacktrace) {
        yield CollectionListError();
        print(error);
        print(stacktrace);
      }
    }
  }
}
