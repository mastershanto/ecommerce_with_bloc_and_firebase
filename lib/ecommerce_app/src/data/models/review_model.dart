// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ReviewModel reviewModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

// class ReviewModel {
//   final String? userId;
//   final String? userName;
//   final String? userProfilePic;
//   final DateTime createdAt;
//   final String? productId;
//   final String? review;
//   final double? rating;
//   final List<Image>? image;
//
//   ReviewModel({
//     this.userId,
//     this.userName,
//     this.userProfilePic,
//     required this.createdAt,
//     this.productId,
//     this.review,
//     this.rating,
//     this.image,
//   });
//
//   factory ReviewModel.fromMap(Map<String, dynamic> map) {
//     return ReviewModel(
//       userId: map['user_id'] ?? '',
//       review: map['review'] ?? '',
//       userName: map['user_name'] ?? '',
//       productId: map['product_id'] ?? '',
//       rating: (map['rating'] as num).toDouble(),
//       createdAt: map['created_at'] is String
//           ? DateTime.parse(map['created_at'])  // Handle String timestamps
//           : (map['created_at'] as Timestamp).toDate(),  // Handle Firestore timestamps
//       userProfilePic: map['user_profile_pic'],
//     );
//   }
//
//
//   factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
//     userId: json["user_id"],
//     userName: json["user_name"],
//     userProfilePic: json["user_profile_pic"],
//     productId: json["product_id"],
//     review: json["review"],
//     rating: json["rating"] != null ? json["rating"].toDouble() : 0.0, // ✅ Handle null values
//     image: json["image"] == null
//         ? []
//         : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
//     createdAt: json["created_at"] is Timestamp
//         ? json["created_at"]
//         : Timestamp.fromMillisecondsSinceEpoch(json["created_at"]), // ✅ Fix Timestamp conversion
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user_id": userId,
//     "user_name": userName,
//     "user_profile_pic": userProfilePic,
//     "product_id": productId,
//     "review": review,
//     "rating": rating,
//     "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
//     "created_at": createdAt, // ✅ Correctly store as Firestore Timestamp
//   };
// }

class ReviewModel {
  final String? userId;
  final String? userName;
  final String? userProfilePic;
  final Timestamp createdAt;
  final String? productId;
  final String? review;
  final double? rating;
  final List<Image>? image;


  ReviewModel({
    this.userId,
    this.userName,
    this.userProfilePic,
    required this.createdAt,
    this.productId,
    this.review,
    this.rating,
    this.image,

  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    userId: json["user_id"],
    userName: json["user_name"],
    userProfilePic: json["user_profile_pic"],
    productId: json["product_id"],
    review: json["review"],
    rating: json["rating"].toDouble(),
    image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
    createdAt:  json["created_at"] is Timestamp
        ? json["created_at"]
        : Timestamp.fromMillisecondsSinceEpoch(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name":userName,
    "user_profile_pic": userProfilePic,
    "product_id": productId,
    "review": review,
    "rating": rating,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
    "created_at": createdAt,
  };
}

class Image {
  final String? title;
  final String? url;

  Image({
    this.title,
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "url": url,
  };
}
