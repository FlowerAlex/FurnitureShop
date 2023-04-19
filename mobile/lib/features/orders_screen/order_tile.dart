import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_field.dart';
import 'package:furniture_shop/features/common/widgets/product_tile.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.order,
    required this.onCreateComplaintPressed,
    required this.onResolveComplaintPressed,
  }) : super(key: key);

  final OrderDTO order;
  final void Function(String value) onCreateComplaintPressed;
  final VoidCallback? onResolveComplaintPressed;

  @override
  Widget build(BuildContext context) {
    final deliveredDate = order.deliveredDate;

    return Card(
      child: ExpandablePanel(
        collapsed: const SizedBox(),
        expanded: _OrderTileBody(
          products: order.products,
          complaint: order.complaint,
          onCreateComplaintPressed: onCreateComplaintPressed,
          onResolveComplaintPressed: onResolveComplaintPressed,
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

class _OrderTileBody extends HookWidget {
  const _OrderTileBody({
    Key? key,
    required this.products,
    required this.complaint,
    required this.onCreateComplaintPressed,
    required this.onResolveComplaintPressed,
  }) : super(key: key);

  final List<ProductInOrderDTO> products;
  final ComplaintDTO? complaint;

  final void Function(String value) onCreateComplaintPressed;
  final VoidCallback? onResolveComplaintPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final complaintController = useTextEditingController();
    final complaint = this.complaint;
    final onResolveComplaintPressed = this.onResolveComplaintPressed;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        if (complaint == null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Text(
                  'Create complaint',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: complaintController,
                        hintText: 'Enter value',
                      ),
                    ),
                    const SizedBox(width: 12),
                    AppTextButton(
                      onPressed: () => onCreateComplaintPressed(
                        complaintController.text,
                      ),
                      child: const Text('Create complaint'),
                    ),
                  ],
                ),
              ],
            ),
          )
        else ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Complaint: ${complaint.text}',
                    ),
                    Text('Response: ${complaint.response ?? '-'}'),
                    Row(
                      children: [
                        const Text('Resolved: '),
                        Checkbox(value: complaint.resolved, onChanged: null),
                      ],
                    ),
                  ],
                ),
              ),
              if (!complaint.resolved && onResolveComplaintPressed != null)
                AppTextButton(
                  onPressed: onResolveComplaintPressed,
                  child: const Text('Resolve complaint'),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
