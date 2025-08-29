// lib/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String _baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> productList = data['products'];
      return productList.map((json) => Product.fromJson(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load products');
    }
  }
}