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

  Future<void> fetch({int page = 0}) async {
    final state = this.state;

    if (state is! ProductsScreenReadyState) {
      emit(const ProductsScreenReadyState(isLoading: true));
    } else {
      emit(ProductsScreenReadyState(
        isLoading: true,
        categories: state.categories,
        products: state.products,
        currentPage: state.currentPage,
        totalCount: state.totalCount,
        activeCategory: state.activeCategory,
      ));
    }

    if (state is! ProductsScreenReadyState) {
      return;
    }

    try {
      final categories = await _cqrs.get(GetAllCategories());
      final products = await _cqrs.get(
        GetAllProducts(
          pageNumber: page,
          pageSize: pageSize,
          sortByDescending: false,
          sortBy: ProductsSortFieldDTO.name,
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
          activeCategory: allCategories,
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

  void changeActiveCategory(CategoryDTO activeCategory) {
    final state = this.state;

    if (state is! ProductsScreenReadyState) {
      return;
    }

    emit(state.copyWith(activeCategory: activeCategory));
  }

  Future<void> likeProduct(String productId) async {
    try {
      // _cqrs.run();
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
      await _cqrs.run(AddProductsToShoppingCart(
        productId: productId,
        amount: 1,
      ));

      // await fetch(page: state.currentPage); uncomment when ProductDTO will have fields isFavorite and isInShoppingCart
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
  }) = ProductsScreenReadyState;
  const factory ProductsScreenState.error({
    required String errorMessage,
  }) = ProductsScreenErrorState;
}
