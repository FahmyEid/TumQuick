import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ProductsService {
  static const String _url =
      'https://rehabko.abdaealmasi.store/api/products';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List list = decoded['products'];

      return list.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
