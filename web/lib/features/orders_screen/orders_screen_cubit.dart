import 'package:cqrs/cqrs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/utils/table_section.dart';
import 'package:logging/logging.dart';

part 'orders_screen_cubit.freezed.dart';

class OrdersScreenCubit extends Cubit<OrdersScreenState> {
  OrdersScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const OrdersScreenState.ready());

  final CQRS _cqrs;
  final _logger = Logger('OrdersScreenCubit');

  Future<void> fetch({int page = 0}) async {
    final state = this.state;

    if (state is! OrdersScreenStateReady) {
      return;
    }

    if (page != 0) {
      if (page < 0 || page >= (state.totalCount - 1) / pageSize) {
        return;
      }
    }

    try {
      final result = await _cqrs.get(
        AllOrders(
          pageNumber: page,
          pageSize: pageSize,
          filterBy: {},
          sortByDescending: false,
        ),
      );

      emit(
        state.copyWith(
          currentPage: page,
          totalCount: result.totalCount,
          orders: {for (final item in result.items) item.id: item},
        ),
      );
    } catch (err, st) {
      _logger.severe(err, st);

      emit(
        OrdersScreenStateError(
          error: err.toString(),
        ),
      );
    }
  }
}

@freezed
class OrdersScreenState with _$OrdersScreenState {
  const factory OrdersScreenState.ready({
    @Default(<String, OrderDTO>{}) Map<String, OrderDTO> orders,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = OrdersScreenStateReady;
  const factory OrdersScreenState.error({
    required String error,
  }) = OrdersScreenStateError;
}
