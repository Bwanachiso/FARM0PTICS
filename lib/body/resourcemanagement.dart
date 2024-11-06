import 'package:flutter/material.dart';

void main() {
  runApp(ResourceManagement());
}

class ResourceManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResourceManagementHome(),
    );
  }
}

class ResourceManagementHome extends StatefulWidget {
  @override
  _ResourceManagementHomeState createState() => _ResourceManagementHomeState();
}

class _ResourceManagementHomeState extends State<ResourceManagementHome> {
  List<Map<String, dynamic>> products = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();

  String _farmingType = 'Animal Farming';
  String _selectedAnimal = 'Cow';
  String _selectedCrop = 'Maize';
  String _selectedUnit = 'kg';
  String _result = '';

  // Animal feed requirements (in kg per day)
  final Map<String, double> animalFeedRequirements = {
    'Cow': 30.0,
    'Chicken': 0.2,
    'Goat': 5.0,
    'Pig': 8.0,
  };

  // Seed rate per hectare for different crops
  final Map<String, double> cropSeedRates = {
    'Maize': 20.0, // kg per hectare
    'Rice': 80.0, // kg per hectare
    'Wheat': 120.0, // kg per hectare
  };

  String getHelperText() {
    if (_farmingType == 'Animal Farming') {
      return '''
Animal Farming:
- Cows: 30 kg of feed per day.
- Chickens: 0.2 kg of feed per day.
- Goats: 5 kg of feed per day.
- Pigs: 8 kg of feed per day.
- Ensure constant water supply (liters).
''';
    } else {
      return '''
Crop Farming:
- Maize: 20 kg of seed per hectare.
- Rice: 80 kg of seed per hectare.
- Wheat: 120 kg of seed per hectare.
- Fertilizer: 10 kg per hectare (stored in 50 kg bags).
- Water: 1-2 inches weekly (or liters via irrigation).
''';
    }
  }

  void addProduct() {
    final String name = _nameController.text;
    final int? quantity = int.tryParse(_quantityController.text);

    if (name.isNotEmpty && quantity != null) {
      setState(() {
        products
            .add({'name': name, 'quantity': quantity, 'unit': _selectedUnit});
      });
      _nameController.clear();
      _quantityController.clear();
    }
  }

  void calculateStock() {
    final int? input =
        int.tryParse(_inputController.text); // Animal count or hectares
    final int? days =
        int.tryParse(_daysController.text); // Only for animal farming

    if (input == null || input <= 0) {
      setState(() {
        _result = 'Please enter a valid number.';
      });
      return;
    }

    if (_farmingType == 'Animal Farming') {
      if (days == null || days <= 0) {
        setState(() {
          _result = 'Please enter valid days.';
        });
        return;
      }

      double feedPerAnimal = animalFeedRequirements[_selectedAnimal]!;
      double dailyRequirement = input * feedPerAnimal;
      double totalRequirement = dailyRequirement * days;
      double bags = totalRequirement / 50;

      setState(() {
        _result = '''
Stock Requirement for Animal Farming:
- Daily Feed: ${dailyRequirement.toStringAsFixed(1)} kg
- Total Feed for $days day(s): ${totalRequirement.toStringAsFixed(1)} kg
- Equivalent to ${bags.toStringAsFixed(1)} bags (50 kg each)
''';
      });
    } else {
      double seedRate = cropSeedRates[_selectedCrop]!;
      double totalSeed = input * seedRate;
      double bags = totalSeed / 50;

      setState(() {
        _result = '''
Seed Requirement for Crop Farming:
- Crop: $_selectedCrop
- Field Size: $input hectare(s)
- Total Seed: ${totalSeed.toStringAsFixed(1)} kg
- Equivalent to ${bags.toStringAsFixed(1)} bags (50 kg each)
''';
      });
    }

    _inputController.clear();
    _daysController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _inputController.dispose();
    _daysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farming Stock Management'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: _farmingType,
              onChanged: (String? newValue) {
                setState(() {
                  _farmingType = newValue!;
                  _inputController.clear();
                  _daysController.clear();
                  _result = '';
                });
              },
              items: <String>['Animal Farming', 'Crop Farming']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            if (_farmingType == 'Animal Farming') ...[
              DropdownButton<String>(
                value: _selectedAnimal,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedAnimal = newValue!;
                  });
                },
                items: animalFeedRequirements.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number of $_selectedAnimal(s)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _daysController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number of Days',
                  border: OutlineInputBorder(),
                ),
              ),
            ] else ...[
              DropdownButton<String>(
                value: _selectedCrop,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCrop = newValue!;
                  });
                },
                items: cropSeedRates.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Field Size (hectares)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: calculateStock,
              child: Text('Calculate Stock Requirement'),
            ),
            SizedBox(height: 10),
            Text(
              _result,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedUnit = newValue!;
                });
              },
              items: <String>['kg', 'bags', 'liters', 'ml']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addProduct,
              child: Text('Add Product'),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    title: Text(product['name']),
                    subtitle: Text(
                      'Quantity: ${product['quantity']} ${product['unit']}',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
