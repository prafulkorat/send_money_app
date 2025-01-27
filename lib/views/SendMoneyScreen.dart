import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/DashboardController.dart';
import 'package:get/get.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(title: const Text("Send Money")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: dashboardController.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: dashboardController.sendMoney,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
