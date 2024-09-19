import 'dart:convert';

import 'package:http/http.dart' as http;

class EcommerceService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
