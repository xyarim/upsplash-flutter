import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upsplash_app/ui/widgets/photo_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoListWidget(),
    );
  }
}
