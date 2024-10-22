import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Farming'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            ExpansionTile(
              title: Text(
                'Definition of Crop Farming',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Crop farming refers to the cultivation and harvesting of plants for various purposes, such as food, feed, fiber, oil, ornamental uses, and industrial applications. Here is an explanation of crop farming and 10 examples of crop farming:\n\n'
                    'Crop farming is the primary agricultural activity that involves growing and harvesting plants on a large scale. Farmers carefully select and cultivate specific plant species based on factors such as climate, soil conditions, market demand, and intended use. The main goals of crop farming are to maximize yields, ensure food security, and generate economic returns.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Key Aspects of Crop Farming',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Some key aspects of crop farming include:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Examples of Crop Farming',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10 examples of common crop farming practices:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
