import 'package:flutter/material.dart';
import './auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Set your login page as the home screen
    );
  }
}
