import 'package:flutter/material.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderDTO order;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat(
      'dd/MM/y',
    );
    final deliveredDate = order.deliveredDate;

    return Card(
      child: InkWell(
        onTap: () {}, // TODO: add order details with list of products
        child: Row(
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
            // for (final product in order.products) Text(product.name),
          ],
        ),
      ),
    );
  }
}
