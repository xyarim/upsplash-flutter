import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upsplash_app/ui/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MyApp());
}
