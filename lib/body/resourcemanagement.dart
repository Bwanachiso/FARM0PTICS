import 'package:flutter/material.dart';

void main() {
  runApp(Resourcemangement());
}

class Resourcemangement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Management'),
      ),
      body: Center(
        child: Text('Resource Management Content'),
      ),
    );
  }
}
