import 'package:flutter/material.dart';
import 'package:flutter_app/bindings/InitialBinding.dart';
import 'package:flutter_app/controllers/AuthController.dart';
import 'package:flutter_app/views/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('Login with valid credentials', () {
    final controller = AuthController();
    controller.usernameController.text = 'testuser';
    controller.passwordController.text = 'password123';

    controller.login();

    expect(Get.currentRoute, '/dashboard');
  });
  WidgetsFlutterBinding.ensureInitialized();
  await InitialBinding.init(); // Initialize offline storage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      home: LoginScreen(),
    );
  }
}