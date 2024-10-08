import 'package:flutter/material.dart';
import 'FirstScreen.dart';
import 'SecondScreen.dart';
import 'ThirdScreen.dart';
import 'FourthScreen.dart';
// Import the BottomNavBar

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
      home: FarmopticsHomePage(),
    );
  }
}

class FarmopticsHomePage extends StatefulWidget {
  @override
  _FarmopticsHomePageState createState() => _FarmopticsHomePageState();
}

class _FarmopticsHomePageState extends State<FarmopticsHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCardTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirstScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThirdScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FourthScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FARMOPTICS'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5, // Add shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _getCardImage(index),
                  width: 100,
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    _onCardTapped(context, index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0), // Padding around text
                    child: Center(
                      child: Text(
                        _getCardTitle(index),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight
                                .bold), // Increased font size and bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // bottomNavigationBar: BottomNavBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // ),
    );
  }

  String _getCardTitle(int index) {
    switch (index) {
      case 0:
        return 'CROP FARMING';
      case 1:
        return 'ANIMAL FARMING';
      case 2:
        return 'LABOUR MANAGEMENT';
      case 3:
        return 'RESOURCE MANAGEMENT';
      default:
        return '';
    }
  }

  String _getCardImage(int index) {
    switch (index) {
      case 0:
        return 'lib/images/Crop farming.jpg';
      case 1:
        return 'lib/images/animal farming.jpg';
      case 2:
        return 'lib/images/Labor management.jpg';
      case 3:
        return 'lib/images/Resource management.jpg';
      default:
        return '';
    }
  }
}
