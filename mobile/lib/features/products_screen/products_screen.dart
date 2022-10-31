import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/use_paging_controller.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/common/widgets/product_tile.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsScreen extends HookWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductsScreenCubit>();

    return Scaffold(
      body: cubit.state.map(
        ready: (state) => SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Products',
                withFilter: true,
                onSearchChanged: (value) => cubit.updateFilters(search: value),
                categories: state.categories,
                onChangeCategoryPressed: cubit.changeActiveCategory,
                activeCategoryId: state.activeCategory?.id,
              ),
              Expanded(
                child: PagedListView<int, ProductDTO>(
                  pagingController: usePagingController<int, ProductDTO>(
                    firstPageKey: 0,
                    hasMore:
                        state.totalCount > (state.currentPage + 1) * pageSize,
                    items: state.products.values.toList(),
                    fetchPage: (page) => cubit.fetch(page: page),
                    getNextPageKey: (_) => state.currentPage + 1,
                  ),
                  builderDelegate: PagedChildBuilderDelegate<ProductDTO>(
                    itemBuilder: (context, product, index) {
                      return ProductTile(
                        product: product,
                        children: [
                          InkWell(
                            onTap: () => cubit.likeProduct(product.id),
                            child: product.inFavourites
                                ? Assets.icons.selectedHeart.image()
                                : Assets.icons.heart.image(),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () =>
                                cubit.addProductToShoppingCart(product.id),
                            child: product.inShoppingCart
                                ? Assets.icons.selectedAddToCart.image()
                                : Assets.icons.addToCart.image(),
                          ),
                        ],
                      );
                    },
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        error: (state) => Center(
          child: Text('Something went wrong\nError: ${state.errorMessage}'),
        ),
      ),
    );
  }
}
