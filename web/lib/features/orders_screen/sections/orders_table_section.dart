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
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const Text('Orders list'),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(child: Text('Product name')),
                Expanded(child: Text('Product price')),
                Expanded(child: Text('Quantity')),
                Expanded(child: Text('Average rating')),
                Expanded(child: Text('Order date')),
                Expanded(child: Text('Delivery date')),
                Expanded(child: Text('Total price')),
              ],
            ),
          ],
        ),
      ),
      items: state.orders.values.toList(),
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
    final complaint = order.complaint;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final product in order.products)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(child: Text(product.name)),
                      Expanded(child: Text(product.price.toString())),
                      Expanded(child: Text(product.amount.toString())),
                      if (product.averageRating != null)
                        Expanded(
                          child: AvaregeScore(
                            rating: product.averageRating!,
                          ),
                        )
                      else
                        const Spacer(),
                      Expanded(
                        child: Text(order.orderedDate.toString()),
                      ),
                      if (order.deliveredDate != null)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              order.deliveredDate!.toString(),
                            ),
                          ),
                        )
                      else
                        const Spacer(),
                      Expanded(child: Text(order.price.toString())),
                    ].spaced(8),
                  ),
                ),
                if (complaint != null) Text('Complaint: ${complaint.text}'),
              ],
            ),
        ],
      ),
    );
  }
}
