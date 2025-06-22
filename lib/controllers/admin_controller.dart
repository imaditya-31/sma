import 'package:get/get.dart';
import 'package:sma/models/class_model.dart';
import 'package:sma/models/student_model.dart';
import 'package:sma/models/teacher_model.dart';

class AdminController extends GetxController {
  var students = <StudentModel>[].obs;
  var teachers = <TeacherModel>[].obs;
  var classes = <ClassModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    // Dummy students
    students.assignAll([
      StudentModel(id: 1, name: 'Aditya', className: '10A'),
      StudentModel(id: 2, name: 'Aditi', className: '10B'),
    ]);

    // Dummy teachers
    teachers.assignAll([
      TeacherModel(id: 1, name: 'Mr. Sharma', subject: 'Math'),
      TeacherModel(id: 2, name: 'Ms. Verma', subject: 'English'),
    ]);

    // Dummy classes
    classes.assignAll([
      ClassModel(name: '10A', subjects: ['Math', 'Science']),
      ClassModel(name: '10B', subjects: ['English', 'History']),
    ]);
  }

  void addStudent(StudentModel student) {
    students.add(student);
  }

  void addTeacher(TeacherModel teacher) {
    teachers.add(teacher);
  }

  void deleteStudent(int id) {
    students.removeWhere((student) => student.id == id);
  }

  void deleteTeacher(int id) {
    teachers.removeWhere((teacher) => teacher.id == id);
  }
}
