import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class TeacherDashboard extends StatelessWidget {
  final AuthController authController = Get.find();

  final List<String> assignedClasses = ['10A', '10B'];
  final Map<String, String> timetable = {
    'Monday': 'Math - 10A',
    'Tuesday': 'English - 10B',
    'Wednesday': 'Science - 10A',
  };
  final List<String> students = ['Rahul', 'Sneha', 'Ajay'];

  TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
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
          const Text('Assigned Classes', style: TextStyle(fontSize: 18)),
          ...assignedClasses.map((c) => ListTile(title: Text(c))),
          const Divider(),
          const Text('Timetable', style: TextStyle(fontSize: 18)),
          ...timetable.entries.map(
            (entry) => ListTile(
              title: Text('${entry.key}: ${entry.value}'),
            ),
          ),
          const Divider(),
          const Text('Student List', style: TextStyle(fontSize: 18)),
          ...students.map((s) => ListTile(title: Text(s))),
        ],
      ),
    );
  }
}
