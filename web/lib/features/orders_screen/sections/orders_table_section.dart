import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/orders_screen/orders_screen_cubit.dart';
import 'package:furniture_shop/features/products_screen/product_tile.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:furniture_shop/utils/table_section.dart';
import 'package:furniture_shop/utils/text_button.dart';
import 'package:intl/intl.dart';

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
        onRespondComplaintPressed: (response) =>
            cubit.respondToComplaint(orderId: order.id, response: response),
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    Key? key,
    required this.order,
    required this.onRespondComplaintPressed,
  }) : super(key: key);

  final OrderDTO order;
  final void Function(String complaint)? onRespondComplaintPressed;

  @override
  Widget build(BuildContext context) {
    final complaint = order.complaint;

    final df = DateFormat(
      'dd/MM/y',
    );

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
                        child: Text(df.format(order.orderedDate)),
                      ),
                      if (order.deliveredDate != null)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              df.format(order.deliveredDate!),
                            ),
                          ),
                        )
                      else
                        const Spacer(),
                      Expanded(child: Text(order.price.toString())),
                    ].spaced(8),
                  ),
                ),
              ],
            ),
          if (complaint != null)
            _OrderComplaint(
              complaint: complaint,
              onRespondToComplaintPressed: onRespondComplaintPressed,
            ),
        ],
      ),
    );
  }
}

class _OrderComplaint extends HookWidget {
  const _OrderComplaint({
    Key? key,
    required this.complaint,
    required this.onRespondToComplaintPressed,
  }) : super(key: key);

  final ComplaintDTO complaint;
  final void Function(String complaint)? onRespondToComplaintPressed;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat(
      'dd/MM/y',
    );

    final complaintAnswerController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: [
          const Text('Complaint'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Description: ${complaint.text}'),
              Text(
                'Date: ${df.format(complaint.createdDate)}',
              ),
            ],
          ),
          if (complaint.response == null &&
              onRespondToComplaintPressed != null &&
              !complaint.resolved) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: complaintAnswerController,
                  ),
                ),
                AnimatedBuilder(
                  animation: complaintAnswerController,
                  builder: (context, _) => AppTextButton(
                    text: 'Respond to complaint',
                    onPressed: complaintAnswerController.text.isNotEmpty
                        ? () => onRespondToComplaintPressed
                            ?.call(complaintAnswerController.text)
                        : null,
                  ),
                ),
              ],
            ),
          ],
          if (complaint.response != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Response: ${complaint.response}'),
            ),
          Row(
            children: [
              const Text('Resolved: '),
              Checkbox(value: complaint.resolved, onChanged: null),
            ],
          ),
        ],
      ),
    );
  }
}
