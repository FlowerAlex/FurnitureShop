import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'Reviews',
          style: theme.textTheme.headline6,
        ),
      ],
    );
  }
}
