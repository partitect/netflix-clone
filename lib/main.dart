import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/stretch_head.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StretchHeader(),
    );
  }
}
