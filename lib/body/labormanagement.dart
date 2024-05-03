import 'package:flutter/material.dart';

void main() {
  runApp(Labormananagment());
}

class Labormananagment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labour Management'),
      ),
      body: Center(
        child: Text('Labour Management Content'),
      ),
    );
  }
}
