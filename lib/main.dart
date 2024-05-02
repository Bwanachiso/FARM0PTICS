import 'package:flutter/material.dart';
import './body/HomePage.dart'; // Adjust the import path as needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FarmopticsHomePage(), // Specify the HomePage widget as the home
    );
  }
}
