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
        super(ProductsScreenInitialState(activeCategory: allCategories));

  final CQRS _cqrs;

  Future<void> fetch({int page = 0}) async {
    emit(ProductsScreenLoadingState(
      categories: state.categories,
      products: state.products,
      currentPage: state.currentPage,
      totalCount: state.totalCount,
      activeCategory: state.activeCategory,
    ));
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
    } catch (e) {
      emit(
        ProductsScreenErrorState(
          categories: state.categories,
          currentPage: state.currentPage,
          totalCount: state.totalCount,
          products: state.products,
          activeCategory: state.activeCategory,
        ),
      );
    }
  }

  Future<void> changeActiveCategory(CategoryDTO activeCategory) async {
    emit(state.copyWith(activeCategory: activeCategory));
  }
}

@freezed
class ProductsScreenState with _$ProductsScreenState {
  factory ProductsScreenState.initial({
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(<ProductDTO>[]) List<ProductDTO> products,
    @Default(1) int currentPage,
    @Default(0) int totalCount,
    required CategoryDTO activeCategory,
  }) = ProductsScreenInitialState;
  const factory ProductsScreenState.loading({
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(<ProductDTO>[]) List<ProductDTO> products,
    @Default(1) int currentPage,
    @Default(0) int totalCount,
    required CategoryDTO activeCategory,
  }) = ProductsScreenLoadingState;
  const factory ProductsScreenState.ready({
    required List<CategoryDTO> categories,
    required List<ProductDTO> products,
    required int currentPage,
    required int totalCount,
    required CategoryDTO activeCategory,
  }) = ProductsScreenReadyState;
  const factory ProductsScreenState.error({
    required List<CategoryDTO> categories,
    required List<ProductDTO> products,
    required int currentPage,
    required int totalCount,
    required CategoryDTO activeCategory,
  }) = ProductsScreenErrorState;
}
