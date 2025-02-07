import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class ProductRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchProducts() async {
    final List<ProductModel> productList = [];
    final productsSnapshot = await _firestore.collection("products").get();

    try {
      for (var product in productsSnapshot.docs) {
        productList.add(ProductModel.fromJson(product.data()));
      }
    } catch (e) {
      throw Exception(e);
    }

    return productList;
  }
}