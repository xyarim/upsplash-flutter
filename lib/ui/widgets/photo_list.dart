import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upsplash_app/blocs/photo_list/bloc.dart';
import 'package:upsplash_app/models/PhotoListResponse.dart';
import 'package:upsplash_app/repository/photo_repository.dart';

class PhotoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: _PhotoListWidget(),
      create: (context) => PhotoListBloc(MainPhotoRepository()),
    );
  }
}

class _PhotoListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotoListWidgetState();
}

class _PhotoListWidgetState extends State<_PhotoListWidget> {
  PhotoListBloc _bloc;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _bloc = BlocProvider.of<PhotoListBloc>(context);
    _bloc.add(FetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(FetchEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoListBloc, PhotoListState>(
      builder: (buildContext, state) {
        if (state is PhotoListError)
          return Center(
            child: Text("error"),
          );

        if (state is InitialPhotoListState)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (state is PhotoListLoaded) {
          return ListView.builder(
              itemCount: state.photos.length+1,
              controller: _scrollController,
              itemBuilder: (buildContext, index) {
                if (index >= state.photos.length) return BottomLoader();
                PhotoListBean item = state.photos[index];
                double displayWidth = MediaQuery.of(context).size.width;
                double finalHeight = displayWidth / (item.width / item.height);
                return FadeInImage.memoryNetwork(
                  image:item.urls.small,
                  placeholder: ,
                  width: displayWidth,
                  height: finalHeight,
                );
              });
        }

        return Center(child: Text("sesh"));
      },
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
