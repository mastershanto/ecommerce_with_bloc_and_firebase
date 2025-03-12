import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../blocs/blocs.dart';

import '../../routs/route_pages.dart';
import '../../utils/asset_manager.dart';
import '../widgets/widgets.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final themeColor = Theme.of(context).colorScheme;
    final layout = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Review',
          style: themeText.titleLarge,
        ),
        centerTitle: true,
        leading: IconButton.filled(
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(themeColor.surfaceContainerHighest),
          ),
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocConsumer<RatingBloc, RatingState>(
        builder: (context, state) {
          if (state is RatingInitial) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How was your experience ?',
                    style: themeText.titleMedium?.copyWith(
                      color: themeColor.onSurface,
                    ),
                  ),
                  TextField(
                    controller: state.reviewController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        fillColor: themeColor.surfaceContainerHighest,
                        filled: true,
                        hintText: 'Describe your experience?',
                        hintStyle: themeText.bodySmall?.copyWith(
                          color: themeColor.outline,
                        )),
                    maxLines: 10,
                    style: themeText.labelSmall?.copyWith(
                      color: themeColor.onSurfaceVariant,
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    'Star',
                    style: themeText.titleMedium?.copyWith(
                      color: themeColor.onSurface,
                    ),
                  ),
                  Gap(10.h),
                  BlocBuilder<RatingBloc, RatingState>(
  builder: (context, state) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: 0.0,
                        // initialRating: context.read<RatingBloc>().rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          context.read<RatingBloc>().add(UpdateRatingPoint(rating));
                          // context.read<RatingBloc>().rating = rating;
                        },
                      ),
                      Gap(20),
                      Text(
                        "${state is RatingPointChangedSuccessfully ? state.ratingPoint : context.read<RatingBloc>().rating.toString()}",
                          style: themeText.titleLarge!.copyWith(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber)),
                      // BlocBuilder<RatingBloc, RatingState>(
                      //   builder: (context, state)=> Text(
                      //       state is RatingPointChangedSuccessfully ? state.ratingPoint : context.read<RatingBloc>().rating.toString(),
                      //         style: themeText.titleLarge!.copyWith(
                      //             fontSize: 38,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.amber)),
                      // )
                    ],
                  );
  },
),
                  Gap(20.h),
                  SizedBox(
                    height: layout.size.height * .14,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return;
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: 10),
                  ),
                ],
              ),
            );
          } else if (state is RatingLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: themeColor.primary,
              ),
            );
          } else if (state is RatingSubmitSuccess) {
            return AlertDialog(
              title: Text(
                'Review Submitted!',
                style: themeText.titleMedium,
              ),
              content: LottieBuilder.asset(AssetManager.SUCCESS_ANIM),
            );
          } else {
            return Container();
          }
        },
        listener: (context, state) {
          if (state is RatingSubmitSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Thanks for submitting review!',
                  style: themeText.labelMedium
                      ?.copyWith(color: themeColor.onErrorContainer),
                ),
                backgroundColor: Colors.green,
              ),
            );

            Future.delayed(const Duration(seconds: 2), () {
              context.pushReplacement(Routes.EXPLORE_REVIEWS_ROUTE);
            });
          }

          if (state is RatingSubmitFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Thanks for submitting review!',
                  style: themeText.labelMedium
                      ?.copyWith(color: themeColor.onErrorContainer),
                ),
                backgroundColor: themeColor.errorContainer,
              ),
            );
          }
        },
      ),

      //Pricing addition
      bottomNavigationBar: BlocBuilder<RatingBloc, RatingState>(
        builder: (context, state) {
          return FullWidthButton(
              onTap: () => state is RatingInitial
                  ? context.read<RatingBloc>().add(
                        SubmitReview(state.reviewController.text, id),
                      )
                  : null,
              buttonChild: state is RatingLoading
                  ? LoadingAnimationWidget.staggeredDotsWave(
                      color: themeColor.onPrimaryContainer, size: 30)
                  : null,
              buttonText: 'Submit Review');
        },
      ),
    );
  }
}
