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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Labor Management in Farming:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Labor management in the context of farming involves the strategic organization and supervision of labor resources to optimize productivity and efficiency on the farm. It encompasses tasks such as recruitment, training, motivation, communication, delegation, and maintaining good labor relations. The primary goal of labor management in farming is to enhance human resource utilization, increase labor productivity, and ultimately boost profitability for the farm enterprise.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Benefits of Effective Labor Management:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '1. Efficient Resource Utilization: By planning, organizing, and controlling labor resources effectively, farms can ensure that human resources are utilized optimally, leading to increased productivity.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '2. Improved Productivity: Proper management practices, such as assigning tasks according to capabilities, providing incentives, and training workers, can enhance productivity levels, resulting in higher yields and outputs.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '3. Cost Control: Managing labor efficiently can help control labor costs, which typically constitute a significant portion of production expenses in agriculture.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '4. Enhanced Worker Performance: Motivated and well-managed workers tend to perform better, leading to improved quality of work, reduced errors, and increased output.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '5. Long-Term Sustainability: By fostering good labor relations, providing fair remuneration, and offering opportunities for growth and development, farms can create a positive work environment that encourages retention of skilled labor, contributing to long-term success and profitability.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'In summary, labor management in farming involves the strategic coordination of human resources to achieve operational efficiency, increase productivity, and ultimately drive profitability for the farm enterprise. By implementing sound labor management practices, farms can optimize their workforce, reduce costs, improve output quality, and create a conducive work environment that benefits both the farmer and the workers.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resource Management in Farming:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Resource management in the context of farming refers to the strategic planning, organization, and control of various agricultural resources to achieve optimal productivity, profitability, and sustainability. The key purpose of resource management in farming is to ensure the efficient and effective utilization of limited resources, such as land, water, labor, capital, and inputs, to meet the farm\'s objectives.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Benefits of Effective Resource Management:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '- Increased Productivity: Proper allocation and utilization of resources can lead to higher crop yields, better livestock performance, and overall increased agricultural output. Efficient management of inputs like fertilizers, pesticides, and water can enhance the efficiency of production processes.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Cost Optimization: Careful management of resources can help minimize waste, reduce input costs, and optimize the use of available resources. This can lead to improved profitability and financial sustainability for the farm.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Sustainability: Resource management practices that focus on long-term sustainability, such as soil conservation, water management, and biodiversity preservation, can ensure the continued viability of the farming system. This helps maintain the productive capacity of the land and natural resources for future generations.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Risk Mitigation: Effective resource management can help farmers anticipate and mitigate risks associated with factors like weather, pests, and market fluctuations. This can improve the farm\'s resilience and ability to withstand and recover from various challenges.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Key Functionalities of Resource Management:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '- Land Management: Optimizing the use of available land, including crop rotation, intercropping, and soil conservation practices. Ensuring sustainable land-use practices to maintain soil fertility and prevent degradation.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Water Management: Efficient irrigation systems, water conservation techniques, and water quality management. Addressing issues like water scarcity, waterlogging, and salinization.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Labor Management: Effective planning, organization, and utilization of farm labor to maximize productivity. Providing training, incentives, and good working conditions to enhance worker performance.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Input Management: Efficient use of agricultural inputs like fertilizers, pesticides, and seeds to optimize yields and minimize environmental impact. Adopting precision farming techniques and technologies to enhance input-use efficiency.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Capital Management: Effective financial planning, budgeting, and investment decisions to ensure the farm\'s financial viability and growth. Accessing and managing various sources of capital, such as loans, grants, and investments.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'By implementing comprehensive resource management practices, farmers can optimize the use of their available resources, improve overall farm performance, and ensure the long-term sustainability of their agricultural operations.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
