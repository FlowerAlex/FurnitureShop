import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:leancode_contracts/leancode_contracts.dart';
import 'package:logging/logging.dart';

part 'orders_screen_cubit.freezed.dart';

const pageSize = 10;

class OrdersScreenCubit extends Cubit<OrdersScreenState> {
  OrdersScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const OrdersScreenState.initial());

  final CQRS _cqrs;

  final _logger = Logger('OrdersScreenCubit');

  Future<void> init() async {
    try {
      final orders = await _cqrs.get(
        MyOrders(
          pageSize: pageSize,
          pageNumber: 0,
          sortByDescending: false,
          sortBy: MyOrdersSortFieldDTO.orderedDate,
          filterBy: {},
        ),
      );

      emit(
        OrdersScreenState.ready(
          orders: {for (final item in orders.items) item.id: item},
          currentPage: 0,
          totalCount: orders.totalCount,
        ),
      );
    } catch (err, st) {
      _logger.severe("Couldn't load list of orders", err, st);
      emit(
        OrdersScreenStateError(
          error: err.toString(),
        ),
      );
    }
  }

  Future<void> fetch({
    int page = 0,
  }) async {
    final state = this.state;
    if (state is! OrdersScreenStateReady) {
      return;
    }

    try {
      final orders = await _cqrs.get(
        MyOrders(
          pageNumber: page,
          pageSize: pageSize,
          sortByDescending: false,
          sortBy: MyOrdersSortFieldDTO.orderedDate,
          filterBy: {},
        ),
      );

      emit(
        state.copyWith(
          currentPage: page,
          totalCount: orders.totalCount,
          orders: {for (final item in orders.items) item.id: item},
        ),
      );
    } catch (err, st) {
      _logger.severe("Couldn't load list of orders", err, st);
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
  const factory OrdersScreenState.initial() = OrdersScreenStateInitial;

  const factory OrdersScreenState.ready({
    required Map<String, OrderDTO> orders,
    required int currentPage,
    required int totalCount,
  }) = OrdersScreenStateReady;

  const factory OrdersScreenState.error({
    required String error,
  }) = OrdersScreenStateError;
}
