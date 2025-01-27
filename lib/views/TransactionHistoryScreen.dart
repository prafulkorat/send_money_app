import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/TransactionsController.dart';
import 'package:get/get.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionsController = Get.put(TransactionsController());

    return Scaffold(
      appBar: AppBar(title: const Text("Transaction History")),
      body: Obx(() {
        if (transactionsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: transactionsController.transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactionsController.transactions[index];
            return ListTile(
              title: Text("Amount: PHP ${transaction.amount.toStringAsFixed(2)}"),
              subtitle: Text("Date: ${transaction.date}"),
            );
          },
        );
      }),
    );
  }
}
