import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';

part 'shopping_cart_screen_cubit.freezed.dart';

const pageSize = 10;

final allCategories = CategoryDTO(id: 'all_categories_id', name: 'all');

class ShoppingCartScreenCubit extends Cubit<ShoppingCartScreenState> {
  ShoppingCartScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ShoppingCartLoadingState());

  final CQRS _cqrs;

  Future<void> fetch({int page = 0}) async {
    try {
      final categories = await _cqrs.get(GetAllCategories());
      final result = await _cqrs.get(
        GetShoppingCart(
          // pageNumber: page,
          // pageSize: pageSize,
          shoppingCartId: '',
        ),
      ); // TODO: update this when contracts will be updated

      emit(
        ShoppingCartReadyState(
          shoppingCart: result,
          categories: categories,
          activeCategory: allCategories,
        ),
      );
    } catch (e) {
      emit(ShoppingCartErrorState(error: e.toString()));
    }
  }

  void changeActiveCategory(CategoryDTO activeCategory) {
    final state = this.state;
    if (state is! ShoppingCartReadyState) {
      return;
    }

    emit(state.copyWith(activeCategory: activeCategory));
  }
}

@freezed
class ShoppingCartScreenState with _$ShoppingCartScreenState {
  const factory ShoppingCartScreenState.loading() = ShoppingCartLoadingState;
  const factory ShoppingCartScreenState.ready({
    required ShoppingCartDTO shoppingCart,
    required CategoryDTO activeCategory,
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = ShoppingCartReadyState;
  const factory ShoppingCartScreenState.error({
    required String error,
  }) = ShoppingCartErrorState;
}
