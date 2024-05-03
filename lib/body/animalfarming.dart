import 'package:flutter/material.dart';

void main() {
  runApp(animalfarming());
}

class animalfarming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Farming'),
      ),
      body: Center(
        child: Text('Animal Farming Content'),
      ),
    );
  }
}
