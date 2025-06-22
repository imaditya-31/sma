import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class StudentDashboard extends StatelessWidget {
  final AuthController authController = Get.find();

  final String className = '10A';
  final List<String> subjects = ['Math', 'Science', 'English'];
  final Map<String, String> timetable = {
    'Monday': 'Math',
    'Tuesday': 'Science',
    'Wednesday': 'English',
  };

  StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authController.logout(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Class: $className', style: const TextStyle(fontSize: 18)),
          const Divider(),
          const Text('Subjects', style: TextStyle(fontSize: 18)),
          ...subjects.map((s) => ListTile(title: Text(s))),
          const Divider(),
          const Text('Timetable', style: TextStyle(fontSize: 18)),
          ...timetable.entries.map(
            (entry) => ListTile(
              title: Text('${entry.key}: ${entry.value}'),
            ),
          ),
        ],
      ),
    );
  }
}
