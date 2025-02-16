import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

import '../../blocs/blocs.dart';
import '../../data/models/product_model.dart';
import '../../routs/route_pages.dart';
import '../../utils/asset_manager.dart';
import '../widgets/widgets.dart';

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
          // onPressed: () => context.goNamed(Routes.HOME_ROUTE),
          onPressed: () {
            // context.pop();
            context.goNamed(Routes.HOME_ROUTE);
          },
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
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is SingleProductFetchSuccess) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // thumbnail display
                  AspectRatio(
                    aspectRatio: 3 / 3,
                    child: CachedNetworkImage(
                      imageUrl: state.products.imageGallery?.first.url ??
                          AssetManager.THUMBNAIL_PLACEHOLDER,
                      fit: BoxFit.fill,
                      // fit: BoxFit.cover,
                    ),
                  ),

                  // title & price Bar
                  ListTile(
                    title: BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) => Text(
                            state is CategoryFetchSuccess
                                ? state.category.title ?? ''
                                : 'No Category')),
                    titleTextStyle: themeText.labelSmall
                        ?.copyWith(color: themeColor.outline),
                    subtitle: Text('Nike Club Fleece'),
                    subtitleTextStyle: themeText.titleLarge?.copyWith(
                      color: themeColor.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Price',
                          style: themeText.labelSmall
                              ?.copyWith(color: themeColor.outline),
                        ),
                        Text(
                          '\$200.00',
                          style: themeText.titleLarge?.copyWith(
                              color: themeColor.onSurface,
                              fontWeight: FontWeight.w800),
                        ),

                        // image gallery
                      ],
                    ),
                  ),

                  _buildProductImageGallery(
                    layout.size.width * 0.2,
                  ),

                  // variants gallery
                  _buildProductVariantGallery(null),

                  // product description
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: themeText.titleMedium?.copyWith(
                              color: themeColor.onSurface,
                              fontWeight: FontWeight.w600),
                        ),
                        ReadMoreText(
                          "ljldjfljlskdjf dsfjl dsfjl ldjsf lkjdlf jdfl dfjljdf l"
                                  "ljdfl "
                                  "dfljljfl "
                                  "sjdfljlksdfj lsdjfl"
                                  "dsjfljlkjdf"
                                  "" ??
                              'No Details Available',
                          style: themeText.bodyMedium
                              ?.copyWith(color: themeColor.outline),
                          textAlign: TextAlign.justify,
                          trimMode: TrimMode.Line,
                          trimLines: 5,
                          moreStyle: themeText.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: themeColor.tertiary),
                          lessStyle: themeText.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: themeColor.tertiary),
                          trimCollapsedText: 'Show More',
                          trimExpandedText: 'Show Less',
                        )
                      ],
                    ),
                  ),

                  // product reviews
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews',
                            style: themeText.titleMedium?.copyWith(
                                color: themeColor.onSurface,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'View All',
                            style: themeText.labelSmall
                                ?.copyWith(color: themeColor.outline),
                          ),
                        ],
                      )),
                  const Column(
                    children: [
                      ProductReviewCard(
                        name: 'Javed Umar',
                        date: '13 Sep 2023',
                        ratingPoint: 3.8,
                        review:
                            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words',
                      )
                    ],
                  ),

                  Gap(10.h),

                  // Add review button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final id = 20;
                            // context.pushNamed(Routes.ADD_REVEIW, extra: {'id':id});
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              themeColor.tertiary,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Write Review',
                                style: themeText.labelMedium?.copyWith(
                                  color: themeColor.onTertiary,
                                ),
                              ),
                              const Gap(8),
                              SvgPicture.asset(AssetManager.EDIT_PEN)
                            ],
                          ),
                        ),
                        Gap(10.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ProductFetchFailed) {
            return Column(
              children: [
                LottieBuilder.asset(AssetManager.ERROR_ANIM),
                const Gap(20),
                Text(
                  state.message,
                  style:
                      themeText.labelMedium!.copyWith(color: themeColor.error),
                ),
              ],
            );
          } else {
            return const Column(
              children: [Text("Not Found any page")],
            );
          }
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            tileColor: themeColor.surfaceContainerHighest,
            title: Text(
              'Total Price',
              style: themeText.labelLarge?.copyWith(
                color: themeColor.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'with VAT,SD',
              style: themeText.labelSmall?.copyWith(
                color: themeColor.outline,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: Text(
              '210',
              style: themeText.labelLarge?.copyWith(
                color: themeColor.onSurfaceVariant,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          FullWidthButton(
            buttonText: 'Add to Cart',
            textStyle: themeText.titleMedium?.copyWith(
              color: themeColor.onSecondary,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductImageGallery(
    double height,
  ) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10 + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Gap(10.w);
          }

          return AspectRatio(
            aspectRatio: 3 / 3,
            child: CachedNetworkImage(
              imageUrl: null ?? AssetManager.THUMBNAIL_PLACEHOLDER,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Gap(10.w);
        },
      ),
    );
  }

  Widget _buildProductVariantGallery(List<Variant>? variant) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Gap(10),
      ProductVariantCategoryItem(
          title: "Size", items: ["S", "M", "L", "XL", "XXL"])
    ]);
  }
}
