import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resource Management'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTile(
                title: Text(
                  'Resource Management in Farming',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resource management in the context of farming refers to the strategic planning, organization, and control of various agricultural resources to achieve optimal productivity, profitability, and sustainability. The key purpose of resource management in farming is to ensure the efficient and effective utilization of limited resources, such as land, water, labor, capital, and inputs, to meet the farm\'s objectives.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Benefits of Effective Resource Management',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Key Functionalities of Resource Management',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          'By implementing comprehensive resource management practices, farmers can optimize the use of their available resources, improve overall farm performance, and ensure the long-term sustainability of their agricultural operations.',
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
