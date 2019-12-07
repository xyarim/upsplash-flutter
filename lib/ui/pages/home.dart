import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upsplash_app/repository/photo_repository.dart';
import 'package:upsplash_app/ui/widgets/collection_list.dart';
import 'package:upsplash_app/ui/widgets/photo_list.dart';

class HomePage extends StatelessWidget {
  static final routeName = "homePage";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upsplash"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Collections",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PhotoListWidget(MainPhotoRepository()),
            CollectionListWidget()
          ],
        ),
      ),
    );
  }
}
