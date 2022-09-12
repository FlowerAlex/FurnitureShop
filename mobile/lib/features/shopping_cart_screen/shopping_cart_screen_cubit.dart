import 'package:cqrs/cqrs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/data/contracts_copy_with.dart';
import 'package:logging/logging.dart';

part 'shopping_cart_screen_cubit.freezed.dart';

const pageSize = 10;

final allCategories = CategoryDTO(id: 'all_categories_id', name: 'all');

class ShoppingCartScreenCubit extends Cubit<ShoppingCartScreenState> {
  ShoppingCartScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ShoppingCartScreenState.loading());

  final CQRS _cqrs;

  final _logger = Logger('ShoppingCartScreenCubit');

  Future<void> fetch({int page = 0}) async {
    try {
      final categories = await _cqrs.get(AllCategories());
      final result = await _cqrs.get(ShoppingCart());

      if (result != null) {
        emit(
          ShoppingCartScreenState.ready(
            shoppingCartProducts: result.shoppingCartProducts
                .map((e) => SelectableShoppingCartProduct(product: e))
                .toList(),
            categories: categories,
            activeCategory: allCategories,
          ),
        );
      } else {
        emit(const ShoppingCartScreenState.error(error: 'Could not load data'));
      }
    } catch (e) {
      emit(ShoppingCartScreenState.error(error: e.toString()));
    }
  }

  void changeActiveCategory(CategoryDTO? activeCategory) {
    final state = this.state;
    if (state is! ShoppingCartScreenStateReady) {
      return;
    }

    emit(state.copyWith(activeCategory: activeCategory));
  }

  Future<void> removeProductFromShoppingCart(String productId) async {
    try {
      await _cqrs.run(RemoveProductFromShoppingCart(productId: productId));
      await fetch();
    } catch (e, _) {
      emit(ShoppingCartScreenState.error(error: e.toString()));
    }
  }

  Future<void> selectProduct({
    required String productId,
    required bool selected,
  }) async {
    final state = this.state;
    if (state is! ShoppingCartScreenStateReady) {
      return;
    }

    emit(
      state.copyWith(
        shoppingCartProducts: [
          for (final shoppingCartProduct in state.shoppingCartProducts)
            productId == shoppingCartProduct.product.product.id
                ? shoppingCartProduct.copyWith(selected: selected)
                : shoppingCartProduct
        ],
      ),
    );
  }

  Future<void> changeCountOfProducts({
    required String productId,
    required int count,
  }) async {
    final state = this.state;
    if (state is! ShoppingCartScreenStateReady) {
      return;
    }

    emit(
      state.copyWith(
        shoppingCartProducts: [
          for (final shoppingCartProduct in state.shoppingCartProducts)
            productId == shoppingCartProduct.product.product.id
                ? shoppingCartProduct.copyWith(
                    product: shoppingCartProduct.product.copyWith(
                      amount: count,
                    ),
                  )
                : shoppingCartProduct
        ],
      ),
    );
  }

  Future<void> buySelectedProducts() async {
    final state = this.state;
    if (state is! ShoppingCartScreenStateReady) {
      return;
    }

    try {
      final selectedProducts =
          state.shoppingCartProducts.where((element) => element.selected);

      await _cqrs.run(
        CreateOrder(
          newOrder: CreateOrderDTO(
            products: selectedProducts
                .map(
                  (e) => ProductInOrderCreateDTO(
                    id: e.product.product.id,
                    amount: e.product.amount,
                  ),
                )
                .toList(),
          ),
        ),
      );

      emit(
        state.copyWith(
          shoppingCartProducts: state.shoppingCartProducts
              .where((element) => !element.selected)
              .toList(),
        ),
      );
    } catch (err, st) {
      _logger.severe("Can't by products", err, st);
      emit(ShoppingCartScreenStateError(error: err.toString()));
    }
  }
}

@freezed
class ShoppingCartScreenState with _$ShoppingCartScreenState {
  const factory ShoppingCartScreenState.loading() =
      ShoppingCartScreenStateLoading;
  const factory ShoppingCartScreenState.ready({
    required List<SelectableShoppingCartProduct> shoppingCartProducts,
    CategoryDTO? activeCategory,
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = ShoppingCartScreenStateReady;
  const factory ShoppingCartScreenState.error({
    required String error,
  }) = ShoppingCartScreenStateError;
}

@freezed
class SelectableShoppingCartProduct with _$SelectableShoppingCartProduct {
  const factory SelectableShoppingCartProduct({
    required ShoppingCartProductDTO product,
    @Default(false) bool selected,
  }) = _SelectableShoppingCartProduct;
}
