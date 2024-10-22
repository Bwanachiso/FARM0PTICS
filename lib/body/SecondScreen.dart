import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Farming'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTile(
                title: Text(
                  'Overview of Animal Farming',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Animal farming is the practice of rearing and managing animals for food requirements like meat, milk, and eggs, as well as for other purposes such as plowing, transportation, and producing materials like wool and leather. It is an integral part of agriculture and has been a fundamental aspect of human society for centuries.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Benefits of Animal Farming',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Different Types of Animal Farming',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Conclusion',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'In conclusion, animal farming is a diverse and essential practice that contributes significantly to food production, economic growth, and sustainability. By understanding its various types and benefits, we appreciate the vital role that animal farming plays in meeting human needs and supporting livelihoods worldwide.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
