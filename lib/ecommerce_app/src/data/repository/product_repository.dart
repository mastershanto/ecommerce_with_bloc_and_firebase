import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/blocs/blocs.dart';
import 'package:flutter/foundation.dart';

import '../models/product_model.dart';
import '../models/review_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchProducts() async {
    final List<ProductModel> productList = [];
    final productsSnapshot = await _firestore.collection("products").get();
    // DocumentReference ref = FirebaseFirestore.instance.collection('products').doc();

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

      if (data.data() != null) {
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

  Future<ReviewModel?> submitReviewAndRating(ReviewModel review) async {
    try {
      final data = await _firestore
          .collection('products')
          .doc(review.productId)
          .collection('reviews')
          .add(review.toJson());
      // final data = await _firestore.collection('reviews').add(review.toJson());

      final document = await data.get();
      if (document.data() != null) {
        final review = ReviewModel.fromJson(document.data()!);
        return review;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error: $e");
      throw Exception(e);
    }
  }

  // Future<ReviewModel?> FetchProductReview(String productId) async {
  //   try {
  //     final data = await _firestore.collection('reviews').doc(productId).get();
  //     // final data = await _firestore.collection('reviews').add(review.toJson());
  //
  //     final document = await data.get();
  //     if(document.data() != null){
  //       final review = ReviewModel.fromJson(document.data()!);
  //       return review;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint("Error: $e");
  //     throw Exception(e);
  //   }
  // }

  Future<List<ReviewModel>?> fetchProductReviews(String productId) async {


    // CollectionReference revi = await FirebaseFirestore.instance.collection('products')
    //     .doc(productId)
    //     .collection('reviews');
    //
    // QuerySnapshot snapshot = await revi.get();
    //
    // for (var doc in snapshot.docs) {
    //   print(doc.data()); // Each review's data
    // }


    List <ReviewModel> reviews = [];

    try {
      CollectionReference data = await FirebaseFirestore.instance.collection('products')
          .doc(productId)
          .collection('reviews');

      QuerySnapshot snapshot = await data.get();
if(snapshot.docs.isNotEmpty){
  for (var doc in snapshot.docs) {
    print(doc.data()); //
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>; // ✅ Convert properly
    reviews.add(ReviewModel.fromJson(data));
  }
}
      return reviews;

    } catch (e) {
      debugPrint('Error: $e');
      throw Exception(e);
    }

    //
    // List <ReviewModel> reviews = [];
    //
    // try {
    //   final data = await _firestore.collection('products').doc(productId).collection("reviews").get();
    //
    //   if(data.docs.isNotEmpty){
    //     for(var review in data.docs){
    //       reviews.add(ReviewModel.fromJson(review.data()));
    //     }
    //   }
    //   return reviews;
    //
    // } catch (e) {
    //   debugPrint('Error: $e');
    //   throw Exception(e);
    // }
  }

  // Future<List<ReviewModel>> fetchProductReviews(String productId) async {
  //   try {
  //     final data = await _firestore
  //         .collection('products')
  //         .doc(productId)
  //         .collection("reviews")
  //         .get();
  //
  //
  //
  //     // final data = await _firestore
  //     //     .collection('products')
  //     //     .doc(productId)
  //     //     .collection("reviews")
  //     //     .orderBy('created_at', descending: true)
  //     //     .limit(20) // Adjust as needed
  //     //     .get();
  //     return data.docs
  //         .map((review) => ReviewModel.fromJson(review.data()))
  //         .toList();
  //   } on FirebaseException catch (e) {
  //     debugPrint('Firebase Error: ${e.message}');
  //     return []; // Return an empty list instead of throwing an error
  //   } catch (e) {
  //     debugPrint('Unexpected Error: $e');
  //     return []; // Handle other unexpected errors gracefully
  //   }
  // }
  // Future<List<ReviewModel>> fetchProductReviews(String productId) async {
  //   List<ReviewModel> reviews = [];
  //
  //   try {
  //     final data = await _firestore
  //         .collection('products')
  //         .doc(productId)
  //         .collection("reviews")
  //         .get();
  //
  //     if (data.docs.isNotEmpty) {
  //       reviews = data.docs.map((doc) {
  //         return ReviewModel?.fromJson(doc.data()); // Ensure null handling inside `fromJson`
  //       }).toList();
  //     }
  //
  //     return reviews;
  //   } catch (e, stackTrace) {
  //     debugPrint('Error fetching reviews: $e\n$stackTrace');
  //     rethrow; // Keeps original error context
  //   }
  // }


}
