import 'package:flutter/material.dart';

class comments extends StatelessWidget {
  const comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('comments'),
      ),
      body: Center(
        child: Text('comments Content'),
      ),
    );
  }
}
