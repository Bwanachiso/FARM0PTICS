import 'package:flutter/material.dart';

void main() {
  runApp(Labormananagment());
}

class Labormananagment extends StatefulWidget {
  @override
  _LabormananagmentState createState() => _LabormananagmentState();
}

class _LabormananagmentState extends State<Labormananagment> {
  String? _selectedFarmType;
  TextEditingController _workerController = TextEditingController();
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskTimeController = TextEditingController();
  int? _totalWorkersAvailable;
  String _workersForTask = '';
  String _taskDuration = '';

  // Updated to include a map of task completion status
  Map<String, Map<String, dynamic>> _userTasks =
      {}; // Stores user-defined tasks with status

  // Function to calculate workers needed and duration for a task
  void _calculateWorkersAndTime(String task, int taskTime) {
    if (_totalWorkersAvailable != null && _selectedFarmType != null) {
      int workersNeeded;
      int timeForTask;

      if (_selectedFarmType == 'Manual') {
        workersNeeded = (_totalWorkersAvailable! * 0.8).toInt();
        timeForTask = taskTime; // Time remains the same for manual farms
      } else {
        workersNeeded = (_totalWorkersAvailable! * 0.5).toInt();
        timeForTask = (taskTime * 0.5).toInt(); // Automation speeds up tasks
      }

      setState(() {
        _workersForTask = 'Workers allocated for $task: $workersNeeded';
        _taskDuration = 'Estimated duration for $task: $timeForTask hours';
      });
    }
  }

  // Function to add a new task to the list
  void _addNewTask() {
    String taskName = _taskNameController.text;
    int? taskTime = int.tryParse(_taskTimeController.text);

    if (taskName.isNotEmpty && taskTime != null && taskTime > 0) {
      setState(() {
        _userTasks[taskName] = {
          'time': taskTime,
          'completed': false, // New field to track completion
        };
        _taskNameController.clear();
        _taskTimeController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid task details')),
      );
    }
  }

  // Function to clear completed tasks
  void _clearCompletedTasks() {
    setState(() {
      _userTasks.removeWhere((key, value) => value['completed'] == true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Labour Management'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Labour Management Content'),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: _selectedFarmType,
                  hint: Text('Select Farm Type'),
                  items: <String>['Automated', 'Manual'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedFarmType = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _workerController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter total number of workers available',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _totalWorkersAvailable = int.tryParse(value);
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _taskNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter task name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _taskTimeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter time required for task (in hours)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addNewTask,
                  child: Text('Add Task'),
                ),
                SizedBox(height: 20),

                // Button to clear completed tasks
                ElevatedButton(
                  onPressed: _clearCompletedTasks,
                  child: Text('Clear Completed Tasks'),
                ),

                SizedBox(height: 20),
                if (_userTasks.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        'Available Tasks:',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      ..._userTasks.keys.map((taskName) {
                        return ListTile(
                          title: Text(taskName),
                          subtitle: Text(
                              'Estimated time: ${_userTasks[taskName]!['time']} hours'),
                          trailing: Checkbox(
                            value: _userTasks[taskName]!['completed'],
                            onChanged: (bool? value) {
                              setState(() {
                                _userTasks[taskName]!['completed'] =
                                    value ?? false;
                              });
                            },
                          ),
                          onTap: () {
                            _calculateWorkersAndTime(
                                taskName, _userTasks[taskName]!['time']);
                          },
                        );
                      }).toList(),
                    ],
                  ),
                SizedBox(height: 20),
                if (_workersForTask.isNotEmpty)
                  Text(
                    _workersForTask,
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                SizedBox(height: 10),
                if (_taskDuration.isNotEmpty)
                  Text(
                    _taskDuration,
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void Main() {
  runApp( Labormananagment());
}

class labormananagment extends StatelessWidget {
  const Labormananagment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Labour Management Content'),
      ),
    );
  }
}
 