import 'package:flutter/material.dart';

void main() {
  runApp(LaborManagement());
}

class LaborManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaborManagementHome(),
    );
  }
}

class LaborManagementHome extends StatefulWidget {
  @override
  _LaborManagementHomeState createState() => _LaborManagementHomeState();
}

class _LaborManagementHomeState extends State<LaborManagementHome> {
  String? _selectedFarmType;
  final TextEditingController _workerController = TextEditingController();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskTimeController = TextEditingController();
  int? _totalWorkersAvailable;
  String _workersForTask = '';
  String _taskDuration = '';

  Map<String, Map<String, dynamic>> _userTasks = {};

  void _calculateWorkersAndTime(String task, int taskTime) {
    if (_totalWorkersAvailable != null && _selectedFarmType != null) {
      int workersNeeded;
      int timeForTask;

      if (_selectedFarmType == 'Manual') {
        workersNeeded = (_totalWorkersAvailable! * 0.8).toInt();
        timeForTask = taskTime;
      } else {
        workersNeeded = (_totalWorkersAvailable! * 0.5).toInt();
        timeForTask = (taskTime * 0.5).toInt();
      }

      setState(() {
        _workersForTask = 'Workers allocated for $task: $workersNeeded';
        _taskDuration = 'Estimated duration for $task: $timeForTask hours';
      });
    }
  }

  void _addNewTask() {
    String taskName = _taskNameController.text;
    int? taskTime = int.tryParse(_taskTimeController.text);

    if (taskName.isNotEmpty && taskTime != null && taskTime > 0) {
      setState(() {
        _userTasks[taskName] = {
          'time': taskTime,
          'completed': false,
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

  void _clearCompletedTasks() {
    setState(() {
      _userTasks.removeWhere((key, value) => value['completed'] == true);
    });
  }

  @override
  void dispose() {
    _workerController.dispose();
    _taskNameController.dispose();
    _taskTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labor Management System'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
                        'Estimated time: ${_userTasks[taskName]!['time']} hours',
                      ),
                      trailing: Checkbox(
                        value: _userTasks[taskName]!['completed'],
                        onChanged: (bool? value) {
                          setState(() {
                            _userTasks[taskName]!['completed'] = value ?? false;
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
    );
  }
}
