import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labour Management'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTile(
                title: Text(
                  'Labor Management in Farming',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Labor management in the context of farming involves the strategic organization and supervision of labor resources to optimize productivity and efficiency on the farm. It encompasses tasks such as recruitment, training, motivation, communication, delegation, and maintaining good labor relations. The primary goal of labor management in farming is to enhance human resource utilization, increase labor productivity, and ultimately boost profitability for the farm enterprise.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Benefits of Effective Labor Management',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Summary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'In summary, labor management in farming involves the strategic coordination of human resources to achieve operational efficiency, increase productivity, and ultimately drive profitability for the farm enterprise. By implementing sound labor management practices, farms can optimize their workforce, reduce costs, improve output quality, and create a conducive work environment that benefits both the farmer and the workers.',
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
