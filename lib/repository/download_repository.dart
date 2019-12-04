import 'package:image_downloader/image_downloader.dart';
import 'package:upsplash_app/models/PhotoListResponse.dart';

abstract class DownloadRepository {
  Future downloadImage(PhotoListBean photoListBean);
}

class UpshplashDownloadRepository implements DownloadRepository {
  @override
  downloadImage(PhotoListBean photoListBean) async {
    await ImageDownloader.downloadImage(
      photoListBean.urls.raw,
      destination: AndroidDestinationType.custom(
        directory: "upsplash",
      )..subDirectory("${photoListBean.id}.jpg"),
    );
  }
}
