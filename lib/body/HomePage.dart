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
              Image.asset(
                _getCardImage(index),
                width: 100,
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  _onCardTapped(context, index);
                },
                child: Card(
                  child: Center(
                    child: Text(
                      _getCardTitle(index),
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
            icon: Icon(Icons.work),
            label: 'Labor & Resource management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Labor and Resource management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Comments',
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

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Farming'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Crop farming refers to the cultivation and harvesting of plants for various purposes, such as food, feed, fiber, oil, ornamental uses, and industrial applications. Here is an explanation of crop farming and 10 examples of crop farming:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Crop farming is the primary agricultural activity that involves growing and harvesting plants on a large scale. Farmers carefully select and cultivate specific plant species based on factors such as climate, soil conditions, market demand, and intended use. The main goals of crop farming are to maximize yields, ensure food security, and generate economic returns.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Some key aspects of crop farming include:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '1. Preparing the land through plowing, tilling, and fertilizing',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '2. Selecting and planting appropriate crop varieties',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '3. Providing water through irrigation or relying on natural rainfall',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '4. Managing pests, weeds, and diseases to protect the crops',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '5. Harvesting the mature crops at the right time',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '6. Processing, storing, and distributing the harvested crops',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '10 examples of common crop farming practices:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '1. Wheat farming - Wheat is a staple food grain cultivated worldwide.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '2. Rice farming - Rice is a major food crop, especially in Asia.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '3. Corn (maize) farming - Corn is used for food, animal feed, and industrial products.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '4. Soybean farming - Soybeans are grown for their oil and protein-rich seeds.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '5. Cotton farming - Cotton is a fiber crop used in the textile industry.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '6. Sugarcane farming - Sugarcane is grown to produce sugar and other sweeteners.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '7. Potato farming - Potatoes are an important food crop grown globally.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '8. Fruit farming - Fruits like apples, oranges, and bananas are cultivated commercially.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '9. Vegetable farming - A wide variety of vegetables are grown for human consumption.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '10. Tobacco farming - Tobacco is an industrial crop used in cigarettes and other products.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview of Animal Farming:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'What is Animal Farming?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Animal farming is the practice of rearing and managing animals for food requirements like meat, milk, and eggs, as well as for other purposes such as plowing, transportation, and producing materials like wool and leather. It is an integral part of agriculture and has been a fundamental aspect of human society for centuries.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Benefits of Animal Farming:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '1. Food Production: Livestock farming provides a significant source of protein and essential nutrients through products like meat, milk, and eggs.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '2. Economic Value: Animal farming creates job opportunities, generates revenue, and contributes to the economy.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '3. Sustainability: It is a sustainable practice that supports food security and provides a range of products beyond food, such as leather, wool, and fertilizer.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '4. Environmental Sustainability: Livestock farming can help maintain environmental sustainability by converting waste into nutrient-dense foods and aiding in soil fertility.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '5. Cultural Importance: Animals have been essential for human survival and have cultural significance in many societies.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Different Types of Animal Farming:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '1. Cattle Farming: Involves rearing cattle for meat and milk production, as well as for labor purposes like plowing and irrigation.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '2. Poultry Farming: Focuses on raising birds like chickens for meat and eggs.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '3. Fish Farming: Involves raising fish for consumption and other products.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '4. Dairy Farming: Primarily focuses on producing milk for human consumption.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '5. Buffalo Farming: Includes rearing buffaloes for milk, meat, hides, and bones.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '6. Pig Farming: Involves raising pigs for meat production.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '7. Precision Livestock Farming: Utilizes technology to manage livestock health, welfare, and productivity efficiently.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '8. Extensive Farming: Allows livestock to roam freely in pastures and feeding areas.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'In conclusion, animal farming is a diverse and essential practice that contributes significantly to food production, economic growth, and sustainability. By understanding its various types and benefits, we appreciate the vital role that animal farming plays in meeting human needs and supporting livelihoods worldwide.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
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
