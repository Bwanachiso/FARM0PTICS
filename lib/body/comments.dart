import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a controller for each text field
    final TextEditingController nameController = TextEditingController();
    final TextEditingController reviewController = TextEditingController();
    final TextEditingController suggestionController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'We value your feedback!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: reviewController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Your Review',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: suggestionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Suggestions for Improvement',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle the submission logic here
                    String name = nameController.text;
                    String review = reviewController.text;
                    String suggestion = suggestionController.text;

                    // You can add code here to send the data to a server or save it locally

                    // Show a confirmation dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Thank You!'),
                        content: Text('Your feedback has been submitted.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Optionally clear the text fields
                              nameController.clear();
                              reviewController.clear();
                              suggestionController.clear();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Submit Feedback'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
