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
  final TextEditingController _workerNameController = TextEditingController();
  final TextEditingController _workerStrengthController =
      TextEditingController();

  Map<String, Map<String, dynamic>> _workers = {}; // Workers' details
  Map<String, Map<String, dynamic>> _userTasks = {}; // Tasks' details

  String _taskFeedback = '';

  @override
  void dispose() {
    _workerController.dispose();
    _taskNameController.dispose();
    _taskTimeController.dispose();
    _workerNameController.dispose();
    _workerStrengthController.dispose();
    super.dispose();
  }

  // Add a new worker
  void _addWorker() {
    final String workerName = _workerNameController.text;
    final String workerStrength = _workerStrengthController.text;

    if (workerName.isNotEmpty && workerStrength.isNotEmpty) {
      setState(() {
        _workers[workerName] = {
          'strength': workerStrength,
          'experience': 0, // Starts with no experience
        };
        _workerNameController.clear();
        _workerStrengthController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid worker details')),
      );
    }
  }

  // Add a new task
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

  // Assign task to workers based on strengths and farm type
  void _assignTask(String taskName) {
    if (_workers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No workers available for the task')),
      );
      return;
    }

    final taskDetails = _userTasks[taskName];
    final int taskTime = taskDetails?['time'] ?? 0;

    List<String> assignedWorkers = [];
    for (var worker in _workers.entries) {
      final String name = worker.key;
      final String strength = worker.value['strength'];

      if (taskName.contains(strength)) {
        assignedWorkers.add(name);
      }

      if (assignedWorkers.length >= 3) break; // Limit workers to 3 per task
    }

    if (assignedWorkers.isNotEmpty) {
      setState(() {
        // Update task status
        _userTasks[taskName]?['completed'] = true;

        // Update worker experience
        for (var workerName in assignedWorkers) {
          _workers[workerName]?['experience'] += 10; // Increment experience
        }

        _taskFeedback =
            "Task '$taskName' assigned to: ${assignedWorkers.join(', ')}";
      });
    } else {
      _taskFeedback = "No suitable workers found for task '$taskName'.";
    }
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
          children: <Widget>[
            const Text(
              'Labor Management System',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Add Worker Section
            const Text(
              'Add Worker:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _workerNameController,
              decoration: const InputDecoration(
                labelText: 'Enter worker name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _workerStrengthController,
              decoration: const InputDecoration(
                labelText: 'Enter worker strength (e.g., planting, feeding)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addWorker,
              child: const Text('Add Worker'),
            ),
            const SizedBox(height: 20),

            // Worker List
            if (_workers.isNotEmpty) ...[
              const Text(
                'Workers:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _workers.length,
                itemBuilder: (context, index) {
                  final workerName = _workers.keys.elementAt(index);
                  final workerDetails = _workers[workerName]!;
                  return ListTile(
                    title: Text(workerName),
                    subtitle: Text(
                      'Strength: ${workerDetails['strength']}, Experience: ${workerDetails['experience']}',
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],

            // Add Task Section
            const Text(
              'Add Task:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addNewTask,
              child: const Text('Add Task'),
            ),
            const SizedBox(height: 20),

            // Task List
            if (_userTasks.isNotEmpty) ...[
              const Text(
                'Tasks:',
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
                        'Time: ${_userTasks[taskName]?['time']} hours',
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => _assignTask(taskName),
                        child: const Text('Assign Task'),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],

            // Feedback Section
            if (_taskFeedback.isNotEmpty)
              Text(
                _taskFeedback,
                style: const TextStyle(fontSize: 18, color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}
