import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/student_model.dart';
import '../../controllers/admin_controller.dart';

class StudentListPage extends StatelessWidget {
  final AdminController adminController = Get.find();
  final TextEditingController searchController = TextEditingController();

  StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<StudentModel> filteredStudents =
        adminController.students.toList().obs;

    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      filteredStudents.value = adminController.students
          .where((s) => s.name.toLowerCase().contains(query))
          .toList();
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Student List')),
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
                  itemCount: filteredStudents.length,
                  itemBuilder: (context, index) {
                    final student = filteredStudents[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text('Class: ${student.className}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          adminController.deleteStudent(student.id);
                          filteredStudents.remove(student);
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
