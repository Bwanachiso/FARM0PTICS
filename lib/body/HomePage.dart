import 'package:flutter/material.dart';
import '../providers/user_provider.dart';
import '../services/auth_services.dart';
import 'package:provider/provider.dart';
import 'FirstScreen.dart';
import 'SecondScreen.dart';
import 'ThirdScreen.dart';
import 'FourthScreen.dart';

void main() {
  runApp(const FarmopticsApp());
}

class FarmopticsApp extends StatelessWidget {
  const FarmopticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FARMOPTICS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FarmopticsHomePage(),
    );
  }
}

class FarmopticsHomePage extends StatefulWidget {
  const FarmopticsHomePage({super.key});

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
          MaterialPageRoute(builder: (context) => const FirstScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ThirdScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FourthScreen()),
        );
        break;
    }
  }

  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FARMOPTICS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => signOutUser(context),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (user != null) ...[
            Text('ID: ${user.id}'),
            Text('Email: ${user.email}'),
            Text('Name: ${user.name}'),
            const SizedBox(height: 20),
          ],
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
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
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            _getCardTitle(index),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
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
