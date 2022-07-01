import 'package:flutter/material.dart';
import 'package:third_app_animo/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}
