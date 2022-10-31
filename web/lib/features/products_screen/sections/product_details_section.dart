import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/products_screen/product_form_body/product_form_body.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/utils/dialogs/app_dialog.dart';
import 'package:furniture_shop/utils/dialogs/confirm_dialog.dart';
import 'package:furniture_shop/utils/spaced.dart';
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
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: ModelViewer(
                        src:
                            'https://furnitureshopstorage.blob.core.windows.net/models/$modelId',
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
                Column(
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
              ],
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
