import 'package:flutter/material.dart';

void main() {
  runApp(const Resourcemangement());
}

class Resourcemangement extends StatelessWidget {
  const Resourcemangement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Resource Management'),
        ),
        body: const ResourceManagementContent(),
      ),
    );
  }
}

class ResourceManagementContent extends StatefulWidget {
  const ResourceManagementContent({super.key});

  @override
  _ResourceManagementContentState createState() =>
      _ResourceManagementContentState();
}

class _ResourceManagementContentState extends State<ResourceManagementContent> {
  String farmType = "Automated"; // Default farm type
  String farmingCategory = ""; // Default farming category
  String selectedAnimal = ""; // Selected animal for farming
  String selectedPlant = ""; // Selected plant for farming
  int duration = 1; // Days for feeding calculation
  double area = 1.0; // Area for seed calculation

  // Feeding requirements for common animals (kg/day)
  final Map<String, double> animalFeedingRequirements = {
    "Cow": 20.0,
    "Goat": 4.0,
    "Chicken": 0.2,
    "Pig": 6.0,
    "Sheep": 5.0,
  };

  // Seed requirements for common plants (kg/hectare)
  final Map<String, double> plantSeedRequirements = {
    "Maize": 20.0,
    "Wheat": 120.0,
    "Rice": 80.0,
    "Soybeans": 60.0,
    "Potatoes": 2000.0,
  };

  // Healthy tips for crops
  final Map<String, String> cropTips = {
    "Maize": "Apply nitrogen fertilizer 2-3 weeks after planting.",
    "Wheat": "Use phosphate-based fertilizer at the time of sowing.",
    "Rice": "Apply urea during the tillering stage.",
    "Soybeans": "Use potash fertilizer during pod formation.",
    "Potatoes": "Apply potassium fertilizer before planting.",
  };

  void _showAnimalFarmingDialog() {
    showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          title: const Text("Animal Farming - Feeding Calculation"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Select Animal"),
                value: selectedAnimal.isEmpty ? null : selectedAnimal,
                items: animalFeedingRequirements.keys
                    .map((animal) => DropdownMenuItem(
                          value: animal,
                          child: Text(animal),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAnimal = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: "Duration (days)"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  duration = int.tryParse(value) ?? 1;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (selectedAnimal.isNotEmpty) {
                  double dailyFeed =
                      animalFeedingRequirements[selectedAnimal] ?? 0.0;
                  double totalFeed = dailyFeed * duration;

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Feed Calculation for $selectedAnimal"),
                      content: Text(
                        "Daily Feed: ${dailyFeed.toStringAsFixed(2)} kg\n"
                        "Total Feed for $duration days: ${totalFeed.toStringAsFixed(2)} kg",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
                Navigator.pop(context);
              },
              child: const Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }

  void _showCropFarmingDialog() {
    showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          title: const Text("Crop Farming - Seed Calculation"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Select Plant"),
                value: selectedPlant.isEmpty ? null : selectedPlant,
                items: plantSeedRequirements.keys
                    .map((plant) => DropdownMenuItem(
                          value: plant,
                          child: Text(plant),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPlant = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: "Area (hectares)"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  area = double.tryParse(value) ?? 1.0;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (selectedPlant.isNotEmpty) {
                  double seedRequirement =
                      plantSeedRequirements[selectedPlant] ?? 0.0;
                  double totalSeeds = seedRequirement * area;
                  String tip = cropTips[selectedPlant] ?? "No tips available.";

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Seed Calculation for $selectedPlant"),
                      content: Text(
                        "Seed Required: ${totalSeeds.toStringAsFixed(2)} kg\n\n"
                        "Healthy Tips:\n$tip",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
                Navigator.pop(context);
              },
              child: const Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Select a farming category and calculate resources",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (farmingCategory == "Animal Farming") {
                  _showAnimalFarmingDialog();
                } else if (farmingCategory == "Crop Farming") {
                  _showCropFarmingDialog();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Please select a farming category")),
                  );
                }
              },
              child: const Text("Calculate Resources"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
