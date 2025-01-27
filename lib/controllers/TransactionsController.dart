import 'package:flutter_app/models/TransactionModel.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class TransactionsController extends GetxController {
  final transactions = <TransactionModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchTransactions();
    super.onInit();
  }

  void fetchTransactions() async {
    isLoading.value = true;
    final data = await ApiService.fetchTransactions();
    transactions.assignAll(data.map((e) => TransactionModel.fromJson(e)).toList());
    isLoading.value = false;
  }
}
