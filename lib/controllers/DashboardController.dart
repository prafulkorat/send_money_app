import 'package:flutter/material.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class DashboardController extends GetxController {
  final UserModel user = UserModel(username: "user", password: "pass");
  final isBalanceHidden = false.obs;
  final amountController = TextEditingController();

  void toggleBalance() {
    isBalanceHidden.value = !isBalanceHidden.value;
  }

  void sendMoney() async {
    final amount = double.tryParse(amountController.text);
    if (amount != null && amount > 0) {
      user.balance -= amount;
      final success = await ApiService.postTransaction({'amount': amount});
      if (success) {
        Get.snackbar("Success", "Money sent successfully!");
      } else {
        Get.snackbar("Error", "Failed to send money");
      }
    } else {
      Get.snackbar("Error", "Invalid amount");
    }
  }

  void logout() {
    Get.offAllNamed('/');
  }
}
