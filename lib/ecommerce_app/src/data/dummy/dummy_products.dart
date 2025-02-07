import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/models/product_model.dart';

import '../models/brand_model.dart';

final List<ProductModel> dummyProducts = [
  ProductModel(
      productName: "Winter T-Shirt",
      productPrice: 200.00,
      imageGallery: [
        ImageGallery(
            title: "Image-1",
            url:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREbAPC2Z5mGPof84PIiIVwblqypZjTGlk7Hg&s"),
      ],
      variant: [
        Variant(
          category: "Size",
          items: [
            Item(title: "S", description: ""),
            Item(title: "M", description: ""),
            Item(title: "L", description: ""),
            Item(title: "XL", description: ""),
            Item(title: "XXL", description: ""),
          ],
        ),
      ],
      productDetails: """
Product Type : T-Shirt
Fabric : PP Jersey
Sleeve : Long Sleeve
GSM : 260-280 GSM
Gender : Men
Color : White
""",
      brand: ""),
];
