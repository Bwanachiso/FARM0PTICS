import 'package:farmoptics/body/HomePage.dart';
import 'package:farmoptics/body/comments.dart';
import 'package:farmoptics/body/resourcemanagement.dart';
import 'package:flutter/material.dart';
import '../body/FourthScreen.dart';
import '../body/SecondScreen.dart';
import '../body/ThirdScreen.dart';
import '../body/labormanagement.dart';
import '../body/settings.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'labour'),
        BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on), label: 'Resources'),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded), label: 'Comments'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'SettingsScreen'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FarmopticsApp()));
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Labormananagment()));
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Resourcemangement()));
          case 3:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => comments()));
          case 4:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
        }
        onItemTapped(index);
      },
      type: BottomNavigationBarType.fixed,
    );
  }
}
