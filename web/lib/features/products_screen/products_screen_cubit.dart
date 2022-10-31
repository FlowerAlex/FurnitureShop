import 'package:cqrs/cqrs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/utils/table_section.dart';
import 'package:logging/logging.dart';

part 'products_screen_cubit.freezed.dart';

class ProductsScreenCubit extends Cubit<ProductsScreenState> {
  ProductsScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductsScreenStateReady());

  final CQRS _cqrs;
  final _logger = Logger('ProductsScreenCubit');

  Future<void> fetch({int productsPage = 0}) async {
    final state = this.state;

    if (state is! ProductsScreenStateReady) {
      return;
    }

    if (productsPage != 0) {
      if (productsPage < 0 ||
          productsPage >= (state.totalProductsCount - 1) / pageSize) {
        return;
      }
    }

    try {
      final result = await _cqrs.get(
        AllProducts(
          pageNumber: productsPage,
          pageSize: pageSize,
          sortByDescending: false,
          sortBy: ProductsSortFieldDTO.name,
        ),
      );

      emit(
        state.copyWith(
          currentProductsPage: productsPage,
          totalProductsCount: result.totalCount,
          products: {
            ...state.products,
            productsPage: result.items,
          },
        ),
      );
    } catch (err, st) {
      _logger.severe(err, st);

      emit(
        ProductsScreenStateError(
          error: err.toString(),
        ),
      );
    }
  }

  Future<void> changeCurrentProduct({
    required String productId,
  }) async {
    final state = this.state;

    if (state is! ProductsScreenStateReady) {
      return;
    }

    final product = await _cqrs.get(ProductById(id: productId));

    final reviews = await _cqrs.get(
      AllReviews(
        productId: productId,
        pageNumber: 0,
        pageSize: pageSize,
      ),
    );

    emit(
      state.copyWith(
        currentProduct: product,
        reviews: {0: reviews.items},
        totalReviewsCount: reviews.totalCount,
        currentReviewsPage: 0,
      ),
    );
  }

  Future<void> updateReviews({
    required int reivewsPage,
  }) async {
    final state = this.state;

    if (state is! ProductsScreenStateReady) {
      return;
    }
    final currentProduct = state.currentProduct;

    if (currentProduct == null) {
      return;
    }

    if (reivewsPage != 0) {
      if (reivewsPage < 0 ||
          reivewsPage >= (state.totalReviewsCount - 1) / pageSize) {
        return;
      }
    }

    try {
      final result = await _cqrs.get(
        AllReviews(
          productId: currentProduct.id,
          pageNumber: reivewsPage,
          pageSize: pageSize,
        ),
      );

      emit(
        state.copyWith(
          currentProductsPage: reivewsPage,
          totalProductsCount: result.totalCount,
          reviews: {
            ...state.reviews,
            reivewsPage: result.items,
          },
        ),
      );
    } catch (err, st) {
      _logger.severe(err, st);

      emit(
        ProductsScreenStateError(
          error: err.toString(),
        ),
      );
    }
  }

  Future<void> deleteProduct({
    required String productId,
  }) async {
    final state = this.state;
    if (state is! ProductsScreenStateReady) {
      return;
    }

    try {
      await _cqrs.run(DeleteProduct(id: productId));
      emit(state.copyWith(currentProduct: null));
      await fetch();
    } catch (err, st) {
      _logger.severe(err, st);
      emit(ProductsScreenState.error(error: err.toString()));
      return;
    }
  }
}

@freezed
class ProductsScreenState with _$ProductsScreenState {
  const factory ProductsScreenState.ready({
    @Default(<int, List<ProductDTO>>{}) Map<int, List<ProductDTO>> products,
    ProductDetailsDTO? currentProduct,
    @Default(0) int currentProductsPage,
    @Default(0) int totalProductsCount,
    @Default(<int, List<ReviewDTO>>{}) Map<int, List<ReviewDTO>> reviews,
    @Default(0) int currentReviewsPage,
    @Default(0) int totalReviewsCount,
  }) = ProductsScreenStateReady;
  const factory ProductsScreenState.error({
    required String error,
  }) = ProductsScreenStateError;
}

extension ProductsScreenStateReadyEx on ProductsScreenStateReady {
  List<ProductDTO> get currentPageProducts =>
      products[currentProductsPage] ?? [];
}
