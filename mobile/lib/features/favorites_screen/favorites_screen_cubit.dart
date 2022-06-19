import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';

part 'favorites_screen_cubit.freezed.dart';

const pageSize = 10;

final allCategories = CategoryDTO(id: 'all_categories_id', name: 'all');

class FavoritesScreenCubit extends Cubit<FavoritesScreenState> {
  FavoritesScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const FavoritesLoadingState());

  final CQRS _cqrs;

  Future<void> fetch({int page = 0}) async {
    try {
      final categories = await _cqrs.get(GetAllCategories());
      final shoppingCart = await _cqrs.get(ShoppingCart());

      if (shoppingCart != null) {
        emit(
          FavoritesReadyState(
            shoppingCart: shoppingCart,
            categories: categories,
            activeCategory: allCategories,
          ),
        );
      } else {
        emit(const FavoritesErrorState(error: 'Could not load data'));
      }
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
}

@freezed
class FavoritesScreenState with _$FavoritesScreenState {
  const factory FavoritesScreenState.loading() = FavoritesLoadingState;
  const factory FavoritesScreenState.ready({
    required ShoppingCartDTO shoppingCart,
    required CategoryDTO activeCategory,
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = FavoritesReadyState;
  const factory FavoritesScreenState.error({
    required String error,
  }) = FavoritesErrorState;
}
