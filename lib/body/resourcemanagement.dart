import 'package:flutter/material.dart';

void main() {
  runApp(const Resourcemangement());
}

class Resourcemangement extends StatelessWidget {
  const Resourcemangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Resource Management Content'),
      ),
    );
  }
}
