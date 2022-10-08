import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_field.dart';
import 'package:furniture_shop/features/profile_screen/profile_screen_cubit.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class MyReview extends StatelessWidget {
  const MyReview({
    Key? key,
    required this.myReviewData,
    required this.onRatingUpdated,
    required this.onReviewTextUpdated,
    required this.onPublishReviewPressed,
  }) : super(key: key);

  final ReviewDataDTO? myReviewData;
  final void Function(double) onRatingUpdated;
  final void Function(String) onReviewTextUpdated;
  final VoidCallback onPublishReviewPressed;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<ProfileScreenCubit>().state.me;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user != null
                          ? (user.username.isNotEmpty
                              ? user.username
                              : 'user.emailAddressuser.emailAddressuser.emailAddressuser.emailAddress')
                          : '',
                    ),
                    const SizedBox(height: 4),
                    const Text('Your review'),
                  ],
                ),
                RatingBar.builder(
                  initialRating: myReviewData?.rating ?? 0,
                  onRatingUpdate: onRatingUpdated,
                  itemSize: 24,
                  itemBuilder: (context, index) =>
                      Assets.icons.star.svg(color: AppColors.yellowStar),
                ),
              ],
            ),
            const SizedBox(height: 8),
            AppTextFormField(
              hintText: 'Your review',
              initialValue: myReviewData?.text,
              onChanged: onReviewTextUpdated,
            ),
            const SizedBox(height: 8),
            Center(
              child: AppTextButton(
                onPressed: onPublishReviewPressed,
                child: const Text('Publish review'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
