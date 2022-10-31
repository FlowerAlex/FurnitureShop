import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/cqrs/app_cqrs.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/data/contracts_copy_with.dart';
import 'package:logging/logging.dart';

part 'products_screen_cubit.freezed.dart';

const pageSize = 10;

class ProductsScreenCubit extends Cubit<ProductsScreenState> {
  ProductsScreenCubit({
    required AppCQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductsScreenReadyState());

  final AppCQRS _cqrs;

  final _logger = Logger('ProductsScreenCubit');

  Future<void> init({
    String? search,
    CategoryDTO? activeCategory,
  }) async {
    try {
      final categories = await _cqrs.get(AllCategories());

      final products = await _cqrs.get(
        AllProducts(
          pageNumber: 0,
          pageSize: pageSize,
          sortByDescending: false,
          sortBy: ProductsSortFieldDTO.name,
          categoryId: activeCategory?.id,
          filterBy: search,
        ),
      );

      emit(
        ProductsScreenReadyState(
          categories: categories,
          currentPage: 0,
          totalCount: products.totalCount,
          products: {for (final item in products.items) item.id: item},
          activeCategory: activeCategory,
          search: search ?? '',
        ),
      );
    } catch (err, st) {
      _logger.severe("Couldn't load the products or categories", err, st);
      emit(
        ProductsScreenErrorState(
          errorMessage: err.toString(),
        ),
      );
    }
  }

  Future<void> fetch({
    int productsPage = 0,
  }) async {
    final state = this.state;
    if (state is! ProductsScreenReadyState) {
      return;
    }

    try {
      final products = await _cqrs.get(
        AllProducts(
          pageNumber: productsPage,
          pageSize: pageSize,
          sortByDescending: false,
          sortBy: ProductsSortFieldDTO.name,
          categoryId: state.activeCategory?.id,
          filterBy: state.search,
        ),
      );

      emit(
        state.copyWith(
          categories: state.categories,
          currentPage: productsPage,
          totalCount: products.totalCount,
          products: {
            ...state.products,
            for (final item in products.items) item.id: item
          },
          activeCategory: state.activeCategory,
        ),
      );
    } catch (err, st) {
      _logger.severe("Couldn't load the products or categories", err, st);
      emit(
        ProductsScreenErrorState(
          errorMessage: err.toString(),
        ),
      );
    }
  }

  Future<void> updateFilters({
    String? search,
  }) async {
    final state = this.state;
    if (state is! ProductsScreenReadyState) {
      return;
    }

    emit(
      state.copyWith(
        search: search ?? state.search,
      ),
    );

    await init(
      search: search,
      activeCategory: state.activeCategory,
    );
  }

  Future<void> changeActiveCategory(CategoryDTO? activeCategory) async {
    final state = this.state;

    if (state is! ProductsScreenReadyState) {
      return;
    }

    await init(
      search: state.search,
      activeCategory: activeCategory,
    );
  }

  Future<void> likeProduct(String productId) async {
    try {
      final state = this.state;
      if (state is! ProductsScreenReadyState) {
        return;
      }

      final product = state.products.values
          .firstWhere((element) => element.id == productId);

      final wasInFavorites = product.inFavourites;
      if (wasInFavorites) {
        await _cqrs.run(RemoveFromFavourites(productId: productId));
      } else {
        await _cqrs.run(AddToFavourites(productId: productId));
      }

      emit(
        state.copyWith(
          products: {
            for (final product in state.products.entries)
              product.key: product.value.copyWith(
                inFavourites: product.key == productId
                    ? !wasInFavorites
                    : product.value.inFavourites,
              )
          },
        ),
      );
    } catch (e, _) {
      emit(ProductsScreenErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> addProductToShoppingCart(String productId) async {
    final state = this.state;

    if (state is! ProductsScreenReadyState) {
      return;
    }
    try {
      final product = state.products.values
          .firstWhere((element) => element.id == productId);
      final wasInShoppingCart = product.inShoppingCart;

      if (wasInShoppingCart) {
        await _cqrs.run(
          RemoveProductFromShoppingCart(
            productId: productId,
          ),
        );
      } else {
        await _cqrs.run(
          AddProductsToShoppingCart(
            productId: productId,
            amount: 1,
          ),
        );
      }

      emit(
        state.copyWith(
          products: {
            for (final product in state.products.entries)
              product.key: product.value.copyWith(
                inShoppingCart: product.key == productId
                    ? !wasInShoppingCart
                    : product.value.inShoppingCart,
              )
          },
        ),
      );
    } catch (e, _) {
      emit(ProductsScreenErrorState(errorMessage: e.toString()));
    }
  }
}

@freezed
class ProductsScreenState with _$ProductsScreenState {
  const factory ProductsScreenState.ready({
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(<String, ProductDTO>{}) Map<String, ProductDTO> products,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
    CategoryDTO? activeCategory,
    @Default(false) bool isLoading,
    @Default('') String search,
  }) = ProductsScreenReadyState;
  const factory ProductsScreenState.error({
    required String errorMessage,
  }) = ProductsScreenErrorState;
}
