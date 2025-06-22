import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/admin_controller.dart';
import '../../models/teacher_model.dart';

class TeacherListPage extends StatelessWidget {
  final AdminController adminController = Get.find();
  final TextEditingController searchController = TextEditingController();

  TeacherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxList<TeacherModel> filteredTeachers =
        adminController.teachers.toList().obs;

    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      filteredTeachers.value = adminController.teachers
          .where((t) => t.name.toLowerCase().contains(query))
          .toList();
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Teacher List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: filteredTeachers.length,
                  itemBuilder: (context, index) {
                    final teacher = filteredTeachers[index];
                    return ListTile(
                      title: Text(teacher.name),
                      subtitle: Text('Subject: ${teacher.subject}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          adminController.deleteTeacher(teacher.id);
                          filteredTeachers.remove(teacher);
                        },
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
