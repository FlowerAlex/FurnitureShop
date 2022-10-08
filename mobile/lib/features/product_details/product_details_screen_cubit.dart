import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/cqrs/app_cqrs.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/data/contracts_copy_with.dart';
import 'package:logging/logging.dart';

part 'product_details_screen_cubit.freezed.dart';

const pageSize = 10;

class ProductDetailsScreenCubit extends Cubit<ProductDetailsScreenState> {
  ProductDetailsScreenCubit({
    required this.productId,
    required AppCQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductDetailsScreenStateLoading());

  final AppCQRS _cqrs;
  final String productId;

  final _logger = Logger('ProductDetailsScreenCubit');

  Future<void> init() async {
    try {
      final productDetails = await _cqrs.get(ProductById(id: productId));
      final reviews = await _cqrs.get(
        AllReviews(
          productId: productId,
          pageNumber: 0,
          pageSize: pageSize,
        ),
      );

      if (productDetails != null) {
        emit(
          ProductDetailsScreenState.ready(
            productDetails: productDetails,
            myReviewData: reviews.myReviewData,
            reviews: {for (final review in reviews.items) review.id: review},
            currentPage: 0,
            totalCount: reviews.totalCount,
          ),
        );
      } else {
        emit(
          const ProductDetailsScreenState.error(
            errorMessage: 'Product was not found',
          ),
        );
      }
    } catch (err, st) {
      _logger.warning('Could not load product details', err, st);
      emit(ProductDetailsScreenState.error(errorMessage: err.toString()));
    }
  }

  Future<void> fetch({required int page}) async {
    final state = this.state;
    if (state is! ProductDetailsScreenStateReady) {
      return;
    }

    try {
      final reviews = await _cqrs.get(
        AllReviews(
          productId: productId,
          pageNumber: 0,
          pageSize: pageSize,
        ),
      );

      emit(
        ProductDetailsScreenState.ready(
          productDetails: state.productDetails,
          myReviewData: reviews.myReviewData,
          reviews: {for (final review in reviews.items) review.id: review},
          currentPage: page,
          totalCount: reviews.totalCount,
        ),
      );
    } catch (err, st) {
      _logger.warning('Could not load product details', err, st);
      emit(ProductDetailsScreenState.error(errorMessage: err.toString()));
    }
  }

  Future<void> likeProduct() async {
    final state = this.state;
    if (state is! ProductDetailsScreenStateReady) {
      return;
    }

    if (!state.productDetails.inFavourites) {
      await _cqrs.run(AddToFavourites(productId: state.productDetails.id));
      emit(
        state.copyWith(
          productDetails: state.productDetails.copyWith(
            inFavourites: true,
          ),
        ),
      );
    } else {
      await _cqrs.run(RemoveFromFavourites(productId: state.productDetails.id));
      emit(
        state.copyWith(
          productDetails: state.productDetails.copyWith(
            inFavourites: false,
          ),
        ),
      );
    }
  }

  Future<void> addProductToShoppingCart() async {
    final state = this.state;
    if (state is! ProductDetailsScreenStateReady) {
      return;
    }

    if (!state.productDetails.inShoppingCart) {
      await _cqrs.run(
        AddProductsToShoppingCart(
          productId: state.productDetails.id,
          amount: 1,
        ),
      );

      emit(
        state.copyWith(
          productDetails: state.productDetails.copyWith(
            inShoppingCart: true,
          ),
        ),
      );
    } else {
      await _cqrs.run(
        RemoveProductFromShoppingCart(productId: state.productDetails.id),
      );

      emit(
        state.copyWith(
          productDetails: state.productDetails.copyWith(
            inShoppingCart: false,
          ),
        ),
      );
    }
  }

  void updateReview({
    String? myReviewText,
    double? myReviewRating,
  }) {
    final state = this.state;
    if (state is! ProductDetailsScreenStateReady) {
      return;
    }

    emit(
      state.copyWith(
        myReviewData: state.myReviewData?.copyWith(
              text: myReviewText ?? state.myReviewData?.text,
              rating: myReviewRating ?? state.myReviewData?.rating,
            ) ??
            ReviewDataDTO(
              text: myReviewText ?? '',
              rating: myReviewRating ?? 0,
              createdDate: DateTime.now(),
              productId: productId,
            ),
      ),
    );
  }

  Future<void> publishReview() async {
    final state = this.state;
    if (state is! ProductDetailsScreenStateReady) {
      return;
    }
    final myReviewData = state.myReviewData;
    if (myReviewData == null) {
      return;
    }

    try {
      final reviewData = ReviewDataDTO(
        createdDate: DateTime.now(),
        productId: productId,
        text: myReviewData.text,
        rating: myReviewData.rating,
      );

      await _cqrs.run(
        AddReview(
          reviewData: reviewData,
        ),
      );

      emit(
        state.copyWith(
          myReviewData: reviewData,
        ),
      );
    } catch (err, st) {
      _logger.severe("Couldn't add review", err, st);
      emit(ProductDetailsScreenState.error(errorMessage: err.toString()));
    }
  }
}

@freezed
class ProductDetailsScreenState with _$ProductDetailsScreenState {
  const factory ProductDetailsScreenState.loading() =
      ProductDetailsScreenStateLoading;
  const factory ProductDetailsScreenState.ready({
    required ProductDetailsDTO productDetails,
    required Map<String, ReviewDTO> reviews,
    required ReviewDataDTO? myReviewData,
    required int currentPage,
    required int totalCount,
  }) = ProductDetailsScreenStateReady;
  const factory ProductDetailsScreenState.error({
    required String errorMessage,
  }) = ProductDetailsScreenStateError;
}
