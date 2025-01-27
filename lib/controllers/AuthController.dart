import 'package:flutter/material.dart';
import 'package:flutter_app/views/DashboardScreen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Get.off(() => const DashboardScreen());
    } else {
      Get.snackbar("Error", "Invalid credentials");
    }
  }

  void logout() {
    Get.offAllNamed('/');
  }
}
