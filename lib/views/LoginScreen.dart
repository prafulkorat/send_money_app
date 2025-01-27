import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/AuthController.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: authController.usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: authController.passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: authController.login,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
