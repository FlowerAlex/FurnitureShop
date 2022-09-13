import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/orders_screen/orders_screen_cubit.dart';
import 'package:furniture_shop/features/products_screen/product_tile.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:furniture_shop/utils/table_section.dart';

class OrdersTableSection extends StatelessWidget {
  const OrdersTableSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final OrdersScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersScreenCubit>();

    return TableSection<OrderDTO>(
      title: 'Orders list',
      items: state.currentPageOrders,
      currentPage: state.currentPage,
      totalCount: state.totalCount,
      onPrevPressed: () => cubit.fetch(page: state.currentPage - 1),
      onNextPressed: () => cubit.fetch(page: state.currentPage + 1),
      itemBuilder: (order) => _OrderItem(
        order: order,
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderDTO order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text('Ordered date:${order.orderedDate}'),
                  if (order.deliveredDate != null)
                    Text('Ordered date:${order.deliveredDate}'),
                ],
              ),
              Column(
                children: [
                  for (final product in order.products)
                    ...[
                      Text('Product name: ${product.name}'),
                      Text('Product price: ${product.price}'),
                      Text('Quantity: ${product.amount}'),
                      if (product.averageRating != null)
                        AvaregeScore(rating: product.averageRating!),
                    ].spaced(8),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('Total price: ${order.price}'),
        ],
      ),
    );
  }
}
