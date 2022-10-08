import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/resources/app_colors.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    this.children = const [],
  }) : super(key: key);

  final ProductDTO product;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    void productTilePressed() {}

    return InkWell(
      onTap: productTilePressed,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.grey3),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: '',
                    errorWidget: (context, url, dynamic error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    AvaregeScore(rating: product.averageRating ?? 0),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: children,
                        ),
                        Text(
                          '${product.price}\$',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AvaregeScore extends StatelessWidget {
  const AvaregeScore({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemSize: 26,
      unratedColor: Colors.amber.withAlpha(50),
    );
  }
}
