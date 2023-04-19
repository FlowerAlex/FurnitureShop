import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/products_screen/product_form_body/product_form_body.dart';
import 'package:furniture_shop/features/products_screen/product_tile.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/utils/dialogs/app_dialog.dart';
import 'package:furniture_shop/utils/dialogs/confirm_dialog.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:furniture_shop/utils/table_section.dart';
import 'package:intl/intl.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ProductsScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final currentProduct = state.currentProduct;

    final modelId = currentProduct?.modelId;
    final cubit = context.read<ProductsScreenCubit>();

    if (currentProduct == null) {
      return const SizedBox();
    }

    return Card(
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Product details',
              ),
            ),
            const Divider(height: 0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (modelId != null) ...[
                  Card(
                    key: ValueKey(modelId),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: ModelViewer(
                        src:
                            'https://furniturestorage.blob.core.windows.net/models/$modelId',
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
                SizedBox(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product name: ${currentProduct.name}'),
                      Text('Price: ${currentProduct.price.toString()}\$'),
                      if (currentProduct.description.isNotEmpty)
                        Text(
                          'Description: ${currentProduct.description}',
                        ),
                    ].spaced(8),
                  ),
                ),
              ],
            ),
            TableSection<ReviewDTO>(
              title: const Text('Reviews'),
              currentPage: state.currentReviewsPage,
              itemBuilder: (review) => ReviewTile(review: review),
              items: state.reviews[state.currentReviewsPage] ?? [],
              onNextPressed: () => cubit.updateReviews(
                reivewsPage: state.currentReviewsPage + 1,
              ),
              onPrevPressed: () => cubit.updateReviews(
                reivewsPage: state.currentReviewsPage - 1,
              ),
              totalCount: state.totalReviewsCount,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        await AppDialog.show<void>(
                          context: context,
                          titleText: 'Edit product form',
                          child: ProductFormBody(
                            editingProduct: currentProduct,
                          ),
                        );
                      },
                      child: const Text('Edit product'),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        final res = await ConfirmDialog.show(
                          context: context,
                          titleText: 'Deleting product',
                          description:
                              'Are you sure want to delete product: ${currentProduct.name}',
                        );
                        if (res != null && res) {
                          await cubit.deleteProduct(
                            productId: currentProduct.id,
                          );
                        }
                      },
                      child: const Text('Delete product'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
