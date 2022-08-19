import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/products_screen/product_form_body/product_form_body.dart';
import 'package:furniture_shop/features/products_screen/product_tile.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/utils/dialogs/app_dialog.dart';
import 'package:furniture_shop/utils/table_section.dart';

class ProductsTableSection extends StatelessWidget {
  const ProductsTableSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ProductsScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsScreenCubit>();

    return TableSection<ProductDTO>(
      title: 'Products list',
      items: state.currentPageProducts,
      currentPage: state.currentPage,
      totalCount: state.totalCount,
      onPrevPressed: () => cubit.fetch(page: state.currentPage - 1),
      onNextPressed: () => cubit.fetch(page: state.currentPage + 1),
      createItemButtonLabel: 'Create new product',
      createItemPressed: () async {
        await AppDialog.show<void>(
          context: context,
          titleText: 'Create product form',
          child: const ProductFormBody(),
        );

        await cubit.fetch();
      },
      itemBuilder: (product) => _ProductItem(
        product: product,
        isCurrent: product.id == state.currentProduct?.id,
        onPressed: () => cubit.changeCurrentProduct(productId: product.id),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    Key? key,
    required this.product,
    required this.isCurrent,
    this.onPressed,
  }) : super(key: key);

  final ProductDTO product;
  final VoidCallback? onPressed;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final previewPhotoId = product.previewPhotoId;

    return Material(
      color: isCurrent ? AppColors.grey1 : null,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              const SizedBox(width: 20),
              if (previewPhotoId != null) ...[
                Image.network(
                  'https://furnitureshopstorage.blob.core.windows.net/images/$previewPhotoId',
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 20),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product.name),
                  AvaregeScore(rating: product.averageRating ?? 0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
