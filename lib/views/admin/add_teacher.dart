import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sma/controllers/admin_controller.dart';
import 'package:sma/models/teacher_model.dart';

class AddTeacherPage extends StatelessWidget {
  final AdminController adminController = Get.find();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();

  AddTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Teacher')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Teacher Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(labelText: 'Subject'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    adminController.addTeacher(TeacherModel(
                      id: DateTime.now().millisecondsSinceEpoch,
                      name: nameController.text,
                      subject: subjectController.text,
                    ));
                    Get.back();
                  }
                },
                child: const Text('Add Teacher'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
