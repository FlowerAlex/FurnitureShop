import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';

part 'favorites_screen_cubit.freezed.dart';

const pageSize = 10;

final allCategories = CategoryDTO(id: 'all_categories_id', name: 'all');

class FavouritesScreenCubit extends Cubit<FavoritesScreenState> {
  FavouritesScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const FavoritesLoadingState());

  final CQRS _cqrs;

  Future<void> fetch({int page = 0}) async {
    var state = this.state;

    if (state is! FavoritesReadyState) {
      state = const FavoritesReadyState(
        categories: [],
        products: [],
        currentPage: 0,
        totalCount: 0,
        activeCategory: null,
      );
    }

    try {
      final categories = await _cqrs.get(GetAllCategories());
      final favoriteProducts = await _cqrs.get(MyFavourites(
        pageNumber: page,
        pageSize: pageSize,
        sortByDescending: false,
        sortBy: ProductsSortFieldDTO.name,
      ));

      emit(
        FavoritesReadyState(
          categories: categories,
          currentPage: page,
          totalCount: favoriteProducts.totalCount,
          products: page != 0
              ? [...state.products, ...favoriteProducts.items]
              : favoriteProducts.items,
          activeCategory: allCategories,
        ),
      );
    } catch (e) {
      emit(FavoritesErrorState(error: e.toString()));
    }
  }

  void changeActiveCategory(CategoryDTO activeCategory) {
    final state = this.state;
    if (state is! FavoritesReadyState) {
      return;
    }

    emit(state.copyWith(activeCategory: activeCategory));
  }

  Future<void> removeProductFromFavourites(String productId) async {
    try {
      await _cqrs.run(RemoveFromFavourites(productId: productId));
      await fetch();
    } catch (e, _) {
      emit(FavoritesErrorState(error: e.toString()));
    }
  }

  Future<void> addProductToShoppingCart(String productId) async {
    final state = this.state;

    if (state is! FavoritesReadyState) {
      return;
    }
    try {
      final product =
          state.products.firstWhere((element) => element.id == productId);

      if (product.productInfo.inShoppingCart) {
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
      emit(FavoritesErrorState(error: e.toString()));
    }
  }
}

@freezed
class FavoritesScreenState with _$FavoritesScreenState {
  const factory FavoritesScreenState.loading() = FavoritesLoadingState;
  const factory FavoritesScreenState.ready({
    required List<ProductDTO> products,
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    CategoryDTO? activeCategory,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = FavoritesReadyState;
  const factory FavoritesScreenState.error({
    required String error,
  }) = FavoritesErrorState;
}
