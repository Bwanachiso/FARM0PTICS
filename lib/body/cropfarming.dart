import 'package:flutter/material.dart';

void main() {
  runApp(FarmopticsApp());
}

class FarmopticsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FARMOPTICS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: cropfarming(),
    );
  }
}

class cropfarming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Farming'),
      ),
      body: Center(
        child: Text('Crop Farming Content'),
      ),
    );
  }
}
