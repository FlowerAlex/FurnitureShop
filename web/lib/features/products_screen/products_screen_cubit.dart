import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/utils/table_section.dart';
import 'package:logging/logging.dart';

part 'products_screen_cubit.freezed.dart';

class ProductsScreenCubit extends Cubit<ProductsScreenState> {
  ProductsScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ProductsScreenStateReady());

  final CQRS _cqrs;
  final _logger = Logger('ProductsScreenCubit');

  Future<void> fetch({int page = 0}) async {
    final state = this.state;

    if (state is! ProductsScreenStateReady) {
      return;
    }

    if (page != 0) {
      if (page < 0 || page >= (state.totalCount - 1) / pageSize) {
        return;
      }
    }

    try {
      final result = await _cqrs.get(
        GetAllProducts(
          pageNumber: page,
          pageSize: pageSize,
          sortByDescending: false,
          sortBy: ProductsSortFieldDTO.name,
        ),
      );

      emit(
        state.copyWith(
          currentPage: page,
          totalCount: result.totalCount,
          products: {
            ...state.products,
            page: result.items,
          },
        ),
      );
    } catch (err, st) {
      _logger.severe(err, st);

      emit(
        ProductsScreenStateError(
          error: err.toString(),
        ),
      );
    }
  }
}

@freezed
class ProductsScreenState with _$ProductsScreenState {
  const factory ProductsScreenState.ready({
    @Default(<int, List<ProductDTO>>{}) Map<int, List<ProductDTO>> products,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = ProductsScreenStateReady;
  const factory ProductsScreenState.error({
    required String error,
  }) = ProductsScreenStateError;
}

extension ProductsScreenStateReadyEx on ProductsScreenStateReady {
  List<ProductDTO> get currentPageProducts => products[currentPage] ?? [];
}
