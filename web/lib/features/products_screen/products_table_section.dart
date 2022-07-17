import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/products_screen/product_details/product_details_body.dart';
import 'package:furniture_shop/features/products_screen/product_tile.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:furniture_shop/utils/app_dialog.dart';
import 'package:furniture_shop/utils/spaced.dart';

class ProductsTableSection extends StatelessWidget {
  const ProductsTableSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ProductsScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final currentPageProducts = state.currentPageProducts;
    final cubit = context.read<ProductsScreenCubit>();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text('Products list'),
        ),
        Card(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final product in currentPageProducts)
                        _ProductItem(
                          product: product,
                          onPressed: () {},
                        )
                    ].spacedWith(const Divider(height: 0)),
                  ),
                ),
              ),
              _ProductsTableNavigationBar(
                currentPage: state.currentPage,
                totalCount: state.totalCount,
                onPrevPressed: () => cubit.fetch(page: state.currentPage - 1),
                onNextPressed: () => cubit.fetch(page: state.currentPage + 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    Key? key,
    required this.product,
    this.onPressed,
  }) : super(key: key);

  final ProductDTO product;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final imageUrl = product.productInfo.previewPhotoURL;

    return Material(
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Image.network(
                'https://images.pexels.com/photos/5591708/pexels-photo-5591708.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product.productInfo.name),
                  AvaregeScore(rating: product.productInfo.averageRating ?? 0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductsTableNavigationBar extends StatelessWidget {
  const _ProductsTableNavigationBar({
    Key? key,
    required this.currentPage,
    required this.totalCount,
    required this.onPrevPressed,
    required this.onNextPressed,
  }) : super(key: key);

  final int currentPage;
  final int totalCount;

  final VoidCallback onPrevPressed;
  final VoidCallback onNextPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              AppDialog.show<ProductDTO>(
                context: context,
                titleText: 'Create product form',
                child: const ProductDetailsBody(),
              );
            },
            child: const Text(
              'Create product',
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPrevPressed,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            icon: Assets.icons.arrowLeft.svg(),
          ),
          const SizedBox(width: 8),
          Text(
            '${(currentPage * pageSize + 1).toString()}-${min((currentPage + 1) * pageSize, totalCount)} from ${totalCount.toString()}',
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onNextPressed,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            icon: Assets.icons.arrowRight.svg(),
          ),
        ],
      ),
    );
  }
}
