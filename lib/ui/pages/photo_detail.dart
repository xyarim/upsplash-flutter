import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upsplash_app/models/PhotoListResponse.dart';

class PhotoDetailPageArguments {
  final PhotoListBean photoListBean;

  PhotoDetailPageArguments(this.photoListBean);
}

class PhotoDetailPage extends StatelessWidget {
  static final routeName = "photoDetailPage";

  @override
  Widget build(BuildContext context) {
    PhotoDetailPageArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.photoListBean.user.name),
      ),
      body: Hero(
        tag: "photo${args.photoListBean.id}",
        child: Image.network(args.photoListBean.urls.regular),
      ),
    );
  }
}
