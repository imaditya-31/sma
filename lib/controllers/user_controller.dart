import 'package:get/get.dart';

class UserController extends GetxController {
  // Dummy data for both students and teachers
  final assignedClasses = <String>[].obs;
  final studentSubjects = <String>[].obs;
  final timetable = <Map<String, String>>[].obs;
  final studentList = <String>[].obs;

  void loadTeacherData() {
    assignedClasses.assignAll(['10A', '10B']);
    timetable.assignAll([
      {'Monday': 'Math - 10A'},
      {'Tuesday': 'English - 10B'},
      {'Wednesday': 'Science - 10A'},
    ]);
    studentList.assignAll(['Rahul', 'Sneha', 'Ajay']);
  }

  void loadStudentData() {
    studentSubjects.assignAll(['Math', 'Science', 'English']);
    timetable.assignAll([
      {'Monday': 'Math'},
      {'Tuesday': 'Science'},
      {'Wednesday': 'English'},
    ]);
  }

  void clearData() {
    assignedClasses.clear();
    studentSubjects.clear();
    timetable.clear();
    studentList.clear();
  }
}
