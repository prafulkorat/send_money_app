class TransactionModel {
  final int id;
  final double amount;
  final String date;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? 0,
      amount: (json['amount'] != null ? json['amount'].toDouble() : 0.0),
      date: json['date'] ?? 'N/A',
    );
  }
}
