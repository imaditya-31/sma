import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sma/controllers/admin_controller.dart';
import 'package:sma/models/student_model.dart';

class AddStudentPage extends StatelessWidget {
  final AdminController adminController = Get.find();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();

  AddStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Student Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: classController,
                decoration: const InputDecoration(labelText: 'Class'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    adminController.addStudent(StudentModel(
                      id: DateTime.now().millisecondsSinceEpoch,
                      name: nameController.text,
                      className: classController.text,
                    ));
                    Get.back(); // Go back to dashboard
                  }
                },
                child: const Text('Add Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
