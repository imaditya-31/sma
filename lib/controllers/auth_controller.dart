import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var userRole = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserRole();
  }

  void loadUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString('role') ?? '';
    userRole.value = role;
    print('[AuthController] Loaded role: $role');
  }

  void login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (username == 'admin' && password == 'admin123') {
      userRole.value = 'admin';
      await prefs.setString('role', 'admin');
      Get.offAllNamed('/admin-dashboard');
    } else if (username == 'teacher' && password == 'teacher123') {
      userRole.value = 'teacher';
      await prefs.setString('role', 'teacher');
      Get.offAllNamed('/teacher-dashboard');
    } else if (username == 'student' && password == 'student123') {
      userRole.value = 'student';
      await prefs.setString('role', 'student');
      Get.offAllNamed('/student-dashboard');
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('role');
    userRole.value = '';
    Get.offAllNamed('/login');
  }
}
