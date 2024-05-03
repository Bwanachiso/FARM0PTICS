import 'package:flutter/material.dart';
import './body/HomePage.dart'; // Ensure this is the correct path for HomePage
import './auth/login.dart'; // Ensure this is the correct path for LoginScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title', // Optional: Add your app title
      theme: ThemeData(
        primarySwatch: Colors.blue, // Optional: Customize your app theme
      ),
      home: const LoginScreen(), // Set LoginScreen as the startup screen
    );
  }
}
