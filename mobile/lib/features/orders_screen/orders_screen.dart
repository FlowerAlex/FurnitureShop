import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/use_paging_controller.dart';
import 'package:furniture_shop/features/orders_screen/order_tile.dart';
import 'package:furniture_shop/features/orders_screen/orders_screen_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrdersScreen extends HookWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<OrdersScreenCubit>();
    final state = cubit.state;

    return Scaffold(
      body: state.map(
        initial: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        ready: (state) => Column(
          children: [
            Expanded(
              child: PagedListView<int, OrderDTO>(
                pagingController: usePagingController<int, OrderDTO>(
                  firstPageKey: 0,
                  hasMore:
                      state.totalCount > (state.currentPage + 1) * pageSize,
                  items: state.orders.values.toList(),
                  fetchPage: (page) => cubit.fetch(page: page),
                  getNextPageKey: (_) => state.currentPage + 1,
                ),
                builderDelegate: PagedChildBuilderDelegate<OrderDTO>(
                  itemBuilder: (context, order, index) {
                    return OrderTile(
                      order: order,
                    );
                  },
                  firstPageProgressIndicatorBuilder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            )
          ],
        ),
        error: (state) => Center(
          child: Text(state.error),
        ),
      ),
    );
  }
}

class OrdersScreenRoute extends MaterialPageRoute<void> {
  OrdersScreenRoute()
      : super(
          builder: (context) => BlocProvider(
            create: (context) =>
                OrdersScreenCubit(cqrs: context.read())..init(),
            child: const OrdersScreen(),
          ),
        );
}
