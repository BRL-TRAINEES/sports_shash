import 'package:flutter/material.dart';
import 'package:football_app/screens/lottie.dart';
import 'screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football Players',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SScreen(),
    );
  }
}

