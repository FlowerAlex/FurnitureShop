import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';

part 'products_screen_cubit.freezed.dart';

const pageSize = 10;

final allCategories = CategoryDTO(id: 'all_categories_id', name: 'all');

class ProductsScreenCubit extends Cubit<ProductsScreenState> {
  ProductsScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductsScreenReadyState());

  final CQRS _cqrs;

  Future<void> fetch({
    int page = 0,
    bool clearOldData = false,
  }) async {
    var state = this.state;

    if (state is! ProductsScreenReadyState) {
      emit(const ProductsScreenReadyState(isLoading: true));
    } else {
      state = state.copyWith(
        isLoading: true,
        products: !clearOldData ? state.products : [],
        currentPage: !clearOldData ? state.currentPage : 0,
        totalCount: !clearOldData ? state.totalCount : 0,
      );

      emit(state);
    }

    if (state is! ProductsScreenReadyState) {
      return;
    }

    try {
      final categories = await _cqrs.get(AllCategories());
      final products = await _cqrs.get(
        AllProducts(
          pageNumber: page,
          pageSize: pageSize,
          sortByDescending: false,
          sortBy: ProductsSortFieldDTO.name,
          categoryId: state.activeCategory?.id == allCategories.id
              ? null
              : state.activeCategory?.id,
          filterBy: state.search,
        ),
      );

      emit(
        ProductsScreenReadyState(
          categories: categories,
          currentPage: page,
          totalCount: products.totalCount,
          products: page != 0
              ? [...state.products, ...products.items]
              : products.items,
          activeCategory: state.activeCategory,
        ),
      );
    } catch (e, _) {
      emit(
        ProductsScreenErrorState(
          errorMessage: e.toString(),
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

    emit(state.copyWith(
      search: search ?? state.search,
    ));

    await fetch(clearOldData: true);
  }

  Future<void> changeActiveCategory(CategoryDTO activeCategory) async {
    final state = this.state;

    if (state is! ProductsScreenReadyState) {
      return;
    }

    emit(state.copyWith(activeCategory: activeCategory));

    await fetch(clearOldData: true);
  }

  Future<void> likeProduct(String productId) async {
    try {
      final state = this.state;
      if (state is! ProductsScreenReadyState) {
        return;
      }

      try {
        final product =
            state.products.firstWhere((element) => element.id == productId);

        if (product.inFavourites) {
          await _cqrs.run(RemoveFromFavourites(productId: productId));
        } else {
          await _cqrs.run(AddToFavourites(productId: productId));
        }

        await fetch(page: state.currentPage);
      } catch (e, _) {
        emit(ProductsScreenErrorState(errorMessage: e.toString()));
      }
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
      final product =
          state.products.firstWhere((element) => element.id == productId);

      if (product.inShoppingCart) {
        await _cqrs.run(RemoveProductFromShoppingCart(
          productId: productId,
        ));
      } else {
        await _cqrs.run(AddProductsToShoppingCart(
          productId: productId,
          amount: 1,
        ));
      }

      await fetch(page: state.currentPage);
    } catch (e, _) {
      emit(ProductsScreenErrorState(errorMessage: e.toString()));
    }
  }
}

@freezed
class ProductsScreenState with _$ProductsScreenState {
  const factory ProductsScreenState.ready({
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(<ProductDTO>[]) List<ProductDTO> products,
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
