import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<dynamic>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch transactions');
    }
  }

  static Future<bool> postTransaction(Map<String, dynamic> transaction) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      body: jsonEncode(transaction),
    );
    return response.statusCode == 201;
  }
}
