import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/product_model.dart';

class ProductRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchProducts() async {
    final List<ProductModel> productList = [];
    final productsSnapshot = await _firestore.collection("products").get();
    DocumentReference ref = FirebaseFirestore.instance.collection('products').doc();

    try {
      for (var product in productsSnapshot.docs) {
        productList.add(ProductModel.fromJson(product.data()));
      }
    } catch (e) {
      throw Exception(e);
    }

    return productList;
  }


  Future<ProductModel?> fetchSingleProduct(String productId) async {
    try {
      final data = await _firestore.collection('products').doc(productId).get();

      if(data.data() != null){
        final singleProduct = ProductModel.fromJson(data.data()!);
        productId = data.id;
        return singleProduct;
      } else {
        return null;
      }

    } catch (e) {
      debugPrint('Error: $e');
      throw Exception(e);
    }
  }

}