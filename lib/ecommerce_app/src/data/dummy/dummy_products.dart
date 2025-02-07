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
  ProductModel(
      productName: "Winter Shoe",
      productPrice: 450.00,
      imageGallery: [
        ImageGallery(
            title: "Image-1",
            url:
                "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/84277969-d71a-4c50-93c0-ee2808e53616/NIKE+WOODSIDE+2+HIGH+%28GS%29.png"),
      ],
      variant: [
        Variant(
          category: "Size",
          items: [
            Item(title: "36", description: ""),
            Item(title: "39", description: ""),
            Item(title: "40", description: ""),
            Item(title: "41", description: ""),
            Item(title: "42", description: ""),
            Item(title: "43", description: ""),
          ],
        ),
      ],
      productDetails: """
Product Type : Shoe
Fabric : PP Jersey
Sleeve : Long Sleeve
GSM : 260-280 GSM
Gender : Men
Color : White
""",
      brand: ""),
];
