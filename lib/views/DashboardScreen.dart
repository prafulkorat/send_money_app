import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/DashboardController.dart';
import 'package:flutter_app/views/SendMoneyScreen.dart';
import 'package:flutter_app/views/TransactionHistoryScreen.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: dashboardController.logout,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dashboardController.isBalanceHidden.value
                          ? "******"
                          : "PHP ${dashboardController.user.balance.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    IconButton(
                      onPressed: dashboardController.toggleBalance,
                      icon: Icon(dashboardController.isBalanceHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )
                  ],
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(() => const SendMoneyScreen()),
              child: const Text("Send Money"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => const TransactionHistoryScreen()),
              child: const Text("View Transactions"),
            ),
          ],
        ),
      ),
    );
  }
}
