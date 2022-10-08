import 'package:flutter/material.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/widgets/product_tile.dart';
import 'package:intl/intl.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key? key,
    required this.review,
  }) : super(key: key);

  final ReviewDTO review;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat(
      'dd/MM/y',
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text('User: ${review.userName}')),
                AvaregeScore(
                  rating: review.rating,
                ),
              ],
            ),
            Text('Created date: ${df.format(review.createdDate)}'),
            const SizedBox(
              height: 4,
            ),
            Text('Review: ${review.text}'),
          ],
        ),
      ),
    );
  }
}
