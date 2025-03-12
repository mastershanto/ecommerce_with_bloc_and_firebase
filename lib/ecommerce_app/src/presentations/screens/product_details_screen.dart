import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

import '../../blocs/blocs.dart';
import '../../data/models/product_model.dart';
import '../../data/models/review_model.dart';
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
                          state.products.productName ?? "",
                          style: themeText.labelSmall
                              ?.copyWith(color: themeColor.outline),
                        ),
                        Text(
                          '\$${state.products.productPrice}',
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
                  _buildProductVariantGallery(state.products.variant),

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
                        Container(
                          alignment: Alignment.centerLeft,
                          child: ReadMoreText(
                            "${state.products.productDetails}" ??
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
                          ),
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

                  BlocBuilder<RatingBloc, RatingState>(
                    builder: (context, state) {


                      return Column(
                        children: state is ReviewFetchSuccess
                            ? List.generate(
                                state.reviews.length,
                                (index) {
                                  return ProductReviewCard(
                                    imageUrl: state.reviews[index].userProfilePic,
                                    name: state.reviews[index].userName,
                                    // date: DateFormat('yyyy-MM-dd').format(state.reviews[index].createdAt).toDate(),
                                    date: DateFormat(DateFormat.YEAR_MONTH_DAY)
                                        .format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            state.reviews[index].createdAt
                                                .millisecondsSinceEpoch)),
                                    ratingPoint: state.reviews[index].rating,
                                    review: state.reviews[index].review,
                                  );
                                },
                              )
                            : [],
                      );
                    },
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
                            context.read<RatingBloc>().add(RequestAddReview());
                            final id = state.productId;
                            context.pushNamed(Routes.ADD_REVIEW_ROUTE,
                                extra: {'id': id});
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
              children: [Text("Not found any page")],
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
            trailing: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                final vat = state is SingleProductFetchSuccess
                    ? state.products.vatSd ?? 0.00
                    : 0;
                final price = state is SingleProductFetchSuccess
                    ? state.products.productPrice ?? 0.00
                    : 0.0;
                return Text(
                  state is SingleProductFetchSuccess
                      ? "\$${price + (price / 100 * vat)}"
                      : "",
                  style: themeText.labelLarge?.copyWith(
                    color: themeColor.onSurfaceVariant,
                    fontWeight: FontWeight.w900,
                  ),
                );
              },
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
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          variant!.length,
          (index) => ProductVariantCategoryItem(
              title: variant[index].category ?? "",
              items: variant[index].items as List<Item>),
          // ["S", "M", "L", "XL", "XXL"]
        ));
  }
}


