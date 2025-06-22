import 'package:get/get.dart';
import '../views/login_page.dart';
import '../utils/notification_page.dart';
import '../views/admin/add_student.dart';
import '../views/admin/add_teacher.dart';
import '../views/admin/student_list.dart';
import '../views/admin/teacher_list.dart';
import '../views/admin/admin_dashboard.dart';
import '../views/splash_page.dart';
import '../views/user/student_dashboard.dart';
import '../views/user/teacher_dashboard.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String adminDashboard = '/admin-dashboard';
  static const String addStudent = '/add-student';
  static const String addTeacher = '/add-teacher';
  static const String studentList = '/student-list';
  static const String teacherList = '/teacher-list';
  static const String studentDashboard = '/student-dashboard';
  static const String teacherDashboard = '/teacher-dashboard';
  static const String notifications = '/notifications';

  static final routes = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: adminDashboard, page: () => AdminDashboard()),
    GetPage(name: addStudent, page: () => AddStudentPage()),
    GetPage(name: addTeacher, page: () => AddTeacherPage()),
    GetPage(name: studentList, page: () => StudentListPage()),
    GetPage(name: teacherList, page: () => TeacherListPage()),
    GetPage(name: studentDashboard, page: () => StudentDashboard()),
    GetPage(name: teacherDashboard, page: () => TeacherDashboard()),
    GetPage(name: notifications, page: () => NotificationPage()),
  ];
}
