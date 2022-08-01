import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/data/contracts_copy_with.dart';
import 'package:logging/logging.dart';

part 'product_details_screen_cubit.freezed.dart';

class ProductDetailsScreenCubit extends Cubit<ProductDetailsScreenState> {
  ProductDetailsScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductDetailsScreenStateLoading());

  final CQRS _cqrs;

  final _logger = Logger('ProductDetailsScreenCubit');

  Future<void> init(String productId) async {
    try {
      final productDetails = await _cqrs.get(ProductById(id: productId));
      if (productDetails != null) {
        emit(ProductDetailsScreenState.ready(productDetails: productDetails));
      } else {
        emit(const ProductDetailsScreenState.error(
            errorMessage: 'Product was not found'));
      }
    } catch (err, st) {
      _logger.warning('Could not load product details', err, st);
      emit(ProductDetailsScreenState.error(errorMessage: err.toString()));
    }
  }

  Future<void> likeProduct() async {
    final state = this.state;
    if (state is! ProductDetailsScreenStateReady) {
      return;
    }

    if (!state.productDetails.inFavourites) {
      await _cqrs.run(AddToFavourites(productId: state.productDetails.id));
      emit(state.copyWith(
          productDetails: state.productDetails.copyWith(
        inFavourites: true,
      )));
    } else {
      await _cqrs.run(RemoveFromFavourites(productId: state.productDetails.id));
      emit(state.copyWith(
          productDetails: state.productDetails.copyWith(
        inFavourites: false,
      )));
    }
  }

  Future<void> addProductToShoppingCart() async {
    final state = this.state;
    if (state is! ProductDetailsScreenStateReady) {
      return;
    }

    if (!state.productDetails.inShoppingCart) {
      await _cqrs.run(
        AddProductsToShoppingCart(
          productId: state.productDetails.id,
          amount: 1,
        ),
      );

      emit(state.copyWith(
          productDetails: state.productDetails.copyWith(
        inShoppingCart: true,
      )));
    } else {
      await _cqrs.run(
          RemoveProductFromShoppingCart(productId: state.productDetails.id));

      emit(state.copyWith(
          productDetails: state.productDetails.copyWith(
        inShoppingCart: false,
      )));
    }
  }
}

@freezed
class ProductDetailsScreenState with _$ProductDetailsScreenState {
  const factory ProductDetailsScreenState.loading() =
      ProductDetailsScreenStateLoading;
  const factory ProductDetailsScreenState.ready({
    required ProductDetailsDTO productDetails,
  }) = ProductDetailsScreenStateReady;
  const factory ProductDetailsScreenState.error({
    required String errorMessage,
  }) = ProductDetailsScreenStateError;
}
