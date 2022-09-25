import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/widgets/product_tile.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderDTO order;

  @override
  Widget build(BuildContext context) {
    final deliveredDate = order.deliveredDate;

    return Card(
      child: ExpandablePanel(
        collapsed: const SizedBox(),
        expanded: _OrderTileBody(
          products: order.products,
        ),
        header: _OrderTileHeader(order: order, deliveredDate: deliveredDate),
      ),
    );
  }
}

class _OrderTileHeader extends StatelessWidget {
  const _OrderTileHeader({
    Key? key,
    required this.order,
    required this.deliveredDate,
  }) : super(key: key);

  final OrderDTO order;
  final DateTime? deliveredDate;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat(
      'dd/MM/y',
    );
    final deliveredDate = this.deliveredDate;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Ordered date: '),
                  Text(df.format(order.orderedDate)),
                ],
              ),
              if (deliveredDate != null)
                Row(
                  children: [
                    const Text('Delivered date: '),
                    Text(df.format(deliveredDate)),
                  ],
                ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Delivery address: '),
                  Text(order.address),
                ],
              ),
              Row(
                children: [
                  const Text('Total price: '),
                  Text(order.price.toString())
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OrderTileBody extends StatelessWidget {
  const _OrderTileBody({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<ProductInOrderDTO> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final product in products)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ProductTile(
                  product: product,
                ),
              ),
              Text('Amount of products: ${product.amount.toString()}'),
            ],
          ),
      ],
    );
  }
}
