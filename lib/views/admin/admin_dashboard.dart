import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sma/app/app_routes.dart';
import 'package:sma/controllers/auth_controller.dart';
import '../../controllers/admin_controller.dart';

class AdminDashboard extends StatelessWidget {
  final AdminController adminController = Get.find();
  final AuthController authController = Get.find();

  AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authController.logout(),
          )
        ],
      ),
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Overview',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildStatTile(
                      'Total Students', adminController.students.length),
                  _buildStatTile(
                      'Total Teachers', adminController.teachers.length),
                  _buildStatTile(
                      'Total Classes', adminController.classes.length),
                  const Divider(),
                  _buildNavButton('Add Student', AppRoutes.addStudent),
                  _buildNavButton('Add Teacher', AppRoutes.addTeacher),
                  _buildNavButton('Student List', AppRoutes.studentList),
                  _buildNavButton('Teacher List', AppRoutes.teacherList),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildStatTile(String label, int count) {
    return ListTile(
      title: Text(label),
      trailing: Text(count.toString(), style: const TextStyle(fontSize: 18)),
    );
  }

  Widget _buildNavButton(String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ElevatedButton(
        onPressed: () => Get.toNamed(route),
        child: Text(title),
      ),
    );
  }
}
