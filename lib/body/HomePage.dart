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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _getCardTitle(index),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  _onCardTapped(context, index);
                },
                child: Card(
                  child: Center(
                    child: Text(
                      'Tap here',
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
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
}

class FirstScreen extends StatelessWidget {
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

class SecondScreen extends StatelessWidget {
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

class ThirdScreen extends StatelessWidget {
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

class FourthScreen extends StatelessWidget {
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
