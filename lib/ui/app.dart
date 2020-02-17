import 'package:flutter/material.dart';
import 'package:upsplash_app/ui/pages/home.dart';
import 'package:upsplash_app/ui/pages/photo_detail.dart';
import 'package:upsplash_app/ui/styles/theme.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        PhotoDetailPage.routeName: (context) => PhotoDetailPage(),
      },
    );
  }
}
