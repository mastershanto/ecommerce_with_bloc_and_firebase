// To parse this JSON data, do
//
//     final variantItem = variantItemFromJson(jsonString);

import 'dart:convert';

VariantItem variantItemFromJson(String str) => VariantItem.fromJson(json.decode(str));

String variantItemToJson(VariantItem data) => json.encode(data.toJson());

class VariantItem {
  final List<String>? items;

  VariantItem({
    this.items,
  });

  factory VariantItem.fromJson(Map<String, dynamic> json) => VariantItem(
    items: json["items"] == null ? [] : List<String>.from(json["items"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
  };
}
