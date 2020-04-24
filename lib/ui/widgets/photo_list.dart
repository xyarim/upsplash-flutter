import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:upsplash_app/blocs/photo_list/bloc.dart';
import 'package:upsplash_app/models/PhotoListResponse.dart';
import 'package:upsplash_app/repository/photo_repository.dart';
import 'package:upsplash_app/ui/pages/photo_detail.dart';
import 'package:upsplash_app/utils/hex_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../utils/hex_color.dart';
import 'bottom_loader.dart';

class PhotoListWidget extends StatelessWidget {
  final PhotoRepository repository;

  const PhotoListWidget(this.repository) : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: _PhotoListWidget(),
      create: (context) => PhotoListBloc(repository),
    );
  }
}

class _PhotoListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotoListWidgetState();
}

class _PhotoListWidgetState extends State<_PhotoListWidget>
    with AutomaticKeepAliveClientMixin {
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
              itemCount: state.photos.length + 1,
              controller: _scrollController,
              itemBuilder: (buildContext, index) {
                if (index >= state.photos.length) return BottomLoader();
                PhotoListBean item = state.photos[index];
                return InkWell(
                  onTap: () {
                    _onPhotoTap(item);
                  },
                  child: Hero(
                    tag: "photo${item.id}",
                    child: InstaImage(
                      color: item.color,
                      urlImage: item.urls.regular,
                      itemWidth: item.width,
                      itemHeight: item.height,
                      user: item.user.username,
                      urlUserImage: item.user.profileImage.small,
                    ),
                  ),
                );
              });
        }

        return Center(child: Text("sesh"));
      },
    );
  }

  _onPhotoTap(PhotoListBean photoListBean) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoDetailPage(),
        // Pass the arguments as part of the RouteSettings. The
        // ExtractArgumentScreen reads the arguments from these
        // settings.
        settings: RouteSettings(
          arguments: PhotoDetailPageArguments(photoListBean),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class InstaImage extends StatelessWidget {
  final String user;
  final String urlImage;
  final String color;
  final String urlUserImage;
  final int itemWidth;
  final int itemHeight;

  const InstaImage({
    Key key,
    this.user,
    this.color,
    this.urlImage,
    this.urlUserImage,
    this.itemWidth,
    this.itemHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double displayWidth = MediaQuery.of(context).size.width-16;
    double finalHeight = displayWidth / (itemWidth / itemHeight);
              

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: urlUserImage,
                  imageBuilder: (context, imageProvier) => Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageProvier,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  user,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Stack(
            children: <Widget>[
              SizedBox(
                width: displayWidth,
                height: finalHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: HexColor(color)),
                ),
              ),
              FadeInImage.memoryNetwork(
                image: urlImage,
                placeholder: kTransparentImage,
                fit: BoxFit.fitWidth,
                width: displayWidth,
                height: finalHeight,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Divider(
              color: Color.fromARGB(255, 130, 130, 130),
              height: 20,
            ),
        
        ],
      ),
    );
  }
}
