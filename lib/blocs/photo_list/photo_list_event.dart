import 'package:equatable/equatable.dart';

abstract class PhotoListEvent extends Equatable {
  const PhotoListEvent();

  @override
  List<Object> get props => [];
}

class FetchEvent extends PhotoListEvent {}
