// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String productId;
  final String? productName;
  final double? productPrice;
  final List<ImageGallery>? imageGallery;
  final List<Variant>? variant;
  final String? productDetails;
  final String? brand;
  final String? categoryId;

  ProductModel({
    required this.productId,
    this.productName,
    this.productPrice,
    this.imageGallery,
    this.variant,
    this.productDetails,
    this.brand,
    this.categoryId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json["product_id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    imageGallery: json["image_gallery"] == null ? [] : List<ImageGallery>.from(json["image_gallery"]!.map((x) => ImageGallery.fromJson(x))),
    variant: json["variant"] == null ? [] : List<Variant>.from(json["variant"]!.map((x) => Variant.fromJson(x))),
    productDetails: json["product_details"],
    brand: json["brand"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_price": productPrice,
    "image_gallery": imageGallery == null ? [] : List<dynamic>.from(imageGallery!.map((x) => x.toJson())),
    "variant": variant == null ? [] : List<dynamic>.from(variant!.map((x) => x.toJson())),
    "product_details": productDetails,
    "brand": brand,
    "category_id":categoryId,
  };
}

class ImageGallery {
  final String? title;
  final String? url;

  ImageGallery({
    this.title,
    this.url,
  });

  factory ImageGallery.fromJson(Map<String, dynamic> json) => ImageGallery(
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "url": url,
  };
}

class Variant {
  final String? category;
  final List<Item>? items;

  Variant({
    this.category,
    this.items,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    category: json["category"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  final String? title;
  final String? description;

  Item({
    this.title,
    this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}




