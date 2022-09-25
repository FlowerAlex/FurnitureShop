import 'package:cached_network_image/cached_network_image.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/product_details/product_details_screen.dart';
import 'package:furniture_shop/resources/app_colors.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    this.selectable = false,
    this.selected,
    this.onSelectedChanged,
    this.children = const [],
    this.countOfProducts = 1,
    this.onCountOfProductsChanged,
  })  : assert(
          !selectable ||
              (selectable && selected != null && onSelectedChanged != null),
        ),
        super(key: key);

  final ProductDTO product;
  final List<Widget> children;

  final bool selectable;
  final bool? selected;
  final void Function(bool selected)? onSelectedChanged;

  final int countOfProducts;
  final ValueChanged<int>? onCountOfProductsChanged;

  @override
  Widget build(BuildContext context) {
    final selected = this.selected;
    final onSelectedChanged = this.onSelectedChanged;
    final onCountOfProductsChanged = this.onCountOfProductsChanged;

    void productTilePressed() {
      Navigator.of(context)
          .push(ProductDetailsScreenRoute(productId: product.id));
    }

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
                if (selectable && selected != null && onSelectedChanged != null)
                  Checkbox(
                    value: selected,
                    onChanged: (value) => onSelectedChanged(value ?? false),
                  ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl:
                        'https://furnitureshopstorage.blob.core.windows.net/images/${product.previewPhotoId}',
                    errorWidget: (context, url, dynamic error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    AvaregeScore(
                      rating: product.averageRating ?? 0,
                    ), // get from product
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
            // Text(product.productInfo.description),
            if (onCountOfProductsChanged != null)
              Container(
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: CounterButton(
                  count: countOfProducts,
                  onChange: onCountOfProductsChanged,
                  loading: false,
                ),
              ),
            const UserComment(),
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

class UserComment extends StatelessWidget {
  const UserComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
