import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission/permission.dart';
import 'package:upsplash_app/blocs/photo_detail/bloc.dart';
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
    return BlocProvider(
      create: (context) => PhotoDetailBloc(args.photoListBean),
      child: PhotoDetailWidget(
        photoListBean: args.photoListBean,
      ),
    );
  }
}

class PhotoDetailWidget extends StatefulWidget {
  final PhotoListBean photoListBean;

  const PhotoDetailWidget({Key key, this.photoListBean}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PhotoDetailWidgetState();
  }
}

class PhotoDetailWidgetState extends State<PhotoDetailWidget> {
  PhotoDetailBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<PhotoDetailBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoDetailBloc, PhotoDetailState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.photoListBean.user.name),
          ),
          body: Hero(
            tag: "photo${widget.photoListBean.id}",
            child: Image.network(widget.photoListBean.urls.regular),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () async {
                _onSavePressed();
              },
              child: (state is DownloadingState)
                  ? _buildLoading()
                  : Icon(Icons.file_download,color: Colors.white,)));
    });
  }

  Future<bool> _checkPermission() async {
    var permissions = await Permission.getPermissionsStatus([
      PermissionName.Storage,
    ]);
    return permissions[0].permissionStatus == PermissionStatus.allow;
  }

  _onSavePressed() async {
    if (await _checkPermission()) {
      _bloc.add(DownloadImageEvent());
    } else {
      await _requestPermission();
      _onSavePressed();
    }
  }

  _requestPermission() async {
    var permissionNames =
        await Permission.requestPermissions([PermissionName.Storage]);
  }

  _buildLoading() {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
