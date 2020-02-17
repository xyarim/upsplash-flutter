import 'package:flutter/material.dart';

final mainTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
        actionsIconTheme: IconThemeData(color: Colors.black87),
        color: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.black87, fontSize: 18),
          button: TextStyle(color: Colors.black87),
        )));
