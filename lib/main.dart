import 'package:flutter/material.dart';
import 'package:movpass/config/colors.dart';
import 'package:movpass/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movpass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // Set the appbar theme once
          appBarTheme: AppBarTheme(
            color: primaryColor,
            centerTitle: false,
          )),
      home: Home(),
    );
  }
}