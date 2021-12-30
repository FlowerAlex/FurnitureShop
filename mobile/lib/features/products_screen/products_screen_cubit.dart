import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';

part 'products_screen_cubit.freezed.dart';

final allCategories = CategoryDTO(id: 'all_categories_id', name: 'all');

class ProductsScreenCubit extends Cubit<ProductsScreenState> {
  ProductsScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(ProductsScreenInitialState(activeCategory: allCategories));

  final CQRS _cqrs;

  Future<void> fetch() async {
    emit(ProductsScreenLoadingState(
      categories: state.categories,
      products: state.products,
      activeCategory: state.activeCategory,
    ));
    try {
      final categories = await _cqrs.get(GetAllCategories());
      final products = await _cqrs.get(GetAllProducts());

      emit(
        ProductsScreenReadyState(
          categories: categories,
          products: products,
          activeCategory: allCategories,
        ),
      );
    } catch (e) {
      emit(
        ProductsScreenErrorState(
          categories: state.categories,
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
    required CategoryDTO activeCategory,
  }) = ProductsScreenInitialState;
  const factory ProductsScreenState.loading({
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(<ProductDTO>[]) List<ProductDTO> products,
    required CategoryDTO activeCategory,
  }) = ProductsScreenLoadingState;
  const factory ProductsScreenState.ready({
    required List<CategoryDTO> categories,
    required List<ProductDTO> products,
    required CategoryDTO activeCategory,
  }) = ProductsScreenReadyState;
  const factory ProductsScreenState.error({
    required List<CategoryDTO> categories,
    required List<ProductDTO> products,
    required CategoryDTO activeCategory,
  }) = ProductsScreenErrorState;
}
