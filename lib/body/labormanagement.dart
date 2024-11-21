import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LaborManagement()));
}

class LaborManagement extends StatefulWidget {
  const LaborManagement({Key? key}) : super(key: key);

  @override
  _LaborManagementState createState() => _LaborManagementState();
}

class _LaborManagementState extends State<LaborManagement> {
  String? _selectedFarmType;
  final TextEditingController _workerController = TextEditingController();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskTimeController = TextEditingController();
  int? _totalWorkersAvailable;
  String _workersForTask = '';
  String _taskDuration = '';

  // Stores user-defined tasks with status
  final Map<String, Map<String, dynamic>> _userTasks = {};

  @override
  void dispose() {
    _workerController.dispose();
    _taskNameController.dispose();
    _taskTimeController.dispose();
    super.dispose();
  }

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
    final String taskName = _taskNameController.text;
    final int? taskTime = int.tryParse(_taskTimeController.text);

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
        const SnackBar(content: Text('Please enter valid task details')),
      );
    }
  }

  void _clearCompletedTasks() {
    setState(() {
      _userTasks.removeWhere((_, value) => value['completed'] == true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labor Management'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Labor Management System',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedFarmType,
              hint: const Text('Select Farm Type'),
              isExpanded: true,
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
            const SizedBox(height: 20),
            TextField(
              controller: _workerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter total number of workers available',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _totalWorkersAvailable = int.tryParse(value);
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _taskNameController,
              decoration: const InputDecoration(
                labelText: 'Enter task name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _taskTimeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter time required for task (in hours)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addNewTask,
                  child: const Text('Add Task'),
                ),
                ElevatedButton(
                  onPressed: _clearCompletedTasks,
                  child: const Text('Clear Completed Tasks'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_userTasks.isNotEmpty) ...[
              const Text(
                'Available Tasks:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _userTasks.length,
                itemBuilder: (context, index) {
                  final taskName = _userTasks.keys.elementAt(index);
                  return Card(
                    child: ListTile(
                      title: Text(taskName),
                      subtitle: Text(
                          'Estimated time: ${_userTasks[taskName]!['time']} hours'),
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
                    ),
                  );
                },
              ),
            ],
            const SizedBox(height: 20),
            if (_workersForTask.isNotEmpty)
              Text(
                _workersForTask,
                style: const TextStyle(fontSize: 18, color: Colors.blue),
              ),
            if (_taskDuration.isNotEmpty)
              Text(
                _taskDuration,
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
