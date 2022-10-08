import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/use_paging_controller.dart';
import 'package:furniture_shop/features/product_details/product_details_screen_cubit.dart';
import 'package:furniture_shop/features/product_details/reviews_section/my_review.dart';
import 'package:furniture_shop/features/product_details/reviews_section/review_tile.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReviewsSection extends HookWidget {
  const ReviewsSection({
    Key? key,
    required this.myReviewData,
    required this.reviews,
    required this.currentPage,
    required this.totalCount,
  }) : super(key: key);

  final ReviewDataDTO? myReviewData;
  final Map<String, ReviewDTO> reviews;
  final int currentPage;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ProductDetailsScreenCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyReview(
          myReviewData: myReviewData,
          onRatingUpdated: (rating) => cubit.updateReview(
            myReviewRating: rating,
          ),
          onReviewTextUpdated: (text) => cubit.updateReview(
            myReviewText: text,
          ),
          onPublishReviewPressed: cubit.publishReview,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'Reviews',
            style: theme.textTheme.headline6,
          ),
        ),
        PagedListView<int, ReviewDTO>(
          pagingController: usePagingController<int, ReviewDTO>(
            firstPageKey: 0,
            hasMore: totalCount > (currentPage + 1) * pageSize,
            items: reviews.values.toList(),
            fetchPage: (page) => cubit.fetch(page: page),
            getNextPageKey: (_) => currentPage + 1,
          ),
          builderDelegate: PagedChildBuilderDelegate<ReviewDTO>(
            itemBuilder: (context, review, index) {
              return ReviewTile(
                review: review,
              );
            },
            firstPageProgressIndicatorBuilder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          shrinkWrap: true,
        ),
      ],
    );
  }
}
