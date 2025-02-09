import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils/asset_manager.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final themeColor = Theme.of(context).colorScheme;
    final layout = MediaQuery.of(context);

    return Scaffold(

        appBar: AppBar(
        leading: IconButton.filled(
        style: ButtonStyle(
        backgroundColor:
        WidgetStatePropertyAll(themeColor.surfaceContainerHighest),
    ),
    onPressed: () => context.pop(),
    icon: const Icon(Icons.arrow_back),
    ),
          actions: [
            IconButton.filled(
              style: ButtonStyle(
                backgroundColor:
                WidgetStatePropertyAll(themeColor.surfaceContainerHighest),
              ),
              onPressed: () {},
              icon: SvgPicture.asset(AssetManager.CART_ICON),
            )
          ],

        ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(),

      ),

    );
  }
}
