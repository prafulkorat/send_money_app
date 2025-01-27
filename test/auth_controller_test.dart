import 'package:flutter_app/controllers/AuthController.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test('Login with valid credentials', () {
    final controller = AuthController();
    controller.usernameController.text = 'testuser';
    controller.passwordController.text = 'password123';

    controller.login();

    expect(Get.currentRoute, '/dashboard');
  });
}
